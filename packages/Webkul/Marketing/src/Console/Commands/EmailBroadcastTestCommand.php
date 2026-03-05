<?php

namespace Webkul\Marketing\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;
use Webkul\Admin\Mail\EmailBroadcastNotification;

class EmailBroadcastTestCommand extends Command
{
    protected $signature = 'email:broadcast-test {email : Recipient email address}';

    protected $description = 'Send one test broadcast email (for SMTP/curl check).';

    public function handle(): int
    {
        $email = $this->argument('email');
        if (! filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $this->error('Invalid email address.');
            return 1;
        }

        $this->info('Sending test email to: ' . $email);

        try {
            Mail::send(new EmailBroadcastNotification(
                'Test broadcast',
                nl2br("Test message.\nIf you see this, SMTP is working."),
                $email,
                'Test User'
            ));
            $this->info('Sent successfully.');
            return 0;
        } catch (\Throwable $e) {
            $this->error('Failed: ' . $e->getMessage());
            return 1;
        }
    }
}
