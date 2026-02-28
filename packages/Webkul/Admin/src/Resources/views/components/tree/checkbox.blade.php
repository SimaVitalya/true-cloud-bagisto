@pushOnce('scripts')
    <script
        type="text/x-template"
        id="v-tree-checkbox-template"
    >
        <label
            :for="id"
            class="tree-checkbox-label group inline-flex w-max cursor-pointer select-none items-center gap-2.5 p-1.5"
        >
            <input
                type="checkbox"
                :name="[name + '[]']"
                :value="value"
                :id="id"
                class="peer hidden"
                :checked="isActive"
                @change="inputChanged()"
            />

            <span
                class="tree-checkbox-box cursor-pointer inline-flex h-5 w-5 shrink-0 items-center justify-center overflow-hidden rounded-full text-xl"
                :class="isActive ? 'icon-checked text-blue-600' : 'icon-uncheckbox'"
            >
            </span>

            <div class="tree-checkbox-text cursor-pointer text-sm text-gray-600 hover:text-gray-800 dark:text-gray-300 dark:hover:text-white">
                @{{ label }}
            </div>
        </label>
    </script>

    <script type="module">
        app.component('v-tree-checkbox', {
            template: '#v-tree-checkbox-template',

            name: 'v-tree-checkbox',

            props: ['id', 'label', 'name', 'value'],

            computed: {
                isActive() {
                    return this.$parent.has(this.value);
                },
            },

            methods: {
                inputChanged() {
                    this.$emit('change-input', {
                        id: this.id,
                        label: this.label,
                        name: this.name,
                        value: this.value,
                    });
                },
            },
        });
    </script>
@endPushOnce

@pushOnce('styles')
<style>
/* Tree checkboxes: clear rows, spacing, hover (pure CSS) */
.v-tree-item-wrapper { display: flex; flex-direction: column; gap: 2px; }
.v-tree-item {
    display: flex !important;
    align-items: center;
    gap: 0.35rem;
    padding: 0.5rem 0.6rem;
    border-radius: 8px;
    transition: background 0.15s;
}
.v-tree-item:hover { background: #f1f5f9; }
html.dark .v-tree-item:hover { background: #1e293b; }
.tree-checkbox-label {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.2rem 0;
    min-height: 28px;
}
.tree-checkbox-box {
    border-radius: 9999px;
    flex-shrink: 0;
    overflow: hidden;
    width: 1.25rem;
    height: 1.25rem;
    border: 2px solid #94a3b8;
    background: transparent;
    box-sizing: border-box;
}
html.dark .tree-checkbox-box {
    border-color: #64748b;
}
.tree-checkbox-box.icon-uncheckbox:before {
    content: none !important;
}
.tree-checkbox-box.icon-checked {
    background: #2563eb;
    border-color: #2563eb;
}
html.dark .tree-checkbox-box.icon-checked {
    background: #3b82f6;
    border-color: #3b82f6;
}
.tree-checkbox-box.icon-checked:before {
    color: #fff !important;
    font-size: 0.75rem;
}
.tree-checkbox-text {
    font-size: 0.875rem;
    font-weight: 500;
    color: #475569;
}
html.dark .tree-checkbox-text { color: #94a3b8; }
.v-tree-item .icon-folder,
.v-tree-item .icon-attribute { color: #64748b; }
html.dark .v-tree-item .icon-folder,
html.dark .v-tree-item .icon-attribute { color: #94a3b8; }
</style>
@endPushOnce
