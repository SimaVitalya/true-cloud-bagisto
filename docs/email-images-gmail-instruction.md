# Как сделать, чтобы логотип и картинки были видны в Gmail (письма заказа и рассылки)

Кратко: в письмах нужно использовать **либо абсолютные URL картинок**, **либо встроенные изображения (CID)**. Относительные пути и base64 в Gmail часто не показываются.

---

## 1. Почему в Gmail не видно картинок

- **Относительные URL** (`/storage/logo.png`, `../images/logo.png`) — почтовый клиент не знает домен, картинка не загружается.
- **Data URI (base64)** — многие клиенты (в т.ч. Gmail) их блокируют или не отображают.
- **Локальные пути** (`file://`, путь на диске) — в письме не работают.

Работают два варианта:

1. **Абсолютные URL** — картинки лежат на вашем сайте по адресу вида `https://ваш-домен.com/путь/к/картинке.png`.
2. **Встроенные изображения (CID)** — картинки прикрепляются к письму как вложения с Content-ID и в HTML указывается `src="cid:уникальный-id"`.

---

## 2. Вариант A: абсолютные URL (проще всего)

### 2.1. Настройка приложения

- В конфиге задайте **корректный публичный URL сайта** (тот, по которому сайт открывается в браузере), например:
  - Laravel: `APP_URL=https://ваш-домен.com`
  - Без слэша в конце.
- Для продакшена обязательно **HTTPS**, иначе часть клиентов может блокировать картинки.

### 2.2. Логотип в шаблоне письма

В макете письма (общий layout для заказа/рассылки) логотип должен подставляться **полным URL**:

```php
@php
    $baseUrl = rtrim(config('app.url'), '/');  // https://ваш-домен.com
    $logoPath = 'storage/logo.png';            // путь относительно public или storage
    $logoUrl = $baseUrl . '/' . ltrim($logoPath, '/');
@endphp
<img src="{{ $logoUrl }}" alt="Логотип" width="180" height="44" style="display:block;border:0;" />
```

Важно:

- `$logoPath` должен соответствовать URL, по которому файл реально отдаётся (например `storage/logo.png` если у вас симлинк `public/storage` → `storage/app/public`).
- Итоговая ссылка должна открываться в браузере без авторизации.

### 2.3. Картинки товаров в письме заказа

Для каждой картинки товара формируйте полный URL:

```php
$imagePath = $item->product->images->first()?->path;  // например product/1/photo.jpg
$imageUrl = $imagePath
    ? $baseUrl . '/' . ltrim(Storage::disk('public')->url($imagePath), '/')
    : null;
// в шаблоне:
<img src="{{ $imageUrl }}" alt="" />
```

Если `Storage::disk('public')->url()` уже возвращает полный URL — используйте его как есть; иначе добавляйте `$baseUrl` только к относительному пути.

### 2.4. Картинки в рассылке (HTML-контент)

Если в контенте рассылки есть `<img src="...">`:

- Замените относительные пути на абсолютные перед отправкой.
- Пример: заменить `src="/storage/tinymce/photo.png"` на `src="https://ваш-домен.com/storage/tinymce/photo.png"`.

```php
$baseUrl = rtrim(config('app.url'), '/');
$html = preg_replace_callback(
    '#<img\s([^>]*?)src\s*=\s*["\']([^"\']+)["\']#i',
    function ($m) use ($baseUrl) {
        $src = $m[2];
        if (str_starts_with($src, 'http://') || str_starts_with($src, 'https://') || str_starts_with($src, 'data:')) {
            return $m[0];
        }
        $src = $baseUrl . '/' . ltrim($src, '/');
        return '<img ' . $m[1] . 'src="' . $src . '"';
    },
    $html
);
```

### 2.5. Доступность по URL

- Файлы должны быть в `public` или отдаваться через симлинк/маршрут без проверки авторизации.
- Проверьте в браузере: открытие `https://ваш-домен.com/storage/logo.png` (и аналог для товаров) должно показывать картинку.

