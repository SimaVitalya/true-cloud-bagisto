<?php

namespace Webkul\Admin\Http\Controllers\Marketing\Communications;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Event;
use Webkul\Admin\DataGrids\Marketing\Communications\EmailTemplateDataGrid;
use Webkul\Admin\Http\Controllers\Controller;
use Webkul\Admin\Mail\EmailBroadcastNotification;
use Webkul\Marketing\Repositories\TemplateRepository;

class TemplateController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(protected TemplateRepository $templateRepository) {}

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        if (request()->ajax()) {
            return datagrid(EmailTemplateDataGrid::class)->process();
        }

        return view('admin::marketing.communications.templates.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('admin::marketing.communications.templates.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        $this->validate(request(), [
            'name'    => 'required',
            'status'  => 'required|in:active,inactive,draft',
            'content' => 'required',
        ]);

        Event::dispatch('marketing.templates.create.before');

        $template = $this->templateRepository->create(request()->only([
            'name',
            'status',
            'content',
        ]));

        Event::dispatch('marketing.templates.create.after', $template);

        session()->flash('success', trans('admin::app.marketing.communications.templates.create.create-success'));

        return redirect()->route('admin.marketing.communications.email_templates.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @return \Illuminate\View\View
     */
    public function edit(int $id)
    {
        $template = $this->templateRepository->findOrFail($id);
        $template->content = $this->makeContentImageUrlsAbsolute($template->content);

        return view('admin::marketing.communications.templates.edit', compact('template'));
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
     * Update the specified resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function update(int $id)
    {
        $this->validate(request(), [
            'name'    => 'required',
            'status'  => 'required|in:active,inactive,draft',
            'content' => 'required',
        ]);

        Event::dispatch('marketing.templates.update.before', $id);

        $template = $this->templateRepository->update(request()->only([
            'name',
            'status',
            'content',
        ]), $id);

        Event::dispatch('marketing.templates.update.after', $template);

        session()->flash('success', trans('admin::app.marketing.communications.templates.edit.update-success'));

        return redirect()->route('admin.marketing.communications.email_templates.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id): JsonResponse
    {
        try {
            Event::dispatch('marketing.templates.delete.before', $id);

            $this->templateRepository->delete($id);

            Event::dispatch('marketing.templates.delete.after', $id);

            return new JsonResponse([
                'message' => trans('admin::app.marketing.communications.templates.delete-success'),
            ]);
        } catch (\Exception $e) {
        }

        return new JsonResponse([
            'message' => trans('admin::app.marketing.communications.templates.delete-failed', [
                'name' => 'admin::app.marketing.communications.templates.email-template',
            ]),
        ], 400);
    }

    /**
     * Send template email to specified recipient(s).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function send(int $id, Request $request): JsonResponse
    {
        $template = $this->templateRepository->findOrFail($id);

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => trans('admin::app.marketing.communications.templates.send.validation-error'),
                'errors'  => $validator->errors(),
            ], 422);
        }

        try {
            Mail::send(new EmailBroadcastNotification(
                $template->name,
                $template->content,
                $request->input('email'),
                ''
            ));

            return response()->json([
                'success' => true,
                'message' => trans('admin::app.marketing.communications.templates.send.success'),
            ]);
        } catch (\Exception $e) {
            Log::error('Email template send failed: ' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => trans('admin::app.marketing.communications.templates.send.error'),
            ], 500);
        }
    }
}
