<x-admin::layouts>
    <x-slot:title>
        @lang('admin::app.catalog.products.index.title')
    </x-slot>

    <div class="flex items-center justify-between gap-4 max-sm:flex-wrap">
        <p class="text-xl font-bold text-gray-800 dark:text-white">
            @lang('admin::app.catalog.products.index.title')
        </p>

        <div class="flex items-center gap-x-2.5">
            <!-- Export Modal -->
            <x-admin::datagrid.export :src="route('admin.catalog.products.index')" />

            {!! view_render_event('bagisto.admin.catalog.products.create.before') !!}

            @if (bouncer()->hasPermission('catalog.products.create'))
                <v-create-product-form>
                    <button
                        type="button"
                        class="primary-button"
                    >
                        @lang('admin::app.catalog.products.index.create-btn')
                    </button>
                </v-create-product-form>
            @endif

            {!! view_render_event('bagisto.admin.catalog.products.create.after') !!}
        </div>
    </div>

    {!! view_render_event('bagisto.admin.catalog.products.list.before') !!}

    <!-- Datagrid -->
    <x-admin::datagrid
        :src="route('admin.catalog.products.index')"
        :isMultiRow="true"
    >
        <!-- Datagrid Header -->
        @php
            $hasPermission = bouncer()->hasPermission('catalog.products.edit') || bouncer()->hasPermission('catalog.products.delete');
        @endphp

        <template #header="{
            isLoading,
            available,
            applied,
            selectAll,
            sort,
            performAction
        }">
            <template v-if="isLoading">
                <x-admin::shimmer.datagrid.table.head :isMultiRow="true" />
            </template>

            <template v-else>
                <div class="row grid gap-2 md:grid-cols-[2fr_1fr_1fr] grid-rows-1 items-center border-b px-4 py-2.5 dark:border-gray-800">
                    <div
                        class="flex select-none items-center gap-2.5"
                        v-for="(columnGroup, index) in [['name', 'sku', 'attribute_family'], ['base_image', 'price', 'quantity', 'product_id'], ['status', 'category_name', 'type']]"
                    >
                        @if ($hasPermission)
                            <label
                                class="flex w-max cursor-pointer select-none items-center gap-1"
                                for="mass_action_select_all_records"
                                v-if="! index"
                            >
                                <input
                                    type="checkbox"
                                    name="mass_action_select_all_records"
                                    id="mass_action_select_all_records"
                                    class="peer hidden"
                                    :checked="['all', 'partial'].includes(applied.massActions.meta.mode)"
                                    @change="selectAll"
                                >

                                <span
                                    class="icon-uncheckbox cursor-pointer rounded-md text-2xl"
                                    :class="[
                                        applied.massActions.meta.mode === 'all' ? 'peer-checked:icon-checked peer-checked:text-blue-600' : (
                                            applied.massActions.meta.mode === 'partial' ? 'peer-checked:icon-checkbox-partial peer-checked:text-blue-600' : ''
                                        ),
                                    ]"
                                >
                                </span>
                            </label>
                        @endif

                        <p class="text-gray-600 dark:text-gray-300">
                            <span class="[&>*]:after:content-['_/_']">
                                <template v-for="column in columnGroup">
                                    <span
                                        class="after:content-['/'] last:after:content-['']"
                                        :class="{
                                            'font-medium text-gray-800 dark:text-white': applied.sort.column == column,
                                            'cursor-pointer hover:text-gray-800 dark:hover:text-white': available.columns.find(columnTemp => columnTemp.index === column)?.sortable,
                                        }"
                                        @click="
                                            available.columns.find(columnTemp => columnTemp.index === column)?.sortable ? sort(available.columns.find(columnTemp => columnTemp.index === column)): {}
                                        "
                                    >
                                        @{{ available.columns.find(columnTemp => columnTemp.index === column)?.label }}
                                    </span>
                                </template>
                            </span>

                            <i
                                class="align-text-bottom text-base text-gray-800 dark:text-white ltr:ml-1.5 rtl:mr-1.5"
                                :class="[applied.sort.order === 'asc' ? 'icon-down-stat': 'icon-up-stat']"
                                v-if="columnGroup.includes(applied.sort.column)"
                            ></i>
                        </p>
                    </div>
                </div>
            </template>
        </template>

        <template #body="{
            isLoading,
            available,
            applied,
            selectAll,
            sort,
            performAction
        }">
            <template v-if="isLoading">
                <x-admin::shimmer.datagrid.table.body :isMultiRow="true" />
            </template>

            <template v-else>
                <div
                    class="row border-b px-2 py-2.5 transition-all hover:bg-gray-50 dark:border-gray-800 dark:hover:bg-gray-950 sm:px-4 md:grid md:grid-cols-[2fr_1fr_1fr] md:grid-rows-1 md:gap-1.5"
                    v-for="record in available.records"
                >
                    <!-- Mobile Layout -->
                    <div class="block space-y-3 md:hidden">
                        <!-- Header Row with Checkbox, Name and Actions -->
                        <div class="flex items-start justify-between gap-3">
                            <div class="flex items-start gap-2.5">
                                @if ($hasPermission)
                                    <input
                                        type="checkbox"
                                        :name="`mass_action_select_record_${record.product_id}`"
                                        :id="`mass_action_select_record_${record.product_id}`"
                                        :value="record.product_id"
                                        class="peer hidden"
                                        v-model="applied.massActions.indices"
                                    >

                                    <label
                                        class="icon-uncheckbox peer-checked:icon-checked cursor-pointer rounded-md text-2xl peer-checked:text-blue-600"
                                        :for="`mass_action_select_record_${record.product_id}`"
                                    ></label>
                                @endif

                                <div class="relative flex-shrink-0">
                                    <template v-if="record.base_image">
                                        <img
                                            class="h-12 w-12 rounded object-cover sm:h-16 sm:w-16"
                                            :src='record.base_image'
                                        />

                                        <span class="absolute -bottom-1 -right-1 rounded-full bg-darkPink px-1 text-xs font-bold leading-normal text-white">
                                            @{{ record.images_count }}
                                        </span>
                                    </template>

                                    <template v-else>
                                        <div class="relative h-12 w-12 rounded border border-dashed border-gray-300 dark:border-gray-800 dark:mix-blend-exclusion dark:invert sm:h-16 sm:w-16">
                                            <img src="{{ bagisto_asset('images/product-placeholders/front.svg')}}" class="h-full w-full object-cover">

                                            <p class="absolute bottom-0 w-full text-center text-[6px] font-semibold text-gray-400">
                                                @lang('admin::app.catalog.products.index.datagrid.product-image')
                                            </p>
                                        </div>
                                    </template>
                                </div>

                                <div class="flex flex-col gap-1 flex-1">
                                    <p class="break-all text-sm font-semibold text-gray-800 dark:text-white sm:text-base">
                                        @{{ record.name }}
                                    </p>

                                    <p class="text-xs text-gray-600 dark:text-gray-300 sm:text-sm">
                                        @{{ "@lang('admin::app.catalog.products.index.datagrid.id-value')".replace(':id', record.product_id) }}
                                    </p>

                                    <p class="text-xs text-gray-600 dark:text-gray-300 sm:text-sm">
                                        @{{ "@lang('admin::app.catalog.products.index.datagrid.sku-value')".replace(':sku', record.sku) }}
                                    </p>

                                    <p class="text-xs text-gray-600 dark:text-gray-300 sm:text-sm">
                                        @{{ "@lang('admin::app.catalog.products.index.datagrid.attribute-family-value')".replace(':attribute_family', record.attribute_family) }}
                                    </p>

                                    <p class="text-xs text-gray-600 dark:text-gray-300 sm:text-sm">
                                        @{{ record.category_name ?? 'N/A' }}
                                    </p>

                                    <p class="text-xs text-gray-600 dark:text-gray-300 sm:text-sm">
                                        @{{ record.type }}
                                    </p>

                                    <p class="text-sm font-semibold text-gray-800 dark:text-white sm:text-base">
                                        @{{ $admin.formatPrice(record.price) }}
                                    </p>

                                    <div>
                                        <div v-if="['configurable', 'bundle', 'grouped' , 'booking'].includes(record.type)">
                                            <p class="text-xs text-gray-600 dark:text-gray-300 sm:text-sm">
                                                <span class="text-red-600">N/A</span>
                                            </p>
                                        </div>

                                        <div v-else>
                                            <p
                                                class="text-xs text-gray-600 dark:text-gray-300 sm:text-sm"
                                                v-if="record.quantity > 0"
                                            >
                                                <span class="text-green-600">
                                                    @{{ "@lang('admin::app.catalog.products.index.datagrid.qty-value')".replace(':qty', record.quantity) }}
                                                </span>
                                            </p>

                                            <p
                                                class="text-xs text-gray-600 dark:text-gray-300 sm:text-sm"
                                                v-else
                                            >
                                                <span class="text-red-600">
                                                    @lang('admin::app.catalog.products.index.datagrid.out-of-stock')
                                                </span>
                                            </p>
                                        </div>
                                    </div>

                                    <p :class="[record.status ? 'label-active': 'label-info']">
                                        @{{ record.status ? "@lang('admin::app.catalog.products.index.datagrid.active')" : "@lang('admin::app.catalog.products.index.datagrid.disable')" }}
                                    </p>
                                </div>
                            </div>

                            <div class="flex items-center gap-1">
                                <span
                                    class="cursor-pointer rounded-md p-1.5 text-xl transition-all hover:bg-gray-200 dark:hover:bg-gray-800"
                                    :class="action.icon"
                                    v-text="! action.icon ? action.title : ''"
                                    v-for="action in record.actions"
                                    @click="performAction(action)"
                                >
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Desktop Layout (Hidden on Mobile) -->
                    <div class="hidden md:contents">
                        <!-- Name, SKU, Attribute Family Columns -->
                        <div class="flex gap-2.5">
                            @if ($hasPermission)
                                <input
                                    type="checkbox"
                                    :name="`mass_action_select_record_${record.product_id}`"
                                    :id="`mass_action_select_record_${record.product_id}`"
                                    :value="record.product_id"
                                    class="peer hidden"
                                    v-model="applied.massActions.indices"
                                >

                                <label
                                    class="icon-uncheckbox peer-checked:icon-checked cursor-pointer rounded-md text-2xl peer-checked:text-blue-600"
                                    :for="`mass_action_select_record_${record.product_id}`"
                                ></label>
                            @endif

                            <div class="flex flex-col gap-1.5">
                                <p class="break-all text-base font-semibold text-gray-800 dark:text-white">
                                    @{{ record.name }}
                                </p>

                                <p class="text-gray-600 dark:text-gray-300">
                                    @{{ "@lang('admin::app.catalog.products.index.datagrid.sku-value')".replace(':sku', record.sku) }}
                                </p>

                                <p class="text-gray-600 dark:text-gray-300">
                                    @{{ "@lang('admin::app.catalog.products.index.datagrid.attribute-family-value')".replace(':attribute_family', record.attribute_family) }}
                                </p>
                            </div>
                        </div>

                        <!-- Image, Price, Id, Stock Columns -->
                        <div class="flex gap-1.5">
                            <div class="relative">
                                <template v-if="record.base_image">
                                    <img
                                        class="max-h-[65px] min-h-[65px] min-w-[65px] max-w-[65px] rounded"
                                        :src='record.base_image'
                                    />

                                    <span class="absolute bottom-px rounded-full bg-darkPink px-1.5 text-xs font-bold leading-normal text-white ltr:left-px rtl:right-px">
                                        @{{ record.images_count }}
                                    </span>
                                </template>

                                <template v-else>
                                    <div class="relative h-[60px] max-h-[60px] w-full max-w-[60px] rounded border border-dashed border-gray-300 dark:border-gray-800 dark:mix-blend-exclusion dark:invert">
                                        <img src="{{ bagisto_asset('images/product-placeholders/front.svg')}}">

                                        <p class="absolute bottom-1.5 w-full text-center text-[6px] font-semibold text-gray-400">
                                            @lang('admin::app.catalog.products.index.datagrid.product-image')
                                        </p>
                                    </div>
                                </template>
                            </div>

                            <div class="flex flex-col gap-1.5">
                                <p class="text-base font-semibold text-gray-800 dark:text-white">
                                    @{{ $admin.formatPrice(record.price) }}
                                </p>

                                <!-- Parent Product Quantity -->
                                <div v-if="['configurable', 'bundle', 'grouped' , 'booking'].includes(record.type)">
                                    <p class="text-gray-600 dark:text-gray-300">
                                        <span class="text-red-600">N/A</span>
                                    </p>
                                </div>

                                <div v-else>
                                    <p
                                        class="text-gray-600 dark:text-gray-300"
                                        v-if="record.quantity > 0"
                                    >
                                        <span class="text-green-600">
                                            @{{ "@lang('admin::app.catalog.products.index.datagrid.qty-value')".replace(':qty', record.quantity) }}
                                        </span>
                                    </p>

                                    <p
                                        class="text-gray-600 dark:text-gray-300"
                                        v-else
                                    >
                                        <span class="text-red-600">
                                            @lang('admin::app.catalog.products.index.datagrid.out-of-stock')
                                        </span>
                                    </p>
                                </div>

                                <p class="text-gray-600 dark:text-gray-300">
                                    @{{ "@lang('admin::app.catalog.products.index.datagrid.id-value')".replace(':id', record.product_id) }}
                                </p>
                            </div>
                        </div>

                        <!-- Status, Category, Type Columns -->
                        <div class="flex items-center justify-between gap-x-4">
                            <div class="flex flex-col gap-1.5">
                                <p :class="[record.status ? 'label-active': 'label-info']">
                                    @{{ record.status ? "@lang('admin::app.catalog.products.index.datagrid.active')" : "@lang('admin::app.catalog.products.index.datagrid.disable')" }}
                                </p>

                                <p class="text-gray-600 dark:text-gray-300">
                                    @{{ record.category_name ?? 'N/A' }}
                                </p>

                                <p class="text-gray-600 dark:text-gray-300">
                                    @{{ record.type }}
                                </p>
                            </div>

                            <p
                                class="flex items-center gap-1.5"
                                v-if="available.actions.length"
                            >
                                <span
                                    class="cursor-pointer rounded-md p-1.5 text-2xl transition-all hover:bg-gray-200 dark:hover:bg-gray-800 max-sm:place-self-center"
                                    :class="action.icon"
                                    v-text="! action.icon ? action.title : ''"
                                    v-for="action in record.actions"
                                    @click="performAction(action)"
                                >
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </template>
        </template>
    </x-admin::datagrid>

    {!! view_render_event('bagisto.admin.catalog.products.list.after') !!}

    @pushOnce('scripts')
        <script
            type="text/x-template"
            id="v-create-product-form-template"
        >
            <div>
                <!-- Product Create Button -->
                @if (bouncer()->hasPermission('catalog.products.create'))
                    <button
                        type="button"
                        class="primary-button"
                        @click="$refs.productCreateModal.toggle()"
                    >
                        @lang('admin::app.catalog.products.index.create-btn')
                    </button>
                @endif

                <x-admin::form
                    v-slot="{ meta, errors, handleSubmit }"
                    as="div"
                >
                    <form @submit="handleSubmit($event, create)">
                        <!-- Customer Create Modal -->
                        <x-admin::modal ref="productCreateModal">
                            <!-- Modal Header -->
                            <x-slot:header>
                                <p
                                    class="text-lg font-bold text-gray-800 dark:text-white"
                                    v-if="! attributes.length"
                                >
                                    @lang('admin::app.catalog.products.index.create.title')
                                </p>

                                <p
                                    class="text-lg font-bold text-gray-800 dark:text-white"
                                    v-else
                                >
                                    @lang('admin::app.catalog.products.index.create.configurable-attributes')
                                </p>
                            </x-slot>

                            <!-- Modal Content -->
                            <x-slot:content>
                                <div v-show="! attributes.length" class="product-create-modal__body">
                                    {!! view_render_event('bagisto.admin.catalog.products.create_form.general.controls.before') !!}

                                    <!-- Product Type -->
                                    <x-admin::form.control-group class="product-create-field product-create-field--type">
                                        <x-admin::form.control-group.label class="required">
                                            @lang('admin::app.catalog.products.index.create.type')
                                        </x-admin::form.control-group.label>

                                        <x-admin::form.control-group.control
                                            type="select"
                                            name="type"
                                            rules="required"
                                            :label="trans('admin::app.catalog.products.index.create.type')"
                                        >
                                            @foreach(collect(config('product_types'))->except(['virtual', 'downloadable', 'bundle']) as $key => $type)
                                                <option value="{{ $key }}">
                                                    @lang($type['name'])
                                                </option>
                                            @endforeach
                                        </x-admin::form.control-group.control>

                                        <p class="product-create-hint">
                                            <span class="product-create-hint__icon" aria-hidden="true">ℹ</span>
                                            <span class="product-create-hint__text">
                                            @php
                                                $typeHint = __('admin::app.catalog.products.index.create.type-hint');
                                                $typeHint = preg_replace('/\*([^*]+)\*/', '<span class="product-create-type-name">$1</span>', $typeHint);
                                            @endphp
                                            {!! $typeHint !!}
                                            </span>
                                        </p>
                                        <x-admin::form.control-group.error control-name="type" />
                                    </x-admin::form.control-group>

                                    <!-- Attribute Family Id -->
                                    <x-admin::form.control-group class="product-create-field product-create-field--family">
                                        <x-admin::form.control-group.label class="required">
                                            @lang('admin::app.catalog.products.index.create.family')
                                        </x-admin::form.control-group.label>

                                        <x-admin::form.control-group.control
                                            type="select"
                                            name="attribute_family_id"
                                            rules="required"
                                            :label="trans('admin::app.catalog.products.index.create.family')"
                                        >
                                            @foreach($families as $family)
                                                <option value="{{ $family->id }}">
                                                    {{ $family->name }}
                                                </option>
                                            @endforeach
                                        </x-admin::form.control-group.control>

                                        <p class="product-create-hint">
                                            <span class="product-create-hint__icon" aria-hidden="true">ℹ</span>
                                            <span class="product-create-hint__text">@lang('admin::app.catalog.products.index.create.family-hint')</span>
                                        </p>
                                        <x-admin::form.control-group.error control-name="attribute_family_id" />
                                    </x-admin::form.control-group>

                                    <!-- SKU -->
                                    <x-admin::form.control-group class="product-create-field">
                                        <x-admin::form.control-group.label class="required">
                                            @lang('admin::app.catalog.products.index.create.sku')
                                        </x-admin::form.control-group.label>

                                        <x-admin::form.control-group.control
                                            type="text"
                                            name="sku"
                                            ::rules="{ required: true, regex: /^[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)*$/ }"
                                            :label="trans('admin::app.catalog.products.index.create.sku')"
                                            :placeholder="trans('admin::app.catalog.products.index.create.sku-placeholder')"
                                        />

                                        <x-admin::form.control-group.error control-name="sku" />
                                    </x-admin::form.control-group>

                                    {!! view_render_event('bagisto.admin.catalog.products.create_form.general.controls.after') !!}
                                </div>

                                <div v-show="attributes.length">
                                    {!! view_render_event('bagisto.admin.catalog.products.create_form.attributes.controls.before') !!}

                                    <div
                                        class="mb-2.5"
                                        v-for="attribute in attributes"
                                    >
                                        <label
                                            class="block text-xs font-medium leading-6 text-gray-800 dark:text-white"
                                            v-text="attribute.name"
                                        >
                                        </label>

                                        <div class="flex min-h-[38px] flex-wrap gap-1 rounded-md border p-1.5 dark:border-gray-800">
                                            <p
                                                class="flex items-center rounded bg-gray-600 px-2 py-1 font-semibold text-white"
                                                v-for="option in attribute.options"
                                            >
                                                @{{ option.name }}

                                                <span
                                                    class="icon-cross cursor-pointer text-lg text-white ltr:ml-1.5 rtl:mr-1.5"
                                                    @click="removeOption(option)"
                                                >
                                                </span>
                                            </p>
                                        </div>
                                    </div>

                                    {!! view_render_event('bagisto.admin.catalog.products.create_form.attributes.controls.after') !!}
                                </div>
                            </x-slot>

                            <!-- Modal Footer -->
                            <x-slot:footer>
                                <div class="flex items-center gap-x-2.5">
                                    <!-- Back Button -->
                                    <x-admin::button
                                        button-type="button"
                                        class="transparent-button hover:bg-gray-200 dark:text-white dark:hover:bg-gray-800"
                                        :title="trans('admin::app.catalog.products.index.create.back-btn')"
                                        v-if="attributes.length"
                                        @click="attributes = []"
                                    />

                                    <!-- Save Button -->
                                    <x-admin::button
                                        type="submit"
                                        class="primary-button"
                                        :title="trans('admin::app.catalog.products.index.create.save-btn')"
                                        ::loading="isLoading"
                                        ::disabled="isLoading"
                                    />
                                </div>
                            </x-slot>
                        </x-admin::modal>
                    </form>
                </x-admin::form>
            </div>
        </script>

        <script type="module">
            app.component('v-create-product-form', {
                template: '#v-create-product-form-template',

                data() {
                    return {
                        attributes: [],

                        superAttributes: {},

                        isLoading: false,
                    };
                },

                methods: {
                    create(params, { resetForm, resetField, setErrors }) {
                        this.isLoading = true;

                        this.attributes.forEach(attribute => {
                            params.super_attributes ||= {};

                            params.super_attributes[attribute.code] = this.superAttributes[attribute.code];
                        });

                        this.$axios.post("{{ route('admin.catalog.products.store') }}", params)
                            .then((response) => {
                                this.isLoading = false;

                                if (response.data.data.redirect_url) {
                                    window.location.href = response.data.data.redirect_url;
                                } else {
                                    this.attributes = response.data.data.attributes;

                                    this.setSuperAttributes();
                                }
                            })
                            .catch(error => {
                                this.isLoading = false;

                                if (error.response.status == 422) {
                                    setErrors(error.response.data.errors);
                                }
                            });
                    },

                    removeOption(option) {
                        this.attributes.forEach(attribute => {
                            attribute.options = attribute.options.filter(item => item.id != option.id);
                        });

                        this.attributes = this.attributes.filter(attribute => attribute.options.length > 0);

                        this.setSuperAttributes();
                    },

                    setSuperAttributes() {
                        this.superAttributes = {};

                        this.attributes.forEach(attribute => {
                            this.superAttributes[attribute.code] = [];

                            attribute.options.forEach(option => {
                                this.superAttributes[attribute.code].push(option.id);
                            });
                        });
                    }
                }
            })
        </script>
    @endPushOnce

    @pushOnce('styles')
    <style>
    /* Product create modal: clear, friendly UI (pure CSS) */
    .product-create-modal__body {
        padding: 0.25rem 0;
        width: 100%;
        max-width: 100%;
        columns: 1;
    }
    .product-create-field { margin-bottom: 1.25rem; }
    .product-create-field:last-child { margin-bottom: 0; }
    .product-create-hint {
        display: flex;
        align-items: flex-start;
        gap: 0.5rem;
        margin-top: 0.5rem;
        padding: 0.5rem 0.75rem;
        font-size: 0.8125rem;
        line-height: 1.4;
        color: #475569;
        background: #f0f9ff;
        border: 1px solid #bae6fd;
        border-radius: 8px;
        width: 100%;
        max-width: 100%;
        min-width: 0;
        columns: 1;
        box-sizing: border-box;
    }
    .product-create-hint > span:last-child,
    .product-create-hint .product-create-type-name {
        flex: 1 1 auto;
        min-width: 0;
    }
    .product-create-hint__text {
        flex: 1 1 auto;
        min-width: 0;
        columns: 1;
    }
    html.dark .product-create-hint {
        color: #94a3b8;
        background: rgba(30, 58, 138, 0.25);
        border-color: #334155;
    }
    .product-create-hint__icon {
        flex-shrink: 0;
        flex-grow: 0;
        flex-basis: 18px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 18px;
        min-width: 18px;
        height: 18px;
        min-height: 18px;
        border-radius: 50%;
        background: #0ea5e9;
        color: #fff;
        font-size: 0.7rem;
        font-weight: 700;
        line-height: 1;
        box-sizing: border-box;
    }
    html.dark .product-create-hint__icon { background: #3b82f6; }

    /* Type & Family dropdowns: bolder, distinct color for easier scanning */
    .product-create-field--type select,
    .product-create-field--family select {
        font-weight: 600;
        color: #1e40af;
    }
    .product-create-field--type select option,
    .product-create-field--family select option {
        font-weight: 600;
        color: #1e3a8a;
    }
    html.dark .product-create-field--type select,
    html.dark .product-create-field--family select {
        color: #93c5fd;
    }
    html.dark .product-create-field--type select option,
    html.dark .product-create-field--family select option {
        color: #e2e8f0;
        background: #1e293b;
    }

    /* Type names in hint: bold + color for quick scanning */
    .product-create-type-name {
        font-weight: 700;
        color: #1e40af;
    }
    html.dark .product-create-type-name {
        color: #93c5fd;
    }
    </style>
    @endPushOnce
</x-admin::layouts>
