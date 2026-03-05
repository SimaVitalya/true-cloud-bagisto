<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\NovaPoshtaController;
use Illuminate\Support\Facades\Mail;
use Webkul\Admin\Mail\EmailBroadcastNotification;
use Webkul\Admin\Http\Controllers\TinyMCEController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Serve TinyMCE uploads from storage (works without symlink)
Route::get('files/tinymce/{filename}', [TinyMCEController::class, 'serve'])
    ->where('filename', '[a-zA-Z0-9._-]+')
    ->name('tinymce.serve');

// Send exactly 1 broadcast email for curl test (token from .env: EMAIL_BROADCAST_CURL_TEST_TOKEN)
Route::match(['get', 'post'], '/email-broadcast-curl-test', function () {
    $token = request()->query('token') ?: request()->input('token');
    $email = request()->query('email') ?: request()->input('email');
    $expectedToken = config('app.email_broadcast_curl_test_token');
    if ($expectedToken === null || $expectedToken === '') {
        return response()->json(['success' => false, 'message' => 'Curl test disabled (set EMAIL_BROADCAST_CURL_TEST_TOKEN in .env)'], 403);
    }
    if ($token !== $expectedToken) {
        return response()->json(['success' => false, 'message' => 'Invalid or missing token'], 403);
    }
    if (! $email || ! filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return response()->json(['success' => false, 'message' => 'Valid email required (param: email)'], 422);
    }
    try {
        Mail::send(new EmailBroadcastNotification(
            'Curl test – 1 message',
            nl2br("This is a single test email sent via curl.\nIf you see this, the endpoint works."),
            $email,
            'Curl Tester'
        ));
        return response()->json(['success' => true, 'message' => '1 email sent.', 'to' => $email]);
    } catch (\Throwable $e) {
        return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
    }
})->name('email-broadcast-curl-test');

// Nova Poshta API routes
Route::prefix('api/nova-poshta')->group(function () {
    Route::get('areas', [NovaPoshtaController::class, 'getAreas'])->name('api.nova-poshta.areas');
    Route::get('cities', [NovaPoshtaController::class, 'getCities'])->name('api.nova-poshta.cities');
    Route::get('warehouses', [NovaPoshtaController::class, 'getWarehouses'])->name('api.nova-poshta.warehouses');
    Route::get('cities/search', [NovaPoshtaController::class, 'searchCities'])->name('api.nova-poshta.cities.search');
});
