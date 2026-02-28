{!! view_render_event('bagisto.admin.catalog.product.edit.form.images.before', ['product' => $product]) !!}

<div class="box-shadow relative rounded bg-white p-4 dark:bg-gray-900">
    <!-- Panel Header -->
    <div class="mb-4 flex flex-col gap-2">
        <p class="text-base font-semibold text-gray-800 dark:text-white">
            @lang('admin::app.catalog.products.edit.images.title')
        </p>
        <p class="admin-hint">
            <span class="admin-hint__icon" aria-hidden="true">ℹ</span>
            @lang('admin::app.catalog.products.edit.images.info')
        </p>
    </div>

    <!-- Image Blade Component -->
    <x-admin::media.images
        name="images[files]"
        allow-multiple="true"
        show-placeholders="true"
        :uploaded-images="$product->images"
    />

    <x-admin::form.control-group.error control-name='images.files[0]' />
</div>

{!! view_render_event('bagisto.admin.catalog.product.edit.form.images.after', ['product' => $product]) !!}