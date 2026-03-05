<?php

namespace Webkul\Marketing\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;
use Webkul\Core\Models\Channel;
use Webkul\Customer\Models\Customer;

class SeedBroadcastTestCustomersCommand extends Command
{
    protected $signature = 'email:broadcast-seed-test-customers';

    protected $description = 'Create 2 test customers: one in General group, one in Wholesale group (for broadcast test).';

    public function handle(): int
    {
        $channel = Channel::query()->first();
        if (! $channel) {
            $this->error('No channel found. Run installer first.');
            return 1;
        }
        $channelId = $channel->id;
        $password = Hash::make('password');

        $data = [
            [
                'first_name'        => 'Test',
                'last_name'         => 'General',
                'email'             => 'test-general@example.com',
                'customer_group_id' => 2,
                'channel_id'        => $channelId,
                'status'            => 1,
                'password'          => $password,
                'is_verified'       => 1,
            ],
            [
                'first_name'        => 'Test',
                'last_name'         => 'Wholesale',
                'email'             => 'test-wholesale@example.com',
                'customer_group_id' => 3,
                'channel_id'        => $channelId,
                'status'            => 1,
                'password'          => $password,
                'is_verified'       => 1,
            ],
        ];

        foreach ($data as $item) {
            $exists = Customer::where('email', $item['email'])->first();
            if ($exists) {
                $exists->update([
                    'customer_group_id' => $item['customer_group_id'],
                    'status'            => 1,
                ]);
                $this->info('Updated existing customer: ' . $item['email'] . ' -> group id=' . $item['customer_group_id']);
            } else {
                Customer::create($item);
                $this->info('Created: ' . $item['email'] . ' (group id=' . $item['customer_group_id'] . ')');
            }
        }

        $this->newLine();
        $this->info('Done. Run: php artisan email:broadcast-test-groups');
        return 0;
    }
}
