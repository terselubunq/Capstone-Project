<?php

namespace App\Providers;

use Filament\Support\Assets\Css;
use Filament\Support\Facades\FilamentAsset;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Register custom CSS to fix map picker z-index
        FilamentAsset::register([
            Css::make('map-picker-fix', __DIR__.'/../../resources/css/map-picker-fix.css'),
        ]);
    }
}
