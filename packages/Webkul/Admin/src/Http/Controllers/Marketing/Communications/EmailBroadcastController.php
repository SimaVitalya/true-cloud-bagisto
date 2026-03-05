<?php

namespace Webkul\Admin\Http\Controllers\Marketing\Communications;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Cache;
use Webkul\Admin\Http\Controllers\Controller;
use Webkul\Admin\Mail\EmailBroadcastNotification;
use Webkul\Customer\Repositories\CustomerGroupRepository;
use Webkul\Customer\Repositories\CustomerRepository;
use Webkul\Marketing\Repositories\TemplateRepository;

class EmailBroadcastController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        protected CustomerRepository $customerRepository,
        protected CustomerGroupRepository $customerGroupRepository,
        protected TemplateRepository $templateRepository,
    ) {}

    /**
     * Display the email broadcast form.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        $customerGroups = $this->customerGroupRepository->all();
        $emailTemplates = $this->templateRepository->findWhere(['status' => 'active'])->sortBy('name')->values();
        $lastSentAt = Cache::get('email_broadcast_last_sent_at');

        // Make image URLs in template content absolute so they display in the broadcast editor
        $emailTemplates = $emailTemplates->map(function ($t) {
            $t->content = $this->makeContentImageUrlsAbsolute($t->content ?? '');
            return $t;
        });

        return view('admin::marketing.communications.email-broadcast.index', compact('customerGroups', 'emailTemplates', 'lastSentAt'));
    }

    /**
     * Make image src URLs in HTML absolute and use /files/tinymce/ so images load without symlink.
     */
    private function makeContentImageUrlsAbsolute(string $html): string
    {
        $html = preg_replace('#(https?://[^\x22\x27]+)/storage/tinymce/#', '$1/files/tinymce/', $html);
        $html = str_replace(['/storage/tinymce/', 'storage/tinymce/'], ['/files/tinymce/', 'files/tinymce/'], $html);
        $baseUrl = rtrim(config('app.url'), '/');
        return preg_replace_callback(
            '#<img([^>]*)\s+src=([\x22\x27])([^\x22\x27]+)\2#',
            function (array $m) use ($baseUrl): string {
                $url = $m[3];
                if (str_starts_with($url, 'http://') || str_starts_with($url, 'https://')) {
                    return $m[0];
                }
                $path = ltrim($url, '/');
                return '<img' . $m[1] . ' src=' . $m[2] . ($baseUrl . '/' . $path) . $m[2];
            },
            $html
        );
    }

    /**
     * Send email to customers.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function send(Request $request): JsonResponse
    {
        @set_time_limit(0);
        if (function_exists('ini_set')) {
            @ini_set('max_execution_time', '0');
        }
        \Log::info('Email broadcast request received', $request->all());
        
        $validator = Validator::make($request->all(), [
            'subject' => 'required|string|max:255',
            'content' => 'required|string',
            'recipient_type' => 'required|in:group,email',
            'customer_group_id' => 'required_if:recipient_type,group|exists:customer_groups,id',
            'email_address' => 'required_if:recipient_type,email|email',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => trans('admin::app.marketing.communications.email-broadcast.validation-error'),
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $recipients = $this->getRecipients($request);

            if (empty($recipients)) {
                return response()->json([
                    'success' => false,
                    'message' => trans('admin::app.marketing.communications.email-broadcast.no-recipients'),
                ], 400);
            }

            // Уникальные и валидные email, пропуск пустых и невалидных
            $seen = [];
            $recipients = array_values(array_filter($recipients, function ($r) use (&$seen) {
                $email = trim($r['email'] ?? '');
                if ($email === '' || ! filter_var($email, FILTER_VALIDATE_EMAIL) || isset($seen[$email])) {
                    return false;
                }
                $seen[$email] = true;
                return true;
            }));

            // Keep HTML from TinyMCE as-is (images/formatting); convert line breaks only for plain text input.
            $content = trim((string) $request->input('content', ''));
            if ($content !== '' && ! preg_match('/<[^>]+>/', $content)) {
                $content = nl2br($content);
            }

            $sentCount = 0;
            $failedCount = 0;
            $failedEmails = [];
            $firstFailedReason = null;
            // Затримка 2.5 сек — щоб вкластися в 30 сек ліміт веб-сервера (4 одержувачі ≈ 10 сек)
            $delayMs = 2500;

            @set_time_limit(0);
            foreach ($recipients as $index => $recipient) {
                if ($index > 0) {
                    usleep($delayMs * 1000);
                }
                $sent = false;
                foreach ([0, 1] as $attempt) {
                    try {
                        Mail::send(new EmailBroadcastNotification(
                            $request->input('subject'),
                            $content,
                            $recipient['email'],
                            $recipient['name'] ?? ''
                        ));
                        $sentCount++;
                        $sent = true;
                        break;
                    } catch (\Throwable $e) {
                        Log::warning('Email broadcast attempt ' . ($attempt + 1) . ' failed for ' . $recipient['email'] . ': ' . $e->getMessage());
                        if ($attempt === 0) {
                            usleep(1500000); // 1.5 сек перед повтором
                        } else {
                            $failedCount++;
                            $failedEmails[] = $recipient['email'];
                            if ($firstFailedReason === null) {
                                $firstFailedReason = $e->getMessage();
                            }
                            Log::error('Email broadcast failed for ' . $recipient['email'] . ': ' . $e->getMessage());
                        }
                    }
                }
            }

            $message = trans('admin::app.marketing.communications.email-broadcast.send-success', [
                'sent' => $sentCount,
                'failed' => $failedCount,
            ]);

            if ($sentCount > 0) {
                Cache::put('email_broadcast_last_sent_at', now()->toDateTimeString(), 60 * 24 * 365);
            }

            return response()->json([
                'success' => true,
                'message' => $message,
                'sent_count' => $sentCount,
                'failed_count' => $failedCount,
                'failed_emails' => $failedEmails,
                'first_failed_reason' => $firstFailedReason,
                'last_sent_at' => $sentCount > 0 ? now()->toDateTimeString() : Cache::get('email_broadcast_last_sent_at'),
            ]);

        } catch (\Throwable $e) {
            Log::error('Email broadcast error: ' . $e->getMessage() . "\n" . $e->getTraceAsString());

            return response()->json([
                'success' => false,
                'message' => trans('admin::app.marketing.communications.email-broadcast.send-error'),
            ], 500);
        }
    }

    /**
     * Get recipients based on request type.
     *
     * @param Request $request
     * @return array
     */
    public function getRecipients(Request $request): array
    {
        \Log::info('Getting recipients', [
            'recipient_type' => $request->recipient_type,
            'email_address' => $request->email_address,
            'customer_group_id' => $request->customer_group_id,
        ]);

        if ($request->recipient_type === 'email') {
            return [
                [
                    'email' => $request->email_address,
                    'name' => '',
                ]
            ];
        }

        // Get customers from selected group
        $customers = $this->customerRepository->findWhere([
            'customer_group_id' => $request->customer_group_id,
            'status' => 1, // Only active customers
        ]);

        \Log::info('Found customers', ['count' => $customers->count()]);

        return $customers->map(function ($customer) {
            return [
                'email' => $customer->email,
                'name' => $customer->name,
            ];
        })->toArray();
    }

    /**
     * Get customer count for a group.
     *
     * @param int $groupId
     * @return JsonResponse
     */
    public function getGroupCustomerCount(int $groupId): JsonResponse
    {
        $count = $this->customerRepository->findWhere([
            'customer_group_id' => $groupId,
            'status' => 1,
        ])->count();

        return response()->json([
            'count' => $count,
        ]);
    }

    /**
     * Get template data for broadcast form.
     */
    public function getTemplate(int $id): JsonResponse
    {
        $template = $this->templateRepository->findOrFail($id);

        return response()->json([
            'id'      => $template->id,
            'name'    => $template->name,
            'content' => $this->makeContentImageUrlsAbsolute($template->content ?? ''),
        ]);
    }
}
