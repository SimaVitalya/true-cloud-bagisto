{!! view_render_event('bagisto.admin.catalog.product.edit.form.categories.before', ['product' => $product]) !!}

<!-- Panel -->
<div class="box-shadow rounded bg-white p-4 dark:bg-gray-900">
    <!-- Panel Header -->
    <p class="mb-1 text-base font-semibold text-gray-800 dark:text-white">
        @lang('admin::app.catalog.products.edit.categories.title')
    </p>
    <p class="admin-hint mb-4">
        <span class="admin-hint__icon" aria-hidden="true">ℹ</span>
        @lang('admin::app.catalog.products.edit.categories.hint')
    </p>

    {!! view_render_event('bagisto.admin.catalog.product.edit.form.categories.controls.before', ['product' => $product]) !!}

    <!-- Panel Content -->
    <div class="mb-5 text-sm text-gray-600 dark:text-gray-300 product-categories-tree">

        <v-product-categories>
            <x-admin::shimmer.tree />
        </v-product-categories>

    </div>

    {!! view_render_event('bagisto.admin.catalog.product.edit.form.categories.controls.after', ['product' => $product]) !!}
</div>

{!! view_render_event('bagisto.admin.catalog.product.edit.form.categories.after', ['product' => $product]) !!}

@pushOnce('scripts')
    <script
        type="text/x-template"
        id="v-product-categories-template"
    >
        <div>
            <template v-if="isLoading">
                <x-admin::shimmer.tree />
            </template>

            <template v-else>
                <x-admin::tree.view
                    input-type="checkbox"
                    selection-type="individual"
                    name-field="categories"
                    id-field="id"
                    value-field="id"
                    ::items="categories"
                    :value="json_encode($product->categories->pluck('id'))"
                    :fallback-locale="config('app.fallback_locale')"
                />
            </template>
        </div>
    </script>

    <script type="module">
        app.component('v-product-categories', {
            template: '#v-product-categories-template',

            data() {
                return {
                    isLoading: true,

                    categories: [],
                }
            },

            mounted() {
                this.get();
            },

            methods: {
                get() {
                    axios.get("{{ route('admin.catalog.categories.tree') }}", { // Update this line
                            params: {
                                channel: "{{ $currentChannel->code }}",
                            }
                        })
                        .then(response => {
                            this.isLoading = false;

                            this.categories = response.data.data;
                        }).catch(error => {
                            console.log(error);
                        });
                }
            }
        });
    </script>
@endpushOnce
