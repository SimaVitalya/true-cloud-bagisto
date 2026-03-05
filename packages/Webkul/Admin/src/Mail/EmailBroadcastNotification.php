<?php

namespace Webkul\Admin\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class EmailBroadcastNotification extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @param string $emailSubject
     * @param string $emailContent
     * @param string $recipientEmail
     * @param string $recipientName
     */
    public function __construct(
        public string $emailSubject,
        public string $emailContent,
        public string $recipientEmail,
        public string $recipientName = ''
    ) {
        //
    }

    protected static function prepareContentAndInlineImages(string $html): array
    {
        $baseUrl = rtrim(config('app.url') ?: 'http://localhost', '/');
        $inlineImages = [];

        $content = preg_replace_callback(
            '#<img\s([^>]*?)src\s*=\s*([\x22\x27])([^\x22\x27]*?)\2([^>]*)>#is',
            function (array $m) use ($baseUrl, &$inlineImages): string {
                $rawUrl = trim($m[3]);
                if ($rawUrl === '') {
                    return $m[0];
                }

                $normalizedUrl = self::normalizeImageUrl($rawUrl, $baseUrl);
                $localImage = self::resolveLocalTinyMceImage($normalizedUrl);

                if ($localImage) {
                    $cid = 'broadcast-img-' . substr(sha1($localImage['path']), 0, 24);
                    $inlineImages[$cid] = [
                        'cid'  => $cid,
                        'path' => $localImage['path'],
                        'mime' => $localImage['mime'],
                    ];

                    return '<img ' . $m[1] . 'src=' . $m[2] . 'cid:' . $cid . $m[2] . $m[4] . '>';
                }

                return '<img ' . $m[1] . 'src=' . $m[2] . $normalizedUrl . $m[2] . $m[4] . '>';
            },
            $html
        );

        return [$content, array_values($inlineImages)];
    }

    /**
     * Normalize image URL and map TinyMCE storage path to the public files route.
     */
    protected static function normalizeImageUrl(string $url, string $baseUrl): string
    {
        $url = str_replace(
            ['/storage/tinymce/', 'storage/tinymce/'],
            ['/files/tinymce/', 'files/tinymce/'],
            $url
        );

        if (Str::startsWith($url, ['http://', 'https://', 'data:'])) {
            return $url;
        }

        return $baseUrl . '/' . ltrim($url, '/');
    }

    protected static function resolveLocalTinyMceImage(string $url): ?array
    {
        $path = parse_url($url, PHP_URL_PATH);
        if (! is_string($path) || $path === '') {
            return null;
        }

        if (! preg_match('#/(?:files|storage)/tinymce/([^/?\x23]+)#i', $path, $matches)) {
            return null;
        }

        $filename = rawurldecode($matches[1]);
        $disk = Storage::disk('public');
        $storagePath = 'tinymce/' . $filename;

        if (! $disk->exists($storagePath)) {
            return null;
        }

        $fullPath = $disk->path($storagePath);
        if (! is_readable($fullPath)) {
            return null;
        }

        return [
            'path' => $fullPath,
            'mime' => self::mimeType($fullPath, $filename),
        ];
    }

    protected static function resolveLogoForInlineEmbedding(): ?array
    {
        if ($logo = core()->getConfigData('general.design.admin_logo.logo_image')) {
            $fullPath = Storage::disk('public')->path($logo);

            if (is_readable($fullPath)) {
                return [
                    'path' => $fullPath,
                    'mime' => self::mimeType($fullPath, basename($fullPath)),
                ];
            }
        }

        $fallbackPath = public_path('logo.png');

        if (is_readable($fallbackPath)) {
            return [
                'path' => $fallbackPath,
                'mime' => self::mimeType($fallbackPath, basename($fallbackPath)),
            ];
        }

        return null;
    }

    /**
     * Get MIME type; fallback by extension when mime_content_type unavailable or fails.
     */
    protected static function mimeType(string $fullPath, string $filename): string
    {
        if (function_exists('mime_content_type')) {
            $mime = @mime_content_type($fullPath);
            if ($mime && $mime !== 'application/octet-stream') {
                return $mime;
            }
        }
        $ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));
        $map = [
            'jpg' => 'image/jpeg', 'jpeg' => 'image/jpeg', 'png' => 'image/png',
            'gif' => 'image/gif', 'webp' => 'image/webp', 'svg' => 'image/svg+xml',
        ];
        return $map[$ext] ?? 'application/octet-stream';
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        [$content, $inlineImages] = self::prepareContentAndInlineImages($this->emailContent);
        $embeddedLogoCid = null;
        $logo = self::resolveLogoForInlineEmbedding();

        if ($logo) {
            // Use name-based cid reference; Symfony will map it to a valid Content-ID.
            $embeddedLogoCid = 'logo-header';
            $inlineImages[] = [
                'cid'  => $embeddedLogoCid,
                'path' => $logo['path'],
                'mime' => $logo['mime'],
            ];
        }

        // Logo + content images are embedded inline (cid), so Gmail does not depend on external domain availability.
        return $this->to($this->recipientEmail)
            ->subject($this->emailSubject)
            ->view('admin::emails.email-broadcast')
            ->with([
                'emailSubject' => $this->emailSubject,
                'content' => $content,
                'recipientName' => $this->recipientName,
                'embeddedLogoCid' => $embeddedLogoCid,
                'logoDataUri' => null,
                'logoUrl' => null,
            ])
            ->withSymfonyMessage(function (\Symfony\Component\Mime\Email $message) use ($inlineImages) {
                foreach ($inlineImages as $image) {
                    if (
                        empty($image['path'])
                        || ! is_readable($image['path'])
                        || empty($image['cid'])
                    ) {
                        continue;
                    }

                    $message->embedFromPath(
                        $image['path'],
                        $image['cid'],
                        $image['mime'] ?? null
                    );
                }
            });
    }
}
