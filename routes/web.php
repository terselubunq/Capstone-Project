<?php

use App\Http\Controllers\CatalogController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MentoringController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


/*
|--------------------------------------------------------------------------
| Public Routes
|--------------------------------------------------------------------------
*/

Route::get('/login', function () {
    return Inertia::render('auth/login-selector');
})->name('login');

Route::get('/', [HomeController::class, 'index'])->name('home');

// Public-facing Routes
Route::get('/katalog', [CatalogController::class, 'index'])->name('katalog.index');
Route::get('/katalog/{slug}', [CatalogController::class, 'show'])->name('katalog.show');

Route::get('/program-mentoring', [MentoringController::class, 'index'])->name('mentoring.index');

Route::get('/bantuan', function () {
    return Inertia::render('bantuan/index');
});

Route::get('/kontak', function () {
    return Inertia::render('kontak/index');
});

Route::get('/tentang', function () {
    return Inertia::render('tentang/index');
});
// Redirect legacy/UX paths to UMKM owner registration
Route::redirect('/daftar', '/umkm-owner/register');
Route::redirect('/daftar-umkm', '/umkm-owner/register');


/*
|--------------------------------------------------------------------------
| Filament Logout Overrides (named routes Filament expects)
|--------------------------------------------------------------------------
|
| We explicitly register named POST routes that Filament may call:
|   filament.super-admin.auth.logout
| If Filament uses a different name / path, we will detect it via DevTools (see debug steps).
|
*/

Route::post('/super-admin/logout', function (Request $request) {
    Auth::logout();

    $request->session()->invalidate();
    $request->session()->regenerateToken();

    return redirect('/');
})->name('filament.super-admin.auth.logout');

Route::post('/admin/logout', function (Request $request) {
    Auth::logout();
    $request->session()->invalidate();
    $request->session()->regenerateToken();
    return redirect('/');
})->name('filament.admin.auth.logout');

Route::post('/mentor/logout', function (Request $request) {
    Auth::logout();
    $request->session()->invalidate();
    $request->session()->regenerateToken();
    return redirect('/');
})->name('filament.mentor.auth.logout');

Route::post('/staff/logout', function (Request $request) {
    Auth::logout();
    $request->session()->invalidate();
    $request->session()->regenerateToken();
    return redirect('/');
})->name('filament.staff.auth.logout');

Route::post('/umkm-owner/logout', function (Request $request) {
    Auth::logout();
    $request->session()->invalidate();
    $request->session()->regenerateToken();
    return redirect('/');
})->name('filament.umkm-owner.auth.logout');

Route::resource('mentoring', MentoringController::class);

Route::get('/program-mentoring/{id}', [MentoringController::class, 'show'])
    ->name('program-mentoring.show');

/*
|--------------------------------------------------------------------------
| Other Route Files
|--------------------------------------------------------------------------
*/

require __DIR__.'/settings.php';
require __DIR__.'/auth.php';

Route::middleware(['web', 'auth'])->get('/_internal/geocode/nominatim', function () {
    $query = request()->string('q')->trim()->value();

    if ($query === '' || mb_strlen($query) < 3) {
        return response()->json([]);
    }

    $response = Http::withHeaders([
        'User-Agent' => 'SI-UMKM-Cirebon/1.0',
        'Accept-Language' => 'id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7',
    ])->timeout(10)->get('https://nominatim.openstreetmap.org/search', [
        'q' => $query.' Cirebon, Indonesia',
        'format' => 'json',
        'limit' => 6,
        'countrycodes' => 'id',
        'addressdetails' => 1,
    ]);

    if (! $response->successful()) {
        return response()->json([]);
    }

    return collect($response->json())
        ->map(fn (array $item) => [
            'display_name' => $item['display_name'] ?? null,
            'lat' => $item['lat'] ?? null,
            'lon' => $item['lon'] ?? null,
        ])
        ->filter(fn (array $item) => filled($item['display_name']) && filled($item['lat']) && filled($item['lon']))
        ->values();
})->name('internal.nominatim.suggest');
