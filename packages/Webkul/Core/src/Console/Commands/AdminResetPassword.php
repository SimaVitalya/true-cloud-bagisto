<?php

namespace Webkul\Core\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class AdminResetPassword extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'admin:reset-password 
                            {email? : Admin email (optional, resets first admin if not given)}
                            {--password= : New password (optional, will prompt if not given)}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Reset admin password by email or reset first admin';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $email = $this->argument('email');
        $password = $this->option('password');

        if (! $password) {
            $password = $this->secret('Enter new password');
            $confirm = $this->secret('Confirm new password');
            if ($password !== $confirm) {
                $this->error('Passwords do not match.');

                return 1;
            }
        }

        if (strlen($password) < 6) {
            $this->error('Password must be at least 6 characters.');

            return 1;
        }

        $admin = $email
            ? DB::table('admins')->where('email', $email)->first()
            : DB::table('admins')->orderBy('id')->first();

        if (! $admin) {
            $this->error($email ? "Admin with email \"{$email}\" not found." : 'No admin found in database.');

            $admins = DB::table('admins')->orderBy('id')->get(['id', 'name', 'email']);
            if ($admins->isNotEmpty()) {
                $this->newLine();
                $this->line('Existing admins:');
                foreach ($admins as $a) {
                    $this->line("  - {$a->email} (id: {$a->id}, name: {$a->name})");
                }
                $this->newLine();
                $this->comment('Reset first admin: php artisan admin:reset-password --password=your_password');
                $this->comment('Or use one of the emails above: php artisan admin:reset-password that@email.com --password=your_password');
            }

            return 1;
        }

        DB::table('admins')
            ->where('id', $admin->id)
            ->update([
                'password'   => bcrypt($password),
                'updated_at' => now(),
            ]);

        $this->info('Password updated successfully for: '.$admin->email);

        return 0;
    }
}
