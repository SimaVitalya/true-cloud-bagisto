<?php

namespace Webkul\Marketing\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;
use Webkul\Admin\Mail\EmailBroadcastNotification;
use Webkul\Customer\Repositories\CustomerRepository;

class EmailBroadcastTestGroupsCommand extends Command
{
    protected $signature = 'email:broadcast-test-groups';

    protected $description = 'Send one test email to a customer from General group and one from Wholesale group.';

    public function handle(CustomerRepository $customerRepo): int
    {
        $subject = 'Тест розсилки';
        $content = nl2br("Тестове листи.\nОдна на групу «Загальний», одна на групу «Оптовий».");

        foreach ([2 => 'General (Загальний)', 3 => 'Wholesale (Оптовий)'] as $groupId => $label) {
            $count = $customerRepo->findWhere(['customer_group_id' => $groupId, 'status' => 1])->count();
            $this->line("Group {$label} (id={$groupId}): {$count} active customer(s).");
        }
        $this->newLine();

        $sent = 0;

        // Загальний (general) — id = 2
        $general = $customerRepo->findWhere(['customer_group_id' => 2, 'status' => 1])->first();
        if ($general) {
            $this->info('Sending to General group: ' . $general->email);
            try {
                Mail::send(new EmailBroadcastNotification($subject, $content, $general->email, $general->name ?? ''));
                $this->info('  OK.');
                $sent++;
            } catch (\Throwable $e) {
                $this->error('  Failed: ' . $e->getMessage());
            }
        } else {
            $this->warn('No active customer in General group (id=2).');
        }

        // Оптовий (wholesale) — id = 3
        $wholesale = $customerRepo->findWhere(['customer_group_id' => 3, 'status' => 1])->first();
        if ($wholesale) {
            $this->info('Sending to Wholesale group: ' . $wholesale->email);
            try {
                Mail::send(new EmailBroadcastNotification($subject, $content, $wholesale->email, $wholesale->name ?? ''));
                $this->info('  OK.');
                $sent++;
            } catch (\Throwable $e) {
                $this->error('  Failed: ' . $e->getMessage());
            }
        } else {
            $this->warn('No active customer in Wholesale group (id=3).');
        }

        $this->info('Done. Sent: ' . $sent);
        return $sent > 0 ? 0 : 1;
    }
}