---

## 3. Вариант B: встроенные изображения (CID)

Картинки прикрепляются к письму и подставляются по Content-ID — Gmail их показывает без запросов на ваш сервер.

### 3.1. Прикрепление логотипа в Mailable (Laravel)

В классе письма (например, уведомление о заказе):

```php
use Symfony\Component\Mime\Email;

public function build()
{
    $logoPath = public_path('logo.png');  // или путь из конфига
    $cid = 'logo-' . substr(sha1($logoPath), 0, 16);

    return $this->view('emails.order-created')
        ->with(['embeddedLogoCid' => $cid])
        ->withSymfonyMessage(function (Email $message) use ($logoPath, $cid) {
            if (is_readable($logoPath)) {
                $message->embedFromPath($logoPath, $cid, 'image/png');
            }
        });
}
```

В шаблоне письма:

```html
<img src="cid:{{ $embeddedLogoCid }}" alt="Логотип" width="180" height="44" style="display:block;border:0;" />
```

### 3.2. Картинки товаров как CID

Для каждого товара прикрепляйте первую картинку и передавайте в шаблон массив CID по индексу позиции:

```php
$itemCids = [];
$itemEmbedData = [];

foreach ($order->items as $index => $item) {
    $image = $item->product?->images->first();
    if (!$image) continue;

    $fullPath = Storage::disk('public')->path($image->path);
    if (!is_readable($fullPath)) continue;

    $cid = 'item-' . $index . '-' . substr(sha1($fullPath), 0, 10);
    $itemCids[$index] = $cid;
    $itemEmbedData[] = ['path' => $fullPath, 'cid' => $cid, 'mime' => 'image/jpeg'];
}

return $this->view('emails.order-created')
    ->with(['itemCids' => $itemCids])
    ->withSymfonyMessage(function (Email $message) use ($itemEmbedData) {
        foreach ($itemEmbedData as $img) {
            $message->embedFromPath($img['path'], $img['cid'], $img['mime'] ?? 'image/jpeg');
        }
    });
```

В шаблоне по позиции:

```php
@foreach ($order->items as $index => $item)
    @php $cid = $itemCids[$index] ?? null; @endphp
    @if($cid)
        <img src="cid:{{ $cid }}" alt="" width="64" height="64" />
    @endif
@endforeach
```

### 3.3. Рассылка: картинки из HTML в CID

Если в контенте рассылки есть локальные картинки (например, из редактора), можно перед отправкой:

- Найти все `src` с локальными путями.
- Для каждого файла: прочитать с диска, прикрепить через `embedFromPath` с уникальным CID.
- В HTML заменить `src="путь"` на `src="cid:уникальный-id"`.

Тогда Gmail не будет обращаться к вашему серверу — всё будет внутри письма.

---

## 4. Что проверить в первую очередь

| Проверка | Действие |
|----------|----------|
| **APP_URL** | В .env стоит рабочий HTTPS-адрес сайта (без слэша в конце). |
| **Логотип по URL** | Открыть в браузере `APP_URL/storage/logo.png` (или ваш путь) — картинка отображается без логина. |
| **Шаблон письма** | В `<img>` только абсолютные URL или `cid:...`, без относительных путей и без base64 для логотипа. |
| **Очередь** | Если письма отправляются через очередь, путь к файлам при выполнении джоба должен быть доступен (тот же диск/симлинк). |

---

## 5. Итог

- **Проще всего:** везде в письмах использовать **абсолютные URL** (`https://ваш-домен.com/...`), корректный `APP_URL` и убедиться, что файлы отдаются публично.
- **Надёжнее для доставки:** **CID** — логотип и картинки товаров/рассылки встраивать в письмо и подставлять через `src="cid:..."`. Тогда видимость не зависит от доступности сайта в момент открытия письма в Gmail.

Оба подхода совместимы с Gmail; можно комбинировать (например, логотип — CID, большие картинки в рассылке — по абсолютным URL).
