@component('admin::emails.layout', ['embeddedLogoCid' => $embeddedLogoCid ?? null, 'logoUrl' => $logoUrl ?? null])
    <!-- Premium Hero -->
    <div style="margin-bottom:40px;">
        <h1 class="mobile-hero" style="margin:0 0 8px 0;font-size:24px;font-weight:700;color:#0f172a;letter-spacing:-0.02em;line-height:1.3;">
            @lang('admin::app.emails.orders.created.title')
        </h1>
        <p class="mobile-body" style="margin:0 0 12px 0;font-size:16px;color:#475569;line-height:26px;">
            @lang('admin::app.emails.dear', ['admin_name' => core()->getAdminEmailDetails()['name']]), 👋
        </p>
        <p class="mobile-body" style="margin:0;font-size:16px;color:#475569;line-height:26px;">
            {!! __('admin::app.emails.orders.created.greeting', [
                'order_id' => '<a href="' . route('admin.sales.orders.view', $order->id) . '" style="color:#2563eb;text-decoration:none;font-weight:600;">#' . $order->increment_id . '</a>',
                'created_at' => core()->formatDate($order->created_at, 'Y-m-d H:i:s')
            ]) !!}
        </p>
    </div>

    <p class="mobile-label" style="margin:0 0 24px 0;font-size:13px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.06em;">
        @lang('admin::app.emails.orders.created.summary')
    </p>

    <!-- Addresses: Premium cards (stack on mobile) -->
    <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin-bottom:40px;">
        <tr>
            @if ($order->shipping_address)
                <td width="48%" class="address-col" style="vertical-align:top;padding-right:16px;">
                    <div class="break-word" style="background:#f8fafc;border-radius:12px;padding:24px;border:1px solid #e2e8f0;">
                        <p class="mobile-card-title" style="margin:0 0 12px 0;font-size:12px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;">@lang('admin::app.emails.orders.shipping-address')</p>
                        <p class="mobile-card-text" style="margin:0 0 20px 0;font-size:15px;color:#0f172a;line-height:22px;word-wrap:break-word;overflow-wrap:break-word;">
                            {{ $order->shipping_address->company_name ?? '' }}<br/>
                            {{ $order->shipping_address->name }}<br/>
                            {{ $order->shipping_address->address }}<br/>
                            {{ $order->shipping_address->postcode }} {{ $order->shipping_address->city }}<br/>
                            {{ $order->shipping_address->state }}<br/>—<br/>
                            @lang('admin::app.emails.orders.contact'): {{ $order->billing_address->phone }}
                        </p>
                        <p class="mobile-card-title" style="margin:0 0 4px 0;font-size:12px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;">@lang('admin::app.emails.orders.shipping')</p>
                        <p class="mobile-card-text" style="margin:0;font-size:15px;color:#0f172a;">{{ $order->shipping_title }}</p>
                    </div>
                </td>
            @endif
            @if ($order->billing_address)
                <td width="48%" class="address-col" style="vertical-align:top;">
                    <div class="break-word" style="background:#f8fafc;border-radius:12px;padding:24px;border:1px solid #e2e8f0;">
                        <p class="mobile-card-title" style="margin:0 0 12px 0;font-size:12px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;">@lang('admin::app.emails.orders.billing-address')</p>
                        <p class="mobile-card-text" style="margin:0 0 20px 0;font-size:15px;color:#0f172a;line-height:22px;word-wrap:break-word;overflow-wrap:break-word;">
                            {{ $order->billing_address->company_name ?? '' }}<br/>
                            {{ $order->billing_address->name }}<br/>
                            {{ $order->billing_address->address }}<br/>
                            {{ $order->billing_address->postcode }} {{ $order->billing_address->city }}<br/>
                            {{ $order->billing_address->state }}<br/>—<br/>
                            @lang('admin::app.emails.orders.contact'): {{ $order->billing_address->phone }}
                        </p>
                        <div class="payment-in-billing-card">
                        <p class="mobile-card-title" style="margin:0 0 4px 0;font-size:12px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;">@lang('admin::app.emails.orders.payment')</p>
                        <p class="mobile-card-text" style="margin:0;font-size:15px;color:#0f172a;">{{ core()->getConfigData('sales.payment_methods.' . $order->payment->method . '.title') }}</p>
                        @php $additionalDetails = \Webkul\Payment\Payment::getAdditionalDetails($order->payment->method); @endphp
                        @if (!empty($additionalDetails))
                            <p style="margin:8px 0 0 0;font-size:14px;color:#475569;">{{ $additionalDetails['title'] }}: {{ $additionalDetails['value'] }}</p>
                        @endif
                        </div>
                    </div>
                </td>
            @endif
        </tr>
    </table>

    <!-- Order summary block: на телефонах шрифты и картинка на 15% больше -->
    <div class="summary-block">
    <div style="margin-bottom:20px;">
        <p class="mobile-summary-title" style="margin:0;font-size:22px;font-weight:700;color:#0f172a;">@lang('admin::app.sales.orders.view.ordered-items') ({{ count($order->items) }})</p>
    </div>

    <!-- Premium Products Table (scroll on mobile, no ellipsis) -->
    <div class="product-table-wrap" style="border-radius:12px;border:1px solid #e2e8f0;overflow-x:auto;margin-bottom:32px;-webkit-overflow-scrolling:touch;">
        <table role="presentation" cellspacing="0" cellpadding="0" class="mobile-products-table" style="border-collapse:collapse;width:100%;">
            <thead>
                <tr style="background:#f8fafc;">
                    <th class="mobile-th mobile-img-cell" style="text-align:left;padding:14px 16px;font-size:11px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;border-bottom:1px solid #e2e8f0;width:72px;">@lang('admin::app.emails.orders.image')</th>
                    <th class="mobile-th mobile-hide-sku" style="text-align:left;padding:14px 16px;font-size:11px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;border-bottom:1px solid #e2e8f0;">@lang('admin::app.emails.orders.sku')</th>
                    <th class="mobile-th mobile-name-cell" style="text-align:left;padding:14px 16px;font-size:11px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;border-bottom:1px solid #e2e8f0;">@lang('admin::app.emails.orders.name')</th>
                    <th class="mobile-th" style="text-align:left;padding:14px 16px;font-size:11px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;border-bottom:1px solid #e2e8f0;">@lang('admin::app.emails.orders.price')</th>
                    <th class="mobile-th" style="text-align:left;padding:14px 16px;font-size:11px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;border-bottom:1px solid #e2e8f0;">@lang('admin::app.emails.orders.qty')</th>
                    <th class="mobile-th" style="text-align:right;padding:14px 16px;font-size:11px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;border-bottom:1px solid #e2e8f0;">@lang('admin::app.emails.orders.line-total')</th>
                </tr>
            </thead>
            <tbody class="mobile-td" style="font-size:15px;color:#334155;">
                @foreach ($order->items as $index => $item)
                    @php
                        try {
                            $orderedItem = $item->getTypeInstance()->getOrderedItem($item);
                            $itemSku = $orderedItem ? ($orderedItem->sku ?? '') : '';
                        } catch (\Throwable $e) {
                            $itemSku = $item->sku ?? '';
                        }
                        $itemSku = $itemSku ?: '—';
                        $itemName = $item->name ?? '—';
                        $itemQty = (int) ($item->qty_ordered ?? 0);
                        $itemImgCid = $itemCids[$index] ?? null;
                        $itemImgSrc = $itemImgCid ? ('cid:' . $itemImgCid) : ($itemImageUrls[$index] ?? null);
                        $lineTotalExclTax = $item->base_total - ($item->base_discount_amount ?? 0);
                    @endphp
                    <tr style="border-bottom:1px solid #f1f5f9;">
                        <td class="mobile-img-cell" style="padding:16px;vertical-align:middle;">
                            @if($itemImgSrc)
                                <img src="{{ $itemImgSrc }}" alt="" class="mobile-img-product" width="64" height="64" style="width:64px;height:64px;object-fit:contain;border-radius:8px;border:1px solid #e2e8f0;" />
                            @else
                                <div class="mobile-img-product" style="width:64px;height:64px;background:#f1f5f9;border-radius:8px;border:1px dashed #cbd5e1;font-size:11px;color:#94a3b8;text-align:center;line-height:64px;box-sizing:border-box;">—</div>
                            @endif
                        </td>
                        <td class="mobile-hide-sku" style="padding:16px;vertical-align:middle;font-size:14px;color:#64748b;word-wrap:break-word;overflow-wrap:break-word;">@lang('admin::app.emails.orders.sku'): {{ $itemSku }}</td>
                        <td style="padding:16px;vertical-align:middle;word-wrap:break-word;overflow-wrap:break-word;" class="mobile-name-cell">
                            <span style="font-weight:500;color:#0f172a;">{{ $itemName }}</span>
                            @if (isset($item->additional['attributes']))
                                <div style="font-size:13px;color:#64748b;margin-top:4px;">
                                    @foreach ($item->additional['attributes'] as $attribute)
                                        @if (empty($attribute['attribute_type']) || $attribute['attribute_type'] !== 'file')
                                            {{ $attribute['attribute_name'] }}: {{ $attribute['option_label'] }}<br>
                                        @else
                                            {{ $attribute['attribute_name'] }}: <a href="{{ Storage::url($attribute['option_label']) }}" style="color:#2563eb;text-decoration:none;">{{ File::basename($attribute['option_label']) }}</a><br>
                                        @endif
                                    @endforeach
                                </div>
                            @endif
                        </td>
                        <td style="padding:16px;vertical-align:middle;">
                            @lang('admin::app.emails.orders.price'):
                            {{ core()->formatBasePrice($item->base_price) }}
                        </td>
                        <td style="padding:16px;vertical-align:middle;">@lang('admin::app.emails.orders.qty'): {{ $itemQty }}</td>
                        <td style="padding:16px;vertical-align:middle;text-align:right;font-weight:600;color:#0f172a;">@lang('admin::app.emails.orders.line-total'): {{ core()->formatBasePrice($lineTotalExclTax) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    </div>

    <!-- Payment block (full text visible, no truncation) -->
    <div class="break-word" style="background:#f8fafc;border-radius:12px;padding:20px 24px;border:1px solid #e2e8f0;margin-bottom:32px;">
        <p class="mobile-payment-title" style="margin:0 0 4px 0;font-size:12px;font-weight:600;color:#64748b;text-transform:uppercase;letter-spacing:0.05em;">@lang('admin::app.emails.orders.payment')</p>
        <p class="mobile-payment-text" style="margin:0;font-size:16px;font-weight:500;color:#0f172a;">{{ core()->getConfigData('sales.payment_methods.' . $order->payment->method . '.title') }}</p>
        @php $additionalDetails = \Webkul\Payment\Payment::getAdditionalDetails($order->payment->method); @endphp
        @if (!empty($additionalDetails))
            <p style="margin:8px 0 0 0;font-size:14px;color:#475569;">{{ $additionalDetails['title'] }}: {{ $additionalDetails['value'] }}</p>
        @endif
    </div>

    <!-- Загальна сума один раз внизу справа, в тих самих стилях, без ПДВ -->
    @php $grandTotalExclTax = $order->base_grand_total - ($order->base_tax_amount ?? 0); @endphp
    <div style="margin-top:24px;text-align:right;">
        <p style="margin:0;font-size:20px;font-weight:600;color:#2563eb;">@lang('admin::app.emails.orders.grand-total'): {{ core()->formatBasePrice($grandTotalExclTax) }}</p>
    </div>
@endcomponent
