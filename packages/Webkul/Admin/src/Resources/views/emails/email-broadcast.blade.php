@component('admin::emails.layout', [
    'embeddedLogoCid' => $embeddedLogoCid ?? null,
    'logoDataUri' => $logoDataUri ?? null,
    'logoUrl' => $logoUrl ?? null,
])
    <div style="margin-bottom: 28px;">
        @if($recipientName)
            <p style="font-weight: 600; font-size: 18px; color: #0f172a; line-height: 28px; margin: 0 0 8px 0;">
                @lang('admin::app.marketing.communications.email-broadcast.dear') {{ $recipientName }}, 👋
            </p>
        @else
            <p style="font-weight: 600; font-size: 18px; color: #0f172a; line-height: 28px; margin: 0 0 8px 0;">
                @lang('admin::app.marketing.communications.email-broadcast.hello') 👋
            </p>
        @endif
    </div>

    <div style="background: #f8fafc; border-radius: 8px; padding: 24px; margin-bottom: 24px;">
        <p style="font-weight: 700; font-size: 18px; color: #060C3B; line-height: 26px; margin: 0 0 16px 0;">
            {{ $emailSubject }}
        </p>

        <div class="email-broadcast-content" style="line-height: 26px; font-size: 15px; color: #334155;">
            {!! $content !!}
        </div>
        <style type="text/css">
            .email-broadcast-content img { max-width: 100% !important; height: auto !important; display: block; border-radius: 6px; }
            .email-broadcast-content a { color: #2969FF; text-decoration: none; }
        </style>
    </div>

    <div style="margin-top: 24px; padding-top: 20px; border-top: 1px solid #e2e8f0;">
        <p style="font-size: 15px; color: #64748b; line-height: 24px; margin: 0;">
            @lang('admin::app.marketing.communications.email-broadcast.thank-you'),
        </p>
    </div>
@endcomponent
