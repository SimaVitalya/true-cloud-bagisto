<?php

namespace Webkul\Admin\Http\Controllers;

use Illuminate\Support\Facades\Storage;

class TinyMCEController extends Controller
{
    /**
     * Storage folder path.
     *
     * @var string
     */
    private $storagePath = 'tinymce';

    /**
     * Upload file from tinymce.
     *
     * @return void
     */
    public function upload()
    {
        $media = $this->storeMedia();

        if (! empty($media)) {
            $filename = basename($media['file']);
            $serveUrl = url('files/tinymce/' . $filename);
            return response()->json([
                'location' => $serveUrl,
            ]);
        }

        return response()->json([]);
    }

    /**
     * Serve TinyMCE file from storage (public route, no symlink needed).
     *
     * @param string $filename
     * @return \Symfony\Component\HttpFoundation\StreamedResponse|\Illuminate\Http\Response
     */
    public function serve(string $filename)
    {
        $path = $this->storagePath . '/' . $filename;
        $disk = Storage::disk('public');

        if (! $disk->exists($path)) {
            abort(404);
        }

        $mime = $disk->mimeType($path) ?: 'application/octet-stream';
        $stream = $disk->readStream($path);

        return response()->stream(function () use ($stream) {
            fpassthru($stream);
            fclose($stream);
        }, 200, [
            'Content-Type' => $mime,
            'Content-Disposition' => 'inline; filename="' . $filename . '"',
        ]);
    }

    /**
     * Make URL absolute so images display in templates and emails.
     */
    private function absoluteUrl(string $url): string
    {
        if (str_starts_with($url, 'http://') || str_starts_with($url, 'https://')) {
            return $url;
        }
        return rtrim(config('app.url'), '/') . '/' . ltrim($url, '/');
    }

    /**
     * Store media.
     *
     * @return array
     */
    public function storeMedia()
    {
        if (! request()->hasFile('file')) {
            return [];
        }

        $disk = Storage::disk('public');
        $path = request()->file('file')->store($this->storagePath, 'public');

        return [
            'file'      => $path,
            'file_name' => request()->file('file')->getClientOriginalName(),
            'file_url'  => $disk->url($path),
        ];
    }
}
