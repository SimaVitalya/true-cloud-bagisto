<x-admin::layouts>
    <x-slot:title>
        @lang('admin::app.catalog.products.edit.title')
    </x-slot>

    {!! view_render_event('bagisto.admin.catalog.product.edit.before', ['product' => $product]) !!}

    <x-admin::form
        method="PUT"
        enctype="multipart/form-data"
    >
        {!! view_render_event('bagisto.admin.catalog.product.edit.actions.before', ['product' => $product]) !!}

        <!-- Page Header -->
        <div class="grid gap-2.5">
            <div class="flex items-center justify-between gap-4 max-sm:flex-wrap">
                <div class="grid gap-1.5">
                    <p class="text-xl font-bold leading-6 text-gray-800 dark:text-white">
                        @lang('admin::app.catalog.products.edit.title')
                    </p>
                </div>

                <div class="flex items-center gap-x-2.5">
                    <!-- Back Button -->
                    <a
                        href="{{ route('admin.catalog.products.index') }}"
                        class="transparent-button hover:bg-gray-200 dark:text-white dark:hover:bg-gray-800"
                    >
                        @lang('admin::app.account.edit.back-btn')
                    </a>

                    <!-- Preview Button -->
                    @if (
                        $product->status
                        && $product->visible_individually
                        && $product->url_key
                    )
                        <a
                            href="{{ route('shop.product_or_category.index', $product->url_key) }}"
                            class="secondary-button"
                            target="_blank"
                        >
                            @lang('admin::app.catalog.products.edit.preview')
                        </a>
                    @endif

                    <!-- Save Button -->
                    <button class="primary-button">
                        @lang('admin::app.catalog.products.edit.save-btn')
                    </button>
                </div>
            </div>
        </div>

        @php
            $channels = core()->getAllChannels();

            $currentChannel = core()->getRequestedChannel();

            $currentLocale = core()->getRequestedLocale();
        @endphp

        <!-- Channel and Locale Switcher -->
        <div class="mt-7 flex items-center justify-between gap-4 max-md:flex-wrap">
            <div class="flex items-center gap-x-1">
                <!-- Channel Switcher -->
                <x-admin::dropdown :class="$channels->count() <= 1 ? 'hidden' : ''">
                    <!-- Dropdown Toggler -->
                    <x-slot:toggle>
                        <button
                            type="button"
                            class="transparent-button px-1 py-1.5 hover:bg-gray-200 focus:bg-gray-200 dark:text-white dark:hover:bg-gray-800 dark:focus:bg-gray-800"
                        >
                            <span class="icon-store text-2xl"></span>
                            
                            {{ $currentChannel->name }}

                            <input
                                type="hidden"
                                name="channel"
                                value="{{ $currentChannel->code }}"
                            />

                            <span class="icon-sort-down text-2xl"></span>
                        </button>
                    </x-slot>

                    <!-- Dropdown Content -->
                    <x-slot:content class="!p-0">
                        @foreach ($channels as $channel)
                            <a
                                href="?{{ Arr::query(['channel' => $channel->code, 'locale' => $channel->default_locale?->code ?? $currentLocale->code ]) }}"
                                class="flex cursor-pointer gap-2.5 px-5 py-2 text-base hover:bg-gray-100 dark:text-white dark:hover:bg-gray-950"
                            >
                                {{ $channel->name }}
                            </a>
                        @endforeach
                    </x-slot>
                </x-admin::dropdown>

                <!-- Locale Switcher -->
                <x-admin::dropdown :class="$currentChannel->locales->count() <= 1 ? 'hidden' : ''">
                    <!-- Dropdown Toggler -->
                    <x-slot:toggle>
                        <button
                            type="button"
                            class="transparent-button px-1 py-1.5 hover:bg-gray-200 focus:bg-gray-200 dark:text-white dark:hover:bg-gray-800 dark:focus:bg-gray-800"
                        >
                            <span class="icon-language text-2xl"></span>

                            {{ $currentLocale->name }}
                            
                            <input
                                type="hidden"
                                name="locale"
                                value="{{ $currentLocale->code }}"
                            />

                            <span class="icon-sort-down text-2xl"></span>
                        </button>
                    </x-slot>

                    <!-- Dropdown Content -->
                    <x-slot:content class="!p-0">
                        @foreach ($currentChannel->locales->sortBy('name') as $locale)
                            <a
                                href="?{{ Arr::query(['channel' => $currentChannel->code, 'locale' => $locale->code]) }}"
                                class="flex gap-2.5 px-5 py-2 text-base cursor-pointer hover:bg-gray-100 dark:hover:bg-gray-950 dark:text-white {{ $locale->code == $currentLocale->code ? 'bg-gray-100 dark:bg-gray-950' : ''}}"
                            >
                                {{ $locale->name }}
                            </a>
                        @endforeach
                    </x-slot>
                </x-admin::dropdown>
            </div>
        </div>

        {!! view_render_event('bagisto.admin.catalog.product.edit.actions.after', ['product' => $product]) !!}

        <!-- Step navigation: clear stepper UI (pure CSS + minimal JS) -->
        <nav class="product-edit-steps" aria-label="@lang('admin::app.catalog.products.edit.steps.go-to')">
            <ol class="product-edit-steps__list">
                <li class="product-edit-steps__item">
                    <a href="#step-1" class="product-edit-steps__link">
                        <span class="product-edit-steps__num">1</span>
                        <span class="product-edit-steps__label">@lang('admin::app.catalog.products.edit.steps.basic')</span>
                    </a>
                    <span class="product-edit-steps__line" aria-hidden="true"></span>
                </li>
                <li class="product-edit-steps__item">
                    <a href="#step-2" class="product-edit-steps__link">
                        <span class="product-edit-steps__num">2</span>
                        <span class="product-edit-steps__label">@lang('admin::app.catalog.products.edit.steps.price')</span>
                    </a>
                    <span class="product-edit-steps__line" aria-hidden="true"></span>
                </li>
                <li class="product-edit-steps__item">
                    <a href="#step-3" class="product-edit-steps__link">
                        <span class="product-edit-steps__num">3</span>
                        <span class="product-edit-steps__label">@lang('admin::app.catalog.products.edit.steps.media')</span>
                    </a>
                    <span class="product-edit-steps__line" aria-hidden="true"></span>
                </li>
                <li class="product-edit-steps__item">
                    <a href="#step-4" class="product-edit-steps__link">
                        <span class="product-edit-steps__num">4</span>
                        <span class="product-edit-steps__label">@lang('admin::app.catalog.products.edit.steps.more')</span>
                    </a>
                </li>
            </ol>
        </nav>

        <!-- body content -->
        {!! view_render_event('bagisto.admin.catalog.product.edit.form.before', ['product' => $product]) !!}

        <div class="mt-3.5 flex gap-2.5 max-xl:flex-wrap">
            @php
                $groupedColumns = $product->attribute_family->attribute_groups->groupBy('column');

                $isSingleColumn = $groupedColumns->count() !== 2;
            @endphp

            @foreach ($groupedColumns as $column => $groups)

                {!! view_render_event("bagisto.admin.catalog.product.edit.form.column_{$column}.before", ['product' => $product]) !!}

                <div class="flex flex-col gap-2 {{ $column == 1 ? 'flex-1 max-xl:flex-auto' : 'w-[360px] max-w-full max-sm:w-full' }}">
                    @foreach ($groups as $group)
                        @php $customAttributes = $product->getEditableAttributes($group); @endphp

                        @if ($group->code === 'general')
                            <div id="step-1" class="scroll-mt-28"></div>
                        @endif
                        @if ($group->code === 'price')
                            <div id="step-2" class="scroll-mt-28"></div>
                        @endif
                        @if ($group->code === 'meta_description')
                            <div id="step-3" class="scroll-mt-28"></div>
                        @endif

                        @if ($customAttributes->isNotEmpty() || $group->code == 'price' || $group->code == 'inventories')
                            {!! view_render_event("bagisto.admin.catalog.product.edit.form.{$group->code}.before", ['product' => $product]) !!}

                            <div class="box-shadow relative rounded bg-white p-4 dark:bg-gray-900">
                                <p class="mb-4 text-base font-semibold text-gray-800 dark:text-white">
                                    {{ $group->name }}
                                </p>

                                @if ($group->code == 'meta_description')
                                    <p class="admin-hint mb-4">
                                        <span class="admin-hint__icon" aria-hidden="true">ℹ</span>
                                        @lang('admin::app.catalog.products.edit.meta-group-hint')
                                    </p>
                                    <x-admin::seo />
                                @endif

                                @if ($group->code == 'settings')
                                    <p class="admin-hint mb-4">
                                        <span class="admin-hint__icon" aria-hidden="true">ℹ</span>
                                        @lang('admin::app.catalog.products.edit.settings-group-hint')
                                    </p>
                                @endif

                                @if ($group->code == 'price')
                                    <p class="admin-hint mb-4">
                                        <span class="admin-hint__icon" aria-hidden="true">ℹ</span>
                                        @lang('admin::app.catalog.products.edit.price-group-hint')
                                    </p>
                                @endif

                                @if ($group->code == 'shipping')
                                    <p class="admin-hint mb-4">
                                        <span class="admin-hint__icon" aria-hidden="true">ℹ</span>
                                        @lang('admin::app.catalog.products.edit.shipping-group-hint')
                                    </p>
                                @endif

                                @if ($group->code == 'inventories')
                                    <p class="admin-hint mb-4">
                                        <span class="admin-hint__icon" aria-hidden="true">ℹ</span>
                                        @lang('admin::app.catalog.products.edit.inventories-group-hint')
                                    </p>
                                @endif

                                @foreach ($customAttributes as $attribute)
                                    {!! view_render_event("bagisto.admin.catalog.product.edit.form.{$group->code}.controls.before", ['product' => $product]) !!}

                                    <x-admin::form.control-group class="last:!mb-0">
                                        <x-admin::form.control-group.label>
                                            {!! $attribute->admin_name . ($attribute->is_required ? '<span class="required"></span>' : '') !!}

                                            @if (
                                                $attribute->value_per_channel
                                                && $channels->count() > 1
                                            )
                                                <span class="rounded border border-gray-200 bg-gray-100 px-1 py-0.5 text-[10px] font-semibold leading-normal text-gray-600">
                                                    {{ $currentChannel->name }}
                                                </span>
                                            @endif

                                            @if ($attribute->value_per_locale)
                                                <span class="rounded border border-gray-200 bg-gray-100 px-1 py-0.5 text-[10px] font-semibold leading-normal text-gray-600">
                                                    {{ $currentLocale->name }}
                                                </span>
                                            @endif
                                        </x-admin::form.control-group.label>

                                        @include ('admin::catalog.products.edit.controls', [
                                            'attribute' => $attribute,
                                            'product'   => $product,
                                        ])

                                        <x-admin::form.control-group.error :control-name="$attribute->code . (in_array($attribute->type, ['multiselect', 'checkbox']) ? '[]' : '')" />

                                        @if (\Illuminate\Support\Facades\Lang::has('admin::app.catalog.products.edit.attribute-hints.' . $attribute->code))
                                            <p class="admin-hint mt-2">
                                                <span class="admin-hint__icon" aria-hidden="true">ℹ</span>
                                                @lang('admin::app.catalog.products.edit.attribute-hints.' . $attribute->code)
                                            </p>
                                        @endif
                                    </x-admin::form.control-group>

                                    {!! view_render_event("bagisto.admin.catalog.product.edit.form.{$group->code}.controls.after", ['product' => $product]) !!}
                                @endforeach

                                @includeWhen($group->code == 'price', 'admin::catalog.products.edit.price.group')

                                @includeWhen(
                                    $group->code === 'inventories' && ! $product->getTypeInstance()->isComposite(),
                                    'admin::catalog.products.edit.inventories'
                                )
                            </div>

                            {!! view_render_event("bagisto.admin.catalog.product.edit.form.{$group->code}.after", ['product' => $product]) !!}
                        @endif
                    @endforeach

                    @if ($column == 1)
                        <!-- Images View Blade File -->
                        @include('admin::catalog.products.edit.images')

                        <!-- Videos View Blade File -->
                        @include('admin::catalog.products.edit.videos')

                        <!-- Product Type View Blade File -->
                        @includeIf('admin::catalog.products.edit.types.' . $product->type)

                        <!-- Related, Cross Sells, Up Sells View Blade File -->
                        @include('admin::catalog.products.edit.links')

                        <!-- Include Product Type Additional Blade Files If Any -->
                        @foreach ($product->getTypeInstance()->getAdditionalViews() as $view)
                            @includeIf($view)
                        @endforeach
                    @elseif (! $isSingleColumn)
                        <div id="step-4" class="scroll-mt-28"></div>
                        <!-- Channels View Blade File -->
                        @include('admin::catalog.products.edit.channels')

                        <!-- Categories View Blade File -->
                        @include('admin::catalog.products.edit.categories')
                    @endif
                </div>

                @if ($isSingleColumn && ($column == 1 || $column == 2))
                    <div class="w-[360px] max-w-full max-sm:w-full">
                        @if ($column == 2)
                            <div id="step-4" class="scroll-mt-28"></div>
                        @endif
                        @if ($column == 2) 
                            <!-- Images View Blade File -->
                            @include('admin::catalog.products.edit.images')

                            <!-- Videos View Blade File -->
                            @include('admin::catalog.products.edit.videos')

                            <!-- Product Type View Blade File -->
                            @includeIf('admin::catalog.products.edit.types.' . $product->type)

                            <!-- Related, Cross Sells, Up Sells View Blade File -->
                            @include('admin::catalog.products.edit.links')

                            <!-- Include Product Type Additional Blade Files If Any -->
                            @foreach ($product->getTypeInstance()->getAdditionalViews() as $view)
                                @includeIf($view)
                            @endforeach
                        @endif

                        <!-- Channels View Blade File -->
                        @include('admin::catalog.products.edit.channels')

                        <!-- Categories View Blade File -->
                        @include('admin::catalog.products.edit.categories')
                    </div>
                @endif

                {!! view_render_event("bagisto.admin.catalog.product.edit.form.column_{$column}.after", ['product' => $product]) !!}

            @endforeach
        </div>

        {!! view_render_event('bagisto.admin.catalog.product.edit.form.after', ['product' => $product]) !!}

        <!-- Save Button (Bottom) -->
        <div class="mt-6 flex justify-end border-t border-gray-200 pt-6 dark:border-gray-800">
            <button type="submit" class="primary-button">
                @lang('admin::app.catalog.products.edit.save-btn')
            </button>
        </div>

    </x-admin::form>

    {!! view_render_event('bagisto.admin.catalog.product.edit.after', ['product' => $product]) !!}

    @pushOnce('styles')
    <style>
    /* Product edit: stepper (pure CSS) */
    .product-edit-steps { margin-top: 1rem; }
    .product-edit-steps__list {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 0;
        list-style: none;
        margin: 0;
        padding: 0.75rem 1rem;
        background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        box-shadow: 0 1px 3px rgba(0,0,0,0.06);
    }
    html.dark .product-edit-steps__list {
        background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
        border-color: #334155;
    }
    .product-edit-steps__item {
        display: flex;
        align-items: center;
        flex: 1;
        min-width: 0;
    }
    .product-edit-steps__item:last-child .product-edit-steps__line { display: none; }
    .product-edit-steps__link {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.5rem 0.75rem;
        border-radius: 10px;
        text-decoration: none;
        color: #475569;
        font-size: 0.875rem;
        font-weight: 500;
        transition: background 0.2s, color 0.2s, transform 0.15s;
    }
    html.dark .product-edit-steps__link { color: #94a3b8; }
    .product-edit-steps__link:hover {
        background: rgba(59, 130, 246, 0.12);
        color: #2563eb;
    }
    html.dark .product-edit-steps__link:hover { color: #60a5fa; }
    .product-edit-steps__num {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 28px;
        height: 28px;
        border-radius: 50%;
        background: #e2e8f0;
        color: #475569;
        font-size: 0.8125rem;
        font-weight: 600;
        flex-shrink: 0;
    }
    html.dark .product-edit-steps__num { background: #334155; color: #94a3b8; }
    .product-edit-steps__link:hover .product-edit-steps__num {
        background: #2563eb;
        color: #fff;
    }
    html.dark .product-edit-steps__link:hover .product-edit-steps__num { background: #3b82f6; }
    .product-edit-steps__label { white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .product-edit-steps__line {
        flex: 1;
        min-width: 16px;
        height: 2px;
        margin: 0 4px;
        background: #cbd5e1;
        border-radius: 1px;
    }
    html.dark .product-edit-steps__line { background: #475569; }
    @media (max-width: 640px) {
        .product-edit-steps__list { flex-direction: column; align-items: stretch; }
        .product-edit-steps__line { display: none !important; }
    }
    /* Admin hints (categories, channels, etc.) */
    .admin-hint {
        display: flex;
        align-items: flex-start;
        gap: 0.5rem;
        padding: 0.5rem 0.75rem;
        font-size: 0.8125rem;
        line-height: 1.4;
        color: #475569;
        background: #f0f9ff;
        border: 1px solid #bae6fd;
        border-radius: 8px;
    }
    html.dark .admin-hint {
        color: #94a3b8;
        background: rgba(30, 58, 138, 0.25);
        border-color: #334155;
    }
    .admin-hint__icon {
        flex-shrink: 0;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 18px;
        height: 18px;
        border-radius: 50%;
        background: #0ea5e9;
        color: #fff;
        font-size: 0.7rem;
        font-weight: 700;
    }
    html.dark .admin-hint__icon { background: #3b82f6; }
    /* Channels checklist */
    .product-channel-item {
        padding: 0.5rem 0.6rem;
        border-radius: 8px;
        transition: background 0.15s;
    }
    .product-channel-item:hover { background: #f1f5f9; }
    html.dark .product-channel-item:hover { background: #1e293b; }
    </style>
    @endPushOnce

    @pushOnce('scripts')
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.product-edit-steps__link').forEach(function(a) {
            a.addEventListener('click', function(e) {
                var id = this.getAttribute('href');
                if (id && id.charAt(0) === '#') {
                    var el = document.querySelector(id);
                    if (el) {
                        e.preventDefault();
                        el.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }
                }
            });
        });
    });
    </script>
    @endPushOnce
</x-admin::layouts>
