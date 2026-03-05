<x-admin::layouts>
    <x-slot:title>
        @lang('admin::app.marketing.communications.email-broadcast.title')
    </x-slot>

    {!! view_render_event('bagisto.admin.marketing.communications.email-broadcast.before') !!}

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>
        /* Контейнер TinyMCE має бути видимим (перебиває inline visibility: hidden) */
        body .tox-tinymce,
        body #broadcast-content-wrap .tox-tinymce,
        .tox-tinymce {
            visibility: visible !important;
            min-height: 300px !important;
            height: 400px !important;
        }
        #broadcast-content-wrap {
            visibility: visible !important;
            min-height: 320px;
        }
    </style>

    <!-- Email Broadcast Form -->
    <div class="flex items-center justify-between flex-wrap gap-2">
        <p class="text-xl font-bold text-gray-800 dark:text-white">
            @lang('admin::app.marketing.communications.email-broadcast.title')
        </p>
        <p class="text-sm text-gray-600 dark:text-gray-400" id="last-sent-block" data-label="@lang('admin::app.marketing.communications.email-broadcast.last-sent')">
            @lang('admin::app.marketing.communications.email-broadcast.last-sent'): <strong>{{ $lastSentAt ?? '—' }}</strong>
        </p>
    </div>

    <!-- Form Container -->
    <div class="mt-3.5 flex gap-2.5 max-xl:flex-wrap">
        <!-- Left Section -->
        <div class="flex flex-1 flex-col gap-2 max-xl:flex-auto">
            {!! view_render_event('bagisto.admin.marketing.communications.email-broadcast.card.content.before') !!}

            <!-- Content Section -->
            <div class="box-shadow rounded bg-white p-4 dark:bg-gray-900">
                <p class="mb-4 text-base font-semibold text-gray-800 dark:text-white">
                    @lang('admin::app.marketing.communications.email-broadcast.content')
                </p>

                <!-- Email Template Selection -->
                <div class="mb-4">
                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-300">
                        @lang('admin::app.marketing.communications.email-broadcast.template')
                    </label>
                    <select
                        id="email_template_id"
                        class="w-full cursor-pointer rounded border border-gray-300 dark:border-gray-600 dark:bg-gray-800 dark:text-white px-3 py-2 text-sm"
                        onchange="applyEmailTemplate()"
                    >
                        <option value="">
                            @lang('admin::app.marketing.communications.email-broadcast.select-template')
                        </option>
                        @foreach($emailTemplates as $tpl)
                            <option value="{{ $tpl->id }}">{{ $tpl->name }}</option>
                        @endforeach
                    </select>
                    <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">
                        @lang('admin::app.marketing.communications.email-broadcast.or-manual')
                    </p>
                </div>

                @php
                    $templatesForJs = isset($emailTemplates) ? $emailTemplates->keyBy('id')->map(fn($t) => ['name' => $t->name]) : collect();
                @endphp
                <script type="application/json" id="email-templates-json">{!! json_encode($templatesForJs) !!}</script>
                <script>
                    (function() {
                        var el = document.getElementById('email-templates-json');
                        window.__emailTemplatesNames = el ? (function(){ try { return JSON.parse(el.textContent); } catch(e) { return {}; } })() : {};
                    })();
                </script>

                <form id="email-broadcast-form">
                    @csrf
                    
                    <!-- Subject -->
                    <div class="mb-2.5">
                        <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-300">
                            <span class="required">*</span>
                            @lang('admin::app.marketing.communications.email-broadcast.subject')
                        </label>
                        <input
                            type="text"
                            id="subject"
                            name="subject"
                            oninput="updateSendButton()"
                            placeholder="{{ trans('admin::app.marketing.communications.email-broadcast.subject-placeholder') }}"
                            class="w-full rounded-md border border-gray-300 px-3 py-2.5 text-sm text-gray-600 transition-all hover:border-gray-400 focus:border-gray-400 dark:border-gray-800 dark:bg-gray-900 dark:text-gray-300 dark:hover:border-gray-400 dark:focus:border-gray-400"
                        />
                    </div>

                    <!-- Content -->
                    <div class="mb-2.5" id="broadcast-content-wrap">
                        <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-300">
                            <span class="required">*</span>
                            @lang('admin::app.marketing.communications.email-broadcast.message')
                        </label>
                        <p class="mb-2 text-xs text-gray-500 dark:text-gray-400" id="broadcast-editor-hint">
                            <button type="button" id="broadcast-enable-rich-editor" class="text-blue-600 dark:text-blue-400 hover:underline">
                                {{ trans('admin::app.marketing.communications.email-broadcast.enable-rich-editor') }}
                            </button>
                        </p>
                        <textarea
                            id="content"
                            name="content"
                            rows="10"
                            oninput="updateSendButton()"
                            placeholder="{{ trans('admin::app.marketing.communications.email-broadcast.message-placeholder') }}"
                            class="w-full rounded-md border border-gray-300 px-3 py-2.5 text-sm text-gray-600 transition-all hover:border-gray-400 focus:border-gray-400 dark:border-gray-800 dark:bg-gray-900 dark:text-gray-300 dark:hover:border-gray-400 dark:focus:border-gray-400"
                        ></textarea>
                    </div>
                </form>
            </div>

            {!! view_render_event('bagisto.admin.marketing.communications.email-broadcast.card.content.after') !!}
        </div>

        <!-- Right Section -->
        <div class="flex w-[360px] max-w-full flex-col gap-2 max-md:w-full">
            {!! view_render_event('bagisto.admin.marketing.communications.email-broadcast.card.recipients.before') !!}

            <!-- Recipients Section -->
            <div class="box-shadow rounded bg-white p-4 dark:bg-gray-900">
                <p class="mb-4 text-base font-semibold text-gray-800 dark:text-white">
                    @lang('admin::app.marketing.communications.email-broadcast.recipients')
                </p>

                <!-- Recipient Type -->
                <div class="mb-2.5">
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label class="required">
                            @lang('admin::app.marketing.communications.email-broadcast.recipient-type')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="select"
                            id="recipient_type"
                            name="recipient_type"
                            rules="required"
                            class="cursor-pointer"
                            :label="trans('admin::app.marketing.communications.email-broadcast.recipient-type')"
                            onchange="toggleRecipientSections()"
                        >
                            <option value="">
                                @lang('admin::app.marketing.communications.email-broadcast.select-recipient-type')
                            </option>
                            <option value="group">
                                @lang('admin::app.marketing.communications.email-broadcast.customer-group')
                            </option>
                            <option value="email">
                                @lang('admin::app.marketing.communications.email-broadcast.single-email')
                            </option>
                        </x-admin::form.control-group.control>

                        <x-admin::form.control-group.error control-name="recipient_type" />
                    </x-admin::form.control-group>
                </div>

                <!-- Customer Group Selection -->
                <div class="mb-2.5" id="customer-group-section" style="display: none;">
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label class="required">
                            @lang('admin::app.marketing.communications.email-broadcast.customer-group')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="select"
                            id="customer_group_id"
                            name="customer_group_id"
                            class="cursor-pointer"
                            onchange="updateSendButton()"
                            :label="trans('admin::app.marketing.communications.email-broadcast.customer-group')"
                        >
                            <option value="">
                                @lang('admin::app.marketing.communications.email-broadcast.select-group')
                            </option>

                            @foreach ($customerGroups as $group)
                                <option value="{{ $group->id }}">
                                    {{ $group->name }}
                                </option>
                            @endforeach
                        </x-admin::form.control-group.control>

                        <x-admin::form.control-group.error control-name="customer_group_id" />
                    </x-admin::form.control-group>

                    <!-- Customer Count Display -->
                    <div class="mt-2 text-sm text-gray-600 dark:text-gray-300" id="customer-count">
                        <span id="customer-count-text"></span>
                    </div>
                </div>

                <!-- Single Email Input -->
                <div class="mb-2.5" id="single-email-section" style="display: none;">
                    <x-admin::form.control-group>
                        <x-admin::form.control-group.label class="required">
                            @lang('admin::app.marketing.communications.email-broadcast.email-address')
                        </x-admin::form.control-group.label>

                        <x-admin::form.control-group.control
                            type="email"
                            id="email_address"
                            name="email_address"
                            oninput="updateSendButton()"
                            :label="trans('admin::app.marketing.communications.email-broadcast.email-address')"
                            :placeholder="trans('admin::app.marketing.communications.email-broadcast.email-placeholder')"
                        />

                        <x-admin::form.control-group.error control-name="email_address" />
                    </x-admin::form.control-group>
                </div>

                <!-- Send Button -->
                <div class="mt-4">
                    <button
                        type="button"
                        id="send-email-btn"
                        class="primary-button w-full"
                        onclick="sendEmail()"
                        disabled
                    >
                        @lang('admin::app.marketing.communications.email-broadcast.send-email')
                    </button>
                </div>

                <!-- Status Messages -->
                <div id="status-messages" class="mt-4" style="display: none;">
                    <div id="success-message" class="hidden p-3 mb-2 text-sm text-green-800 bg-green-100 border border-green-200 rounded dark:bg-green-800 dark:text-green-100 dark:border-green-700"></div>
                    <div id="error-message" class="hidden p-3 mb-2 text-sm text-red-800 bg-red-100 border border-red-200 rounded dark:bg-red-800 dark:text-red-100 dark:border-red-700"></div>
                </div>
            </div>

            {!! view_render_event('bagisto.admin.marketing.communications.email-broadcast.card.recipients.after') !!}
        </div>
    </div>

    {!! view_render_event('bagisto.admin.marketing.communications.email-broadcast.after') !!}

    <script>
        // ——— Поведінка: 1) Без шаблону — завжди є редактор (TinyMCE) для ручного введення.
        // ——— 2) Якщо вибрано шаблон — підставляються тема й контент у поле теми та в редактор.

        function htmlToPlainText(html) {
            if (!html) return '';
            var text = String(html);
            text = text.replace(/<br\s*\/?>/gi, '\n');
            text = text.replace(/<\/p>/gi, '\n');
            text = text.replace(/<p[^>]*>/gi, '');
            text = text.replace(/<\/?[a-z][^>]*>/gi, '');
            text = text.replace(/&nbsp;/gi, ' ');
            text = text.replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"');
            return text.replace(/\n{3,}/g, '\n\n').trim();
        }

        function setBroadcastEditorContent(html) {
            var contentEl = document.getElementById('content');
            var safeHtml = (html || '').trim();
            if (contentEl) {
                contentEl.value = safeHtml;
            }
            window.__pendingBroadcastContent = safeHtml;
            var editor = (typeof tinymce !== 'undefined' && tinymce.get('content')) ? tinymce.get('content') : null;
            if (editor) {
                editor.setContent(safeHtml, { format: 'html' });
            }
            updateSendButton();
        }

        // Ensure TinyMCE is inited; if already inited, set content; otherwise init and set content when ready
        function ensureBroadcastTinyMCE(html) {
            var safeHtml = (html || '').trim();
            window.__pendingBroadcastContent = safeHtml;
            var contentEl = document.getElementById('content');
            if (contentEl) contentEl.value = safeHtml;

            var editor = (typeof tinymce !== 'undefined' && tinymce.get('content')) ? tinymce.get('content') : null;
            if (editor) {
                editor.setContent(safeHtml, { format: 'html' });
                updateSendButton();
                return;
            }
            var hint = document.getElementById('broadcast-editor-hint');
            if (hint) hint.style.display = 'none';
            window.__broadcastTinyMCEInited = true;
            initBroadcastTinyMCE();
            // Якщо редактор ще завантажується — кілька разів підставити контент, коли з'явиться
            var attempts = 0;
            var interval = setInterval(function() {
                attempts++;
                var ed = (typeof tinymce !== 'undefined' && tinymce.get('content')) ? tinymce.get('content') : null;
                if (ed && safeHtml) {
                    ed.setContent(safeHtml, { format: 'html' });
                    clearInterval(interval);
                    updateSendButton();
                }
                if (attempts >= 25) {
                    clearInterval(interval);
                    updateSendButton();
                }
            }, 200);
        }

        // Якщо вибрано шаблон — підставляємо тему й контент з сервера у форму й редактор.
        function applyEmailTemplate() {
            var select = document.getElementById('email_template_id');
            var id = select && select.value;
            if (!id) return; // нічого не робимо, якщо шаблон не вибрано — залишається редактор з тим, що вже написано
            var route = '{{ route("admin.marketing.communications.email-broadcast.template", ["id" => "__ID__"]) }}'.replace('__ID__', encodeURIComponent(id));

            var names = window.__emailTemplatesNames || {};
            var nameOpt = names[id] || names[Number(id)];
            if (nameOpt && nameOpt.name && document.getElementById('subject')) {
                document.getElementById('subject').value = (nameOpt.name || '').trim();
            }

            fetch(route, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                credentials: 'same-origin'
            })
            .then(function (res) {
                return res.text().then(function (text) {
                    try {
                        return JSON.parse(text);
                    } catch (e) {
                        return null;
                    }
                });
            })
            .then(function (data) {
                if (!data) return;
                var subjectEl = document.getElementById('subject');
                var html = (data.content != null ? data.content : (data.body != null ? data.body : ''));
                if (typeof html !== 'string') html = '';
                html = html.trim();
                if (subjectEl && data.name) {
                    subjectEl.value = (data.name || '').trim();
                }
                var contentEl = document.getElementById('content');
                if (contentEl) {
                    contentEl.value = html;
                }
                window.__pendingBroadcastContent = html;
                ensureBroadcastTinyMCE(html);
                // Додаткові відкладені підстановки — якщо редактор з’явиться пізніше або оновлення не застосувалось
                [100, 300, 600, 1000].forEach(function (delay) {
                    setTimeout(function () {
                        var ed = (typeof tinymce !== 'undefined' && tinymce.get('content')) ? tinymce.get('content') : null;
                        if (ed && html) {
                            ed.setContent(html, { format: 'html' });
                        }
                        updateSendButton();
                    }, delay);
                });
            })
            .catch(function () {
                updateSendButton();
            });
        }

        // Simple JavaScript for email broadcast
        function toggleRecipientSections() {
            const recipientType = document.getElementById('recipient_type').value;
            const groupSection = document.getElementById('customer-group-section');
            const emailSection = document.getElementById('single-email-section');
            
            // Hide both sections first
            if (groupSection) groupSection.style.display = 'none';
            if (emailSection) emailSection.style.display = 'none';
            
            // Show appropriate section
            if (recipientType === 'group' && groupSection) {
                groupSection.style.display = 'block';
            } else if (recipientType === 'email' && emailSection) {
                emailSection.style.display = 'block';
            }
            
            updateSendButton();
        }
        
        function updateSendButton() {
            const subject = document.getElementById('subject').value.trim();
            var content = (typeof tinymce !== 'undefined' && tinymce.get('content')) ? (tinymce.get('content').getContent() || '') : (document.getElementById('content') ? document.getElementById('content').value : '');
            if (typeof content === 'string') content = content.trim();
            const recipientType = document.getElementById('recipient_type').value;
            const sendButton = document.getElementById('send-email-btn');

            let isValid = subject !== '' && content !== '' && recipientType !== '';
            
            if (recipientType === 'group') {
                const groupId = document.getElementById('customer_group_id').value;
                isValid = isValid && groupId !== '';
            } else if (recipientType === 'email') {
                const email = document.getElementById('email_address').value.trim();
                isValid = isValid && email !== '';
            }
            
            if (sendButton) {
                sendButton.disabled = !isValid;
            }
        }
        
        function sendEmail() {
            const sendButton = document.getElementById('send-email-btn');
            if (sendButton && sendButton.disabled) {
                alert('Пожалуйста, заполните все обязательные поля');
                return;
            }
            
            const formData = new FormData();
            var form = document.getElementById('email-broadcast-form');
            var token = (form && form.querySelector('input[name="_token"]')) ? form.querySelector('input[name="_token"]').value : (document.querySelector('meta[name="csrf-token"]') && document.querySelector('meta[name="csrf-token"]').getAttribute('content'));
            if (!token) {
                alert('Помилка: не знайдено CSRF-токен. Оновіть сторінку.');
                return;
            }
            formData.append('_token', token);
            formData.append('subject', document.getElementById('subject').value);
            var content = (typeof tinymce !== 'undefined' && tinymce.get('content')) ? tinymce.get('content').getContent() : (document.getElementById('content') && document.getElementById('content').value);
            formData.append('content', content || '');
            formData.append('recipient_type', document.getElementById('recipient_type').value);
            
            const recipientType = document.getElementById('recipient_type').value;
            if (recipientType === 'group') {
                formData.append('customer_group_id', document.getElementById('customer_group_id').value);
            } else if (recipientType === 'email') {
                formData.append('email_address', document.getElementById('email_address').value);
            }
            
            // Show loading
            if (sendButton) {
                sendButton.disabled = true;
                sendButton.textContent = '{{ trans("admin::app.marketing.communications.email-broadcast.sending") }}';
            }
            
            fetch('{{ route("admin.marketing.communications.email-broadcast.send") }}', {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                credentials: 'same-origin',
                body: formData
            })
            .then(function(response) {
                return response.text().then(function(text) {
                    var ct = (response.headers.get('content-type') || '').toLowerCase();
                    if (ct.indexOf('application/json') !== -1) {
                        try {
                            return { ok: response.ok, data: JSON.parse(text) };
                        } catch (e) {
                            return { ok: false, data: { success: false, message: 'Сервер повернув некоректні дані.' } };
                        }
                    }
                    if (text && text.trim().indexOf('<!DOCTYPE') === 0) {
                        return { ok: false, data: { success: false, message: 'Сервер повернув сторінку замість даних. Оновіть сторінку та спробуйте знову. Якщо помилка повторюється — перевірте вхід в админку.' } };
                    }
                    return { ok: false, data: { success: false, message: text || 'Помилка мережі' } };
                });
            })
            .then(function(result) {
                var data = result.data;
                if (data.success) {
                    var msg = 'Email відправлено успішно! Відправлено: ' + data.sent_count + ', Не вдалося: ' + data.failed_count;
                    if (data.failed_emails && data.failed_emails.length > 0) {
                        msg += '\nНе доставлено на: ' + data.failed_emails.join(', ');
                        if (data.first_failed_reason) {
                            msg += '\nПричина: ' + data.first_failed_reason;
                        }
                    }
                    alert(msg);
                    if (data.last_sent_at) {
                        var block = document.getElementById('last-sent-block');
                        if (block) {
                            var label = block.getAttribute('data-label') || 'Остання відправка';
                            block.innerHTML = label + ': <strong>' + data.last_sent_at + '</strong>';
                        }
                    }
                } else {
                    alert('Помилка: ' + (data.message || 'Невідома помилка'));
                }
            })
            .catch(function(error) {
                alert('Помилка відправки: ' + error.message);
            })
            .finally(function() {
                if (sendButton) {
                    sendButton.disabled = false;
                    sendButton.textContent = '{{ trans("admin::app.marketing.communications.email-broadcast.send-email") }}';
                }
                updateSendButton();
            });
        }
        
        // Сторінка завантажена: лише оновлюємо кнопку. Редактор (TinyMCE) з’явиться після кліку «Увімкнути редактор».
        function startBroadcastTinyMCE() {
            updateSendButton();
            var btn = document.getElementById('broadcast-enable-rich-editor');
            var hint = document.getElementById('broadcast-editor-hint');
            if (btn && !window.__broadcastTinyMCEInited) {
                btn.addEventListener('click', function() {
                    if (window.__broadcastTinyMCEInited) return;
                    window.__broadcastTinyMCEInited = true;
                    if (hint) hint.style.display = 'none';
                    initBroadcastTinyMCE();
                });
            }
        }
        if (document.readyState === 'complete') {
            setTimeout(startBroadcastTinyMCE, 150);
        } else {
            window.addEventListener('load', function() { setTimeout(startBroadcastTinyMCE, 150); });
        }
        document.addEventListener('DOMContentLoaded', updateSendButton);

        function initBroadcastTinyMCE() {
            if (!document.getElementById('content')) return;
            if (window.tinymce && window.tinymce.get('content')) return;
            var loadTiny = function() {
                if (typeof tinymce === 'undefined') {
                    setTimeout(loadTiny, 50);
                    return;
                }
                var uploadRoute = '{{ route("admin.tinymce.upload") }}';
                var csrfToken = '{{ csrf_token() }}';
                var baseUrl = '{{ asset("/") }}';
                var isDark = document.documentElement && document.documentElement.classList && document.documentElement.classList.contains('dark');
                tinymce.init({
                    selector: '#content',
                    menubar: false,
                    skin: isDark ? 'oxide-dark' : 'oxide',
                    content_css: isDark ? 'dark' : 'default',
                    relative_urls: false,
                    remove_script_host: false,
                    convert_urls: false,
                    document_base_url: baseUrl,
                    automatic_uploads: true,
                    paste_data_images: true,
                    file_picker_types: 'image',
                    images_file_types: 'jpg,jpeg,png,gif,webp,svg',
                    plugins: 'image media wordcount code table lists link',
                    toolbar: 'formatselect | bold italic strikethrough forecolor backcolor image alignleft aligncenter alignright alignjustify | link hr | numlist bullist outdent indent | removeformat | code | table',
                    image_advtab: true,
                    image_title: true,
                    image_description: true,
                    image_dimensions: true,
                    directionality: '{{ core()->getCurrentLocale()->direction }}',
                    init_instance_callback: function(editor) {
                        var el = editor.getContainer ? editor.getContainer() : null;
                        if (el) {
                            el.style.setProperty('visibility', 'visible', 'important');
                            el.style.setProperty('height', '400px', 'important');
                        }
                        var wrap = document.getElementById('broadcast-content-wrap');
                        if (wrap) {
                            var tox = wrap.querySelector && wrap.querySelector('.tox-tinymce');
                            if (tox) tox.style.setProperty('visibility', 'visible', 'important');
                        }
                    },
                    file_picker_callback: function(callback, value, meta) {
                        if (meta.filetype !== 'image') return;
                        var input = document.createElement('input');
                        input.setAttribute('type', 'file');
                        input.setAttribute('accept', 'image/jpeg,image/png,image/gif,image/webp,image/svg+xml');
                        input.onchange = function() {
                            var file = this.files[0];
                            if (!file) return;
                            var fd = new FormData();
                            fd.append('_token', '{{ csrf_token() }}');
                            fd.append('file', file);
                            fetch('{{ route("admin.tinymce.upload") }}', {
                                method: 'POST',
                                credentials: 'same-origin',
                                body: fd
                            }).then(function(r) { return r.json(); }).then(function(json) {
                                if (json && json.location) callback(json.location, { alt: file.name });
                            }).catch(function() {});
                        };
                        input.click();
                    },
                    images_upload_handler: function(blobInfo, progress) {
                        return new Promise(function(resolve, reject) {
                            var xhr = new XMLHttpRequest();
                            xhr.open('POST', uploadRoute);
                            xhr.upload.onprogress = function(e) { progress((e.loaded / e.total) * 100); };
                            xhr.onload = function() {
                                if (xhr.status < 200 || xhr.status >= 300) { reject('HTTP error'); return; }
                                try {
                                    var json = JSON.parse(xhr.responseText);
                                    if (json && json.location) resolve(json.location);
                                    else reject('Invalid response');
                                } catch (e) { reject(e); }
                                updateSendButton();
                            };
                            xhr.onerror = function() { reject('Upload failed'); };
                            var fd = new FormData();
                            fd.append('_token', csrfToken);
                            fd.append('file', blobInfo.blob(), blobInfo.filename());
                            xhr.send(fd);
                        });
                    },
                    setup: function(editor) {
                        function showEditorContainer() {
                            var container = editor.getContainer ? editor.getContainer() : null;
                            if (container && container.style) {
                                container.style.setProperty('visibility', 'visible', 'important');
                                if (!container.style.height || container.style.height === '0px')
                                    container.style.setProperty('height', '400px', 'important');
                            }
                            document.querySelectorAll('.tox-tinymce').forEach(function(el) {
                                el.style.setProperty('visibility', 'visible', 'important');
                                if (el.style.height === '0px' || !el.style.height) el.style.setProperty('height', '400px', 'important');
                            });
                        }
                        editor.on('init', function() {
                            showEditorContainer();
                            setTimeout(showEditorContainer, 100);
                            setTimeout(showEditorContainer, 300);
                            setTimeout(showEditorContainer, 600);
                            var t = 0;
                            var iv = setInterval(function() {
                                showEditorContainer();
                                t++;
                                if (t >= 20) clearInterval(iv);
                            }, 200);
                            var pending = window.__pendingBroadcastContent;
                            if (pending) {
                                editor.setContent(pending, { format: 'html' });
                                var p = pending;
                                setTimeout(function() { editor.setContent(p, { format: 'html' }); }, 50);
                                setTimeout(function() { editor.setContent(p, { format: 'html' }); }, 200);
                            }
                            updateSendButton();
                        });
                        editor.on('keyup change', function() { updateSendButton(); });
                    }
                });
            };
            if (typeof tinymce !== 'undefined') loadTiny();
            else {
                var s = document.createElement('script');
                s.src = 'https://cdnjs.cloudflare.com/ajax/libs/tinymce/6.6.2/tinymce.min.js';
                s.crossOrigin = 'anonymous';
                s.referrerPolicy = 'no-referrer';
                s.onload = loadTiny;
                document.head.appendChild(s);
            }
        }
    </script>
</x-admin::layouts>
