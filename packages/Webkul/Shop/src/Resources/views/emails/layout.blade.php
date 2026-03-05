<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="x-apple-disable-message-reformatting" content="yes" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
        <style type="text/css">
            @media only screen and (max-width: 620px) {
                /* --- PREMIUM MOBILE LAYOUT RESET --- */
                
                /* Container & Spacing */
                .wrapper { padding: 32px 20px !important; }
                .outer-pad { padding: 0 !important; width: 100% !important; }
                .address-col { display: block !important; width: 100% !important; max-width: 100% !important; padding: 0 0 24px 0 !important; }
                
                /* Global Typography - Harmonized Scale */
                .mobile-logo { height: 42px !important; width: auto !important; max-width: 200px !important; }
                .mobile-logo-txt { font-size: 24px !important; font-weight: 700 !important; }
                
                .mobile-hero { font-size: 24px !important; line-height: 1.3 !important; font-weight: 700 !important; margin-bottom: 20px !important; color: #0f172a !important; }
                .mobile-body { font-size: 16px !important; line-height: 26px !important; color: #334155 !important; }
                .mobile-label { font-size: 13px !important; text-transform: uppercase !important; letter-spacing: 0.05em !important; color: #64748b !important; font-weight: 600 !important; }
                
                /* Cards */
                .mobile-card-title { font-size: 18px !important; font-weight: 600 !important; color: #0f172a !important; margin-bottom: 8px !important; }
                .mobile-card-text { font-size: 16px !important; line-height: 24px !important; color: #334155 !important; }
                
                /* Summary Section ("Підсумок замовлення") - Prominent but clean */
                .summary-block { margin-top: 32px !important; padding-top: 24px !important; border-top: 1px solid #f1f5f9 !important; }
                .mobile-summary-title { font-size: 22px !important; font-weight: 700 !important; color: #0f172a !important; margin: 0 0 8px 0 !important; }
                .mobile-summary-total { font-size: 18px !important; font-weight: 600 !important; color: #2563eb !important; margin: 0 0 24px 0 !important; display: block !important; }

                /* Product List - Mobile: card layout, без рядка заголовків (сума, артикул, ціна, кількість) */
                .product-table-wrap { border: 0 !important; background: transparent !important; margin-bottom: 24px !important; overflow-x: visible !important; }
                .mobile-products-table { width: 100% !important; min-width: 0 !important; border-collapse: collapse !important; border-spacing: 0 !important; display: block !important; }
                .mobile-products-table thead { display: none !important; }

                .mobile-products-table tbody { display: block !important; }
                .mobile-products-table tbody tr { display: block !important; width: 100% !important; border: 1px solid #e2e8f0 !important; border-top: none !important; border-radius: 0 !important; margin-bottom: 0 !important; padding: 12px !important; background: #ffffff !important; box-sizing: border-box !important; }
                .mobile-products-table tbody td { display: block !important; width: 100% !important; max-width: 100% !important; padding: 6px 0 !important; border: none !important; vertical-align: top !important; word-wrap: break-word !important; overflow-wrap: break-word !important; word-break: normal !important; }
                /* SKU column visible (no .mobile-hide-sku hide) */
                .mobile-products-table tbody td.mobile-hide-sku { font-size: 13px !important; color: #64748b !important; word-break: break-all !important; }

                /* Image row */
                .mobile-products-table tbody td.mobile-img-cell { padding: 0 0 10px 0 !important; width: 100% !important; }
                .mobile-img-cell .mobile-img-product { width: 100px !important; height: 100px !important; min-width: 100px !important; min-height: 100px !important; border-radius: 12px !important; object-fit: cover !important; border: 1px solid #f1f5f9 !important; display: block !important; }

                /* Name (no duplicate SKU here) */
                .mobile-products-table tbody td.mobile-name-cell { padding: 0 0 10px 0 !important; font-size: 16px !important; line-height: 1.4 !important; }
                .mobile-name-cell span { display: block !important; word-wrap: break-word !important; overflow-wrap: break-word !important; word-break: normal !important; }
                .item-sku-inline { display: none !important; }

                /* Price, Qty, Total: one row */
                .mobile-products-table tbody tr td:nth-child(4),
                .mobile-products-table tbody tr td:nth-child(5),
                .mobile-products-table tbody tr td:nth-child(6) { display: inline-block !important; width: 33% !important; padding: 8px 4px 0 0 !important; box-sizing: border-box !important; vertical-align: top !important; font-size: 15px !important; }
                .mobile-products-table tbody tr td:nth-child(6) { text-align: right !important; }

                /* Hide duplicate payment inside billing card (show only block below table) */
                .payment-in-billing-card { display: none !important; }
                
                /* Totals & Payment */
                .mobile-payment-title { font-size: 16px !important; font-weight: 600 !important; margin-bottom: 4px !important; }
                .mobile-payment-text { font-size: 16px !important; color: #334155 !important; }
                
                .mobile-totals { font-size: 16px !important; padding: 12px 0 !important; color: #475569 !important; }
                .grand-total-box table { width: 100% !important; table-layout: fixed !important; }
                .grand-total-box .mobile-grand { font-size: 18px !important; font-weight: 700 !important; color: #0f172a !important; padding: 0 !important; vertical-align: middle !important; text-align: left !important; width: 50% !important; }
                .grand-total-box .mobile-grand-num { font-size: 20px !important; font-weight: 700 !important; color: #2563eb !important; padding: 0 !important; vertical-align: middle !important; text-align: right !important; width: 50% !important; }
                
                .mobile-footer { font-size: 14px !important; line-height: 22px !important; color: #94a3b8 !important; text-align: center !important; margin-top: 40px !important; }
            }
            .break-word { word-wrap: break-word !important; overflow-wrap: break-word !important; }
            .item-sku-inline { display: none !important; }
            /* Як в адміні: без "..." в кінці, текст повністю вміщується */
            .email-no-ellipsis { overflow: visible !important; text-overflow: clip !important; white-space: normal !important; word-wrap: break-word !important; overflow-wrap: break-word !important; }
            .wrapper { overflow: visible !important; }
        </style>
    </head>
    <body style="margin:0;padding:0;font-family:'Inter',system-ui,-apple-system,sans-serif;background-color:#f1f5f9;color:#0f172a;-webkit-text-size-adjust:100%;">
        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f1f5f9;">
            <tr>
                <td align="center" class="outer-pad" style="padding:40px 20px;">
                    <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="max-width:100%;width:100%;background-color:#ffffff;border-radius:16px;box-shadow:0 4px 24px rgba(15,23,42,0.08);overflow:hidden;">
                        <tr>
                            <td class="wrapper" style="padding:48px 40px 40px;">
                                <!-- Premium Header -->
                                <table role="presentation" width="100%" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="center" style="padding-bottom:32px;border-bottom:1px solid #e2e8f0;">
                                            @php
                                                $emailBaseUrl = rtrim(config('app.url') ?: 'http://localhost', '/');
                                                $embeddedLogoCid = $embeddedLogoCid ?? null;
                                                if ($embeddedLogoCid) {
                                                    $hasLogo = true;
                                                    $logoSrc = 'cid:' . $embeddedLogoCid;
                                                } elseif (!empty($logoUrl ?? null)) {
                                                    $hasLogo = true;
                                                    $logoSrc = $logoUrl;
                                                } else {
                                                    $logoDataUri = null; $logoFullUrl = null;
                                                    if ($logo = core()->getConfigData('general.design.admin_logo.logo_image')) {
                                                        $fullPath = \Illuminate\Support\Facades\Storage::disk('public')->path($logo);
                                                        if (is_readable($fullPath)) {
                                                            $mime = @mime_content_type($fullPath) ?: 'image/png';
                                                            $logoDataUri = 'data:' . $mime . ';base64,' . base64_encode(file_get_contents($fullPath));
                                                            $logoPathOrUrl = \Illuminate\Support\Facades\Storage::disk('public')->url($logo);
                                                            $logoFullUrl = (str_starts_with($logoPathOrUrl, 'http') ? $logoPathOrUrl : $emailBaseUrl . '/' . ltrim($logoPathOrUrl, '/'));
                                                        }
                                                    }
                                                    if (!$logoFullUrl && is_readable(public_path('logo.png'))) {
                                                        $mime = @mime_content_type(public_path('logo.png')) ?: 'image/png';
                                                        $logoDataUri = 'data:' . $mime . ';base64,' . base64_encode(file_get_contents(public_path('logo.png')));
                                                        $logoFullUrl = $emailBaseUrl . '/logo.png';
                                                    }
                                                    $hasLogo = ($logoDataUri ?? false) || ($logoFullUrl ?? false);
                                                    $logoSrc = $logoDataUri ?? $logoFullUrl ?? '';
                                                }
                                                $appName = config('app.name') ?: 'TrueCloud';
                                            @endphp
                                            <a href="{{ $emailBaseUrl }}/" style="display:inline-block;text-decoration:none;">
                                                @if(!empty($hasLogo) && !empty($logoSrc))
                                                    <img src="{{ $logoSrc }}" alt="{{ $appName }}" class="mobile-logo" style="height:48px;max-width:200px;display:block;margin:0 auto;border:0;" />
                                                @else
                                                    <span class="mobile-logo-txt" style="font-size:22px;font-weight:700;color:#1e40af;letter-spacing:-0.02em;">{{ $appName }}</span>
                                                @endif
                                            </a>
                                        </td>
                                    </tr>
                                </table>

                                {!! $slot !!}

                                <!-- Premium Footer -->
                                @php
                                    $contactDetails = optional(core())->getContactEmailDetails();
                                    $contactEmail = (is_array($contactDetails ?? null) && isset($contactDetails['email']) && $contactDetails['email']) ? $contactDetails['email'] : (config('mail.from.address') ?? '');
                                @endphp
                                <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin-top:40px;padding-top:24px;border-top:1px solid #e2e8f0;">
                                    <tr>
                                        <td style="font-size:14px;color:#64748b;line-height:22px;word-wrap:break-word;overflow-wrap:break-word;" class="mobile-footer email-no-ellipsis">
                                            @lang('shop::app.emails.thanks', [
                                                'link' => 'mailto:' . $contactEmail,
                                                'email' => $contactEmail,
                                                'style' => 'color:#2563eb;text-decoration:none;font-weight:500;'
                                            ])
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
