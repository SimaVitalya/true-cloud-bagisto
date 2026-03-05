<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

/**
 * Масивний сідер для тестування: видимість товарів (категорії + visible) + відгуки.
 * 1) Робить усі товари видимими у магазині: status=1, visible_individually=1 у product_flat.
 * 2) Додає товари до категорії за замовчуванням, якщо у них немає жодної категорії.
 * 3) Додає товари до каналу за замовчуванням (channel_id=1), якщо ще не прив’язані.
 * 4) Додає багато відгуків до існуючих товарів.
 *
 * Запуск: php artisan db:seed --class=HookahTestDataSeeder
 */
class HookahTestDataSeeder extends Seeder
{
    protected array $names = [
        'Олександр К.', 'Марія П.', 'Дмитро В.', 'Анна С.', 'Ігор М.',
        'Катерина Л.', 'Андрій Т.', 'Юлія К.', 'Сергій Б.', 'Наталія Г.',
        'Віктор Р.', 'Олена Д.', 'Павло Ж.', 'Тетяна Ф.', 'Михайло Н.',
        'Ірина Ш.', 'Вадим Ч.', 'Світлана Є.', 'Роман Я.', 'Лариса П.',
        'Guest User', 'Користувач', 'Хлопець з Києва', 'Дівчина з Одеси',
    ];

    protected array $titles = [
        'Чудовий кальян!', 'Дуже задоволений', 'Рекомендую', 'Якість на висоті',
        'Куртка як раз', 'Тютюн топ', 'Приємно здивований', 'Все супер',
        'Швидка доставка', 'Відмінний товар', 'Буду замовляти ще',
        'Не перший раз беру', 'Ціна/якість ок', 'Упаковка надійна',
        'Як на фото', 'Довго вибирав — не пошкодував', 'Класний аксесуар',
        'Для початківців ідеально', 'Підходить для подарунка',
        'Не дуже', 'Середнячок', 'Очікував краще', 'Нормально за свої гроші',
    ];

    protected array $comments = [
        'Дуже якісний товар, все прийшло ціле. Користуюся вже місяць — все ок.',
        'Замовляв не перший раз. Якість стабільна, доставка швидка. Рекомендую.',
        'Товар відповідає опису. Упаковка міцна. Дякую.',
        'Все сподобалось. Буду замовляти ще у вас.',
        'Для початківця саме те. Пояснення в описі допомогли.',
        'Подарунок — отримувач був радий. Виглядає дорого.',
        'Ціна адекватна, якість хороша. Не знайшов нічого кращого за ці гроші.',
        'Прийшло швидше, ніж очікував. Товар як на фото.',
        'Трохи довго чекав доставку, але товар того вартий.',
        'Не найдешевший варіант, але якість відмінна. Економити не став.',
        'Спробував за порадою друга — не пошкодував. Дякую.',
        'Все ок, але упаковка була трохи пом\'ята. На функціонал не вплинуло.',
        'Нормальний товар за свої гроші. Очікування виправдав.',
        'Очікував трохи краще за таку ціну, але в цілому непогано.',
        'Середнячок. Є плюси і мінуси. Для домашнього використання підійде.',
    ];

    public function run(): void
    {
        $productIds = DB::table('products')
            ->whereIn('type', ['simple', 'configurable', 'virtual', 'grouped', 'bundle', 'downloadable'])
            ->pluck('id')
            ->toArray();

        if (empty($productIds)) {
            $this->command->warn('Немає товарів у БД. Спочатку виконайте встановлення або додайте товари з адмінки.');
            return;
        }

        $this->command->info('Знайдено товарів: ' . count($productIds));

        // 1) Робимо товари видимими: product_flat — status=1, visible_individually=1
        $updatedFlat = DB::table('product_flat')
            ->whereIn('product_id', $productIds)
            ->update([
                'status'               => 1,
                'visible_individually' => 1,
            ]);
        $this->command->info("Оновлено записів product_flat (status, visible_individually): {$updatedFlat}");

        // 2) Категорії: якщо у товару немає жодної категорії — прив’язуємо до першої існуючої
        $defaultCategoryId = DB::table('categories')->min('id');
        if ($defaultCategoryId !== null) {
            $productIdsWithoutCategory = DB::table('product_categories')
                ->whereIn('product_id', $productIds)
                ->pluck('product_id')
                ->toArray();
            $missingCategory = array_diff($productIds, $productIdsWithoutCategory);
            foreach ($missingCategory as $pid) {
                DB::table('product_categories')->insert([
                    'product_id'  => $pid,
                    'category_id' => $defaultCategoryId,
                ]);
            }
            $this->command->info('Товарам без категорії призначено категорію: ' . count($missingCategory));
        } else {
            $this->command->warn('Таблиця categories порожня — категорії не змінювались.');
        }

        // 3) Канал: додаємо товари до каналу за замовчуванням (channel_id=1), якщо ще не прив’язані
        $channelId = 1;
        $productIdsInChannel = DB::table('product_channels')
            ->where('channel_id', $channelId)
            ->pluck('product_id')
            ->toArray();
        $missingChannel = array_diff($productIds, $productIdsInChannel);
        foreach ($missingChannel as $pid) {
            DB::table('product_channels')->insert([
                'product_id'  => $pid,
                'channel_id'  => $channelId,
            ]);
        }
        if (count($missingChannel) > 0) {
            $this->command->info('Додано товарів до каналу default: ' . count($missingChannel));
        }

        // 4) Відгуки
        $now = Carbon::now();
        $reviews = [];
        $reviewsPerProduct = 12;
        $total = 0;

        foreach ($productIds as $productId) {
            for ($i = 0; $i < $reviewsPerProduct; $i++) {
                $rating = $this->randomRating();
                $reviews[] = [
                    'name'       => $this->names[array_rand($this->names)],
                    'title'      => $this->titles[array_rand($this->titles)],
                    'rating'     => $rating,
                    'comment'    => $this->comments[array_rand($this->comments)],
                    'status'     => 'approved',
                    'product_id' => $productId,
                    'customer_id' => null,
                    'created_at' => $now->copy()->subDays(rand(1, 120))->format('Y-m-d H:i:s'),
                    'updated_at' => $now->format('Y-m-d H:i:s'),
                ];
                $total++;

                if (count($reviews) >= 500) {
                    DB::table('product_reviews')->insert($reviews);
                    $reviews = [];
                }
            }
        }

        if (!empty($reviews)) {
            DB::table('product_reviews')->insert($reviews);
        }

        $this->command->info("Додано відгуків: {$total}");
    }

    private function randomRating(): int
    {
        $rand = rand(1, 100);
        if ($rand <= 60) return rand(4, 5);
        if ($rand <= 85) return 3;
        if ($rand <= 95) return 2;
        return 1;
    }
}
