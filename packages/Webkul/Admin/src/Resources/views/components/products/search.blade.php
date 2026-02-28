<v-product-search {{ $attributes }}></v-product-search>

@pushOnce('scripts')
    <script
        type="text/x-template"
        id="v-product-search-template"
    >
        <!-- Search Drawer -->
        <x-admin::drawer
            ref="searchProductDrawer"
            @close="onDrawerClose"
        >
            <!-- Drawer Header -->
            <x-slot:header>
                <div class="grid gap-3">
                    <div class="flex items-center justify-between">
                        <p class="text-xl font-medium dark:text-white">
                            @lang('admin::app.components.products.search.title')
                        </p>

                        <div
                            class="primary-button ltr:mr-11 rtl:ml-11"
                            @click="addSelected"
                        >
                            @lang('admin::app.components.products.search.add-btn')
                        </div>
                    </div>

                    <p class="text-sm text-gray-500 dark:text-gray-400">
                        @lang('admin::app.components.products.search.search-hint')
                    </p>

                    <div class="relative w-full">
                        <input
                            type="text"
                            class="block w-full rounded-lg border bg-white py-2 leading-6 text-gray-600 transition-all hover:border-gray-400 dark:border-gray-800 dark:bg-gray-900 dark:text-gray-300 ltr:pl-3 ltr:pr-10 rtl:pl-10 rtl:pr-3"
                            placeholder="{{ trans('admin::app.components.products.search.search-placeholder') }}"
                            v-model="searchTerm"
                            v-debounce="320"
                        />

                        <template v-if="isSearching">
                            <img
                                class="absolute top-2.5 h-5 w-5 animate-spin ltr:right-3 rtl:left-3"
                                src="{{ bagisto_asset('images/spinner.svg') }}"
                            />
                        </template>

                        <template v-else>
                            <span class="icon-search pointer-events-none absolute top-1.5 flex items-center text-2xl ltr:right-3 rtl:left-3"></span>
                        </template>
                    </div>
                </div>
            </x-slot>

            <!-- Drawer Content -->
            <x-slot:content class="!p-0">
                <div
                    class="grid"
                    v-if="filteredSearchedProducts.length"
                >
                    <div
                        class="flex justify-between gap-2.5 border-b border-slate-300 px-4 py-6 dark:border-gray-800"
                        v-for="product in filteredSearchedProducts"
                        :key="product.id"
                    >
                        <!-- Information -->
                        <div class="flex gap-2.5">
                            <!-- Checkbox -->
                            <div class="">
                                <input
                                    type="checkbox"
                                    class="peer sr-only"
                                    :id="'searched-product' + product.id"
                                    v-model="product.selected"
                                />

                                <label
                                    class="icon-uncheckbox peer-checked:icon-checked cursor-pointer text-2xl peer-checked:text-blue-600"
                                    :for="'searched-product' + product.id"
                                >
                                </label>
                            </div>

                            <!-- Image -->
                            <div
                                class="relative h-[60px] max-h-[60px] w-full max-w-[60px] overflow-hidden rounded"
                                :class="{'border border-dashed border-gray-300 dark:border-gray-800 dark:mix-blend-exclusion dark:invert': ! product.images.length}"
                            >
                                <template v-if="! product.images.length">
                                    <img src="{{ bagisto_asset('images/product-placeholders/front.svg') }}">
                                
                                    <p class="absolute bottom-1.5 w-full text-center text-[6px] font-semibold text-gray-400">
                                        @lang('admin::app.components.products.search.product-image')
                                    </p>
                                </template>

                                <template v-else>
                                    <img :src="product.images[0].url">
                                </template>
                            </div>

                            <!-- Details -->
                            <div class="grid place-content-start gap-1.5">
                                <p class="text-base font-semibold text-gray-800 dark:text-white">
                                    @{{ product.name }}
                                </p>

                                <p class="text-gray-600 dark:text-gray-300">
                                    @{{ "@lang('admin::app.components.products.search.sku')".replace(':sku', product.sku) }}
                                </p>
                            </div>
                        </div>

                        <!-- Actions -->
                        <div class="grid place-content-start gap-1 text-right">
                            <p class="font-semibold text-gray-800 dark:text-white">
                                @{{ product.formatted_price }}
                            </p>

                            <p class="text-green-600">
                                @{{ "@lang('admin::app.components.products.search.qty')".replace(':qty', totalQty(product)) }}
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <div
                    v-if="pagination.lastPage > 1"
                    class="flex flex-wrap items-center justify-between gap-2 border-t border-slate-300 px-4 py-3 dark:border-gray-800"
                >
                    <p class="text-sm text-gray-600 dark:text-gray-400">
                        @lang('admin::app.components.products.search.pagination-showing'):
                        @{{ pagination.from }} – @{{ pagination.to }}
                        @lang('admin::app.components.products.search.pagination-of')
                        @{{ pagination.total }}
                    </p>
                    <div class="flex gap-1">
                        <button
                            type="button"
                            class="rounded border border-gray-300 bg-white px-3 py-1.5 text-sm text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:bg-gray-800 dark:text-gray-300 dark:hover:bg-gray-700"
                            :disabled="pagination.currentPage <= 1"
                            @click="goToPage(pagination.currentPage - 1)"
                        >
                            ←
                        </button>
                        <span class="flex items-center px-2 text-sm text-gray-600 dark:text-gray-400">
                            @{{ pagination.currentPage }} / @{{ pagination.lastPage }}
                        </span>
                        <button
                            type="button"
                            class="rounded border border-gray-300 bg-white px-3 py-1.5 text-sm text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:bg-gray-800 dark:text-gray-300 dark:hover:bg-gray-700"
                            :disabled="pagination.currentPage >= pagination.lastPage"
                            @click="goToPage(pagination.currentPage + 1)"
                        >
                            →
                        </button>
                    </div>
                </div>

                <!-- For Empty Variations -->
                <div
                    class="grid justify-center justify-items-center gap-3.5 px-2.5 py-10"
                    v-else-if="!isSearching"
                >
                    <!-- Placeholder Image -->
                    <img
                        src="{{ bagisto_asset('images/icon-add-product.svg') }}"
                        class="h-20 w-20 dark:mix-blend-exclusion dark:invert"
                    />

                    <!-- Add Variants Information -->
                    <div class="flex flex-col items-center gap-1.5">
                        <p class="text-base font-semibold text-gray-400">
                            @lang('admin::app.components.products.search.empty-title')
                        </p>

                        <p class="text-center text-gray-400 max-w-md">
                            @lang('admin::app.components.products.search.empty-info')
                        </p>
                    </div>
                </div>
            </x-slot>
        </x-admin::drawer>
    </script>

    <script type="module">
        app.component('v-product-search', {
            template: '#v-product-search-template',

            props: {
                addedProductIds: {
                    type: Array,
                    default: []                    
                },

                queryParams: {
                    type: Object,
                    default: () => ({})
                },
            },

            data() {
                return {
                    searchTerm: '',

                    searchedProducts: [],

                    isSearching: false,

                    searchDebounceTimer: null,

                    pagination: {
                        currentPage: 1,
                        lastPage: 1,
                        total: 0,
                        perPage: 12,
                        from: 0,
                        to: 0,
                    },
                }
            },

            computed: {
                filteredSearchedProducts() {
                    return this.searchedProducts.filter(product => ! this.addedProductIds.includes(product.id));
                }
            },

            watch: {
                searchTerm: function() {
                    let self = this;
                    if (this.searchDebounceTimer) {
                        clearTimeout(this.searchDebounceTimer);
                    }
                    this.searchDebounceTimer = setTimeout(function() {
                        self.search(1);
                    }, 320);
                }
            },

            methods: {
                onDrawerClose() {
                    this.searchTerm = '';
                    this.searchedProducts = [];
                    this.pagination = { currentPage: 1, lastPage: 1, total: 0, perPage: 12, from: 0, to: 0 };
                    if (this.searchDebounceTimer) {
                        clearTimeout(this.searchDebounceTimer);
                        this.searchDebounceTimer = null;
                    }
                },

                openDrawer() {
                    this.$refs.searchProductDrawer.open();
                    this.searchTerm = '';
                    this.search(1);
                },

                search(page) {
                    page = page || 1;

                    this.isSearching = true;

                    let self = this;

                    this.$axios.get("{{ route('admin.catalog.products.search') }}", {
                            params: {
                                query: this.searchTerm,
                                page: page,
                                limit: 12,
                                ...this.queryParams
                            }
                        })
                        .then(function(response) {
                            self.isSearching = false;
                            self.searchedProducts = response.data.data || [];
                            let meta = response.data.meta || response.meta || {};
                            self.pagination = {
                                currentPage: meta.current_page || 1,
                                lastPage: meta.last_page || 1,
                                total: meta.total || 0,
                                perPage: meta.per_page || 12,
                                from: meta.from || 0,
                                to: meta.to || 0,
                            };
                        })
                        .catch(function () {
                            self.isSearching = false;
                            self.searchedProducts = [];
                        });
                },

                goToPage(page) {
                    if (page < 1 || page > this.pagination.lastPage) return;
                    this.search(page);
                },

                addSelected() {
                    let selectedProducts = this.searchedProducts.filter(product => product.selected);

                    this.$emit('onProductAdded', selectedProducts);

                    this.$refs.searchProductDrawer.close();
                },

                totalQty(product) {
                    let qty = 0;

                    product.inventories.forEach(function (inventory) {
                        qty += inventory.qty;
                    });

                    return qty;
                }
            }
        });
    </script>
@endPushOnce