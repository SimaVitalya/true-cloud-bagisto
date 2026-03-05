<?php

namespace Webkul\Admin\Mail\Order;

use Illuminate\Mail\Mailables\Address;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Support\Facades\Storage;
use Webkul\Admin\Mail\Mailable;
use Webkul\Sales\Contracts\Order;

class CreatedNotification extends Mailable
{
    public ?string $embeddedLogoCid = null;

    /** @var array<int, string> index => cid for product images */
    public array $itemCids = [];

    public ?string $logoPath = null;
    public ?string $logoMime = null;

    /**
     * Serializable data for item embeds.
     *
     * @var array<int, array{path: string, cid: string, mime: string}>
     */
    public array $itemEmbedData = [];

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(public Order $order)
    {
        $this->order->load(['items.product.images']);

        $logo = $this->resolveLogo();
        if ($logo) {
            $this->embeddedLogoCid = 'order-logo-' . substr(sha1($logo['path']), 0, 20);
            $this->logoPath = $logo['path'];
            $this->logoMime = $logo['mime'] ?? 'image/png';
        }

        foreach ($this->resolveItemImages() as $att) {
            $this->itemCids[$att['index']] = $att['cid'];
            $this->itemEmbedData[] = [
                'path' => $att['path'],
                'cid'  => $att['cid'],
                'mime' => $att['mime'] ?? 'image/jpeg',
            ];
        }
    }

    /**
     * Register cid inline embeds at send-time (safe for queued serialization).
     *
     * @return $this
     */
    public function build()
    {
        $embeddedLogoCid = $this->embeddedLogoCid;
        $logoPath = $this->logoPath;
        $logoMime = $this->logoMime;
        $itemEmbedData = $this->itemEmbedData;

        if (! $embeddedLogoCid && empty($itemEmbedData)) {
            return $this;
        }

        return $this->withSymfonyMessage(function (\Symfony\Component\Mime\Email $message) use ($embeddedLogoCid, $logoPath, $logoMime, $itemEmbedData) {
            if ($embeddedLogoCid && $logoPath && is_readable($logoPath)) {
                $message->embedFromPath($logoPath, $embeddedLogoCid, $logoMime ?? 'image/png');
            }

            foreach ($itemEmbedData as $att) {
                if (! empty($att['path']) && ! empty($att['cid']) && is_readable($att['path'])) {
                    $message->embedFromPath($att['path'], $att['cid'], $att['mime'] ?? 'image/jpeg');
                }
            }
        });
    }

    /**
     * @return array{path: string, mime: string}|null
     */
    protected function resolveLogo(): ?array
    {
        if ($logo = core()->getConfigData('general.design.admin_logo.logo_image')) {
            $fullPath = Storage::disk('public')->path($logo);
            if (is_readable($fullPath)) {
                return [
                    'path' => $fullPath,
                    'mime' => $this->mimeType($fullPath, basename($fullPath)),
                ];
            }
        }

        $fallbackPath = public_path('logo.png');
        if (is_readable($fallbackPath)) {
            return [
                'path' => $fallbackPath,
                'mime' => $this->mimeType($fallbackPath, 'logo.png'),
            ];
        }

        return null;
    }

    /**
     * @return array<int, array{index: int, cid: string, path: string, mime: string}>
     */
    protected function resolveItemImages(): array
    {
        $out = [];
        $disk = Storage::disk('public');
        foreach ($this->order->items as $index => $item) {
            if (! $item->product || $item->product->images->isEmpty()) {
                continue;
            }

            $firstImage = $item->product->images->first();
            $path = $firstImage->path ?? null;
            if (! $path) {
                continue;
            }

            $fullPath = $disk->path($path);
            if (! is_readable($fullPath)) {
                continue;
            }

            $out[] = [
                'index' => $index,
                'cid'   => 'order-item-' . $index . '-' . substr(sha1($fullPath), 0, 10),
                'path'  => $fullPath,
                'mime'  => $this->mimeType($fullPath, basename($path)),
            ];
        }

        return $out;
    }

    protected function mimeType(string $fullPath, string $filename): string
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

        return $map[$ext] ?? 'image/jpeg';
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            to: [
                new Address(
                    core()->getAdminEmailDetails()['email'],
                    core()->getAdminEmailDetails()['name']
                ),
            ],
            subject: trans('admin::app.emails.orders.created.subject'),
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'admin::emails.orders.created',
        );
    }
}
