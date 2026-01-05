<?php

namespace App\Providers\Filament;

use App\Filament\Resources\Documents\DocumentResource;
use App\Filament\Resources\MentoringSessions\MentoringSessionResource;
use App\Filament\Resources\Products\ProductResource;
use App\Filament\Resources\Umkms\UmkmResource;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Pages\Dashboard;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Support\Facades\FilamentView;
use Filament\Widgets\AccountWidget;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\Support\Facades\Blade;
use Illuminate\View\Middleware\ShareErrorsFromSession;

class UmkmOwnerPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->id('umkm-owner')
            ->path('umkm-owner')
            ->login(\App\Filament\Pages\Auth\UmkmOwnerLogin::class)
            ->brandName('Dashboard Umkm Owner')
            ->registration(\App\Filament\Pages\Auth\Register::class)
            ->passwordReset()
            ->emailVerification()
            ->profile()
            ->colors([
                'primary' => Color::Emerald,
            ])
            ->darkMode(false)
            ->renderHook(
                'panels::head.end',
                fn () => Blade::render('
                    <style>
                        .fi-simple-layout {
                            background: linear-gradient(to bottom right, #ecfdf5 0%, #ffffff 50%, #f0fdfa 100%) !important;
                            min-height: 100vh !important;
                            position: relative;
                            overflow: hidden;
                            display: flex !important;
                            flex-direction: column !important;
                            justify-content: center !important;
                            align-items: center !important;
                            padding: 2rem 0 !important;
                        }
                        .fi-simple-layout::before {
                            content: "";
                            position: absolute;
                            top: -10rem;
                            left: -10rem;
                            width: 20rem;
                            height: 20rem;
                            background: linear-gradient(to bottom right, rgba(52, 211, 153, 0.3), rgba(20, 184, 166, 0.2));
                            border-radius: 50%;
                            filter: blur(3rem);
                            animation: pulse 4s ease-in-out infinite;
                        }
                        .fi-simple-layout::after {
                            content: "";
                            position: absolute;
                            bottom: -10rem;
                            right: -10rem;
                            width: 24rem;
                            height: 24rem;
                            background: linear-gradient(to bottom right, rgba(52, 211, 153, 0.2), rgba(20, 184, 166, 0.1));
                            border-radius: 50%;
                            filter: blur(3rem);
                            animation: pulse 4s ease-in-out infinite 1s;
                        }
                        @keyframes pulse {
                            0%, 100% { opacity: 1; }
                            50% { opacity: 0.7; }
                        }
                        .dark .fi-simple-layout {
                            background: linear-gradient(to bottom right, #030712 0%, #111827 50%, #030712 100%) !important;
                        }
                        .dark .fi-simple-layout::before,
                        .dark .fi-simple-layout::after {
                            opacity: 0.3;
                        }
                        .fi-simple-main {
                            background-color: rgba(255, 255, 255, 0.8) !important;
                            backdrop-filter: blur(20px) !important;
                            -webkit-backdrop-filter: blur(20px) !important;
                            border-radius: 1rem !important;
                            border: 1px solid rgba(255, 255, 255, 0.5) !important;
                            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15) !important;
                            position: relative;
                            z-index: 10;
                        }
                        .dark .fi-simple-main {
                            background-color: rgba(17, 24, 39, 0.8) !important;
                            border-color: rgba(55, 65, 81, 0.5) !important;
                        }
                        .fi-simple-header {
                            position: relative;
                            z-index: 10;
                        }
                        .fi-simple-layout .fi-logo {
                            display: none !important;
                        }
                        /* Custom logo */
                        .custom-logo-wrapper {
                            display: flex;
                            justify-content: center;
                            margin-top: 0;
                            margin-bottom: 1.5rem;
                            position: relative;
                            z-index: 10;
                        }
                        /* Remove default Filament header spacing */
                        .fi-simple-header {
                            padding-top: 0 !important;
                            margin-top: 0 !important;
                        }
                        .custom-logo-wrapper img {
                            height: 6rem;
                            width: auto;
                            transition: transform 0.3s ease;
                        }
                        .custom-logo-wrapper img:hover {
                            transform: scale(1.05);
                        }
                        /* Tombol Sign up dengan warna sama seperti login */
                        .fi-simple-main .fi-btn-primary,
                        .fi-simple-main button[type="submit"] {
                            background-color: #22c55e !important;
                            color: #ffffff !important;
                        }
                        .fi-simple-main .fi-btn-primary:hover,
                        .fi-simple-main button[type="submit"]:hover {
                            background-color: #16a34a !important;
                        }
                        .fi-simple-main .fi-btn-primary span,
                        .fi-simple-main button[type="submit"] span {
                            color: #ffffff !important;
                        }
                        /* Footer styles */
                        .custom-footer {
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                            gap: 1rem;
                            margin-top: 2rem;
                            position: relative;
                            z-index: 10;
                        }
                        .custom-footer-divider {
                            display: flex;
                            align-items: center;
                            gap: 0.5rem;
                            font-size: 0.75rem;
                            color: #6b7280;
                        }
                        .custom-footer-line {
                            height: 1px;
                            width: 3rem;
                            background: linear-gradient(to right, transparent, #d1d5db, transparent);
                        }
                        .custom-footer-copyright {
                            text-align: center;
                            font-size: 0.75rem;
                            color: #6b7280;
                        }
                    </style>
                ')
            )
            ->renderHook(
                'panels::simple-layout.start',
                fn () => Blade::render('
                    <div class="custom-logo-wrapper">
                        <img src="/logo.png" alt="SI UMKM Cirebon" />
                    </div>
                ')
            )
            ->renderHook(
                'panels::simple-layout.end',
                fn () => Blade::render('
                    <div class="custom-footer">
                        <div class="custom-footer-divider">
                            <div class="custom-footer-line"></div>
                            <span>Platform Resmi</span>
                            <div class="custom-footer-line"></div>
                        </div>
                        <p class="custom-footer-copyright">
                            © {{ date("Y") }} Dinas Koperasi Kota Cirebon.<br>
                            Seluruh hak cipta dilindungi.
                        </p>
                    </div>
                ')
            )
            ->resources([
                UmkmResource::class,
                ProductResource::class,
                DocumentResource::class,
                MentoringSessionResource::class,
            ])
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\Filament\Pages')
            ->pages([
                Dashboard::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\Filament\Widgets')
            ->widgets([
                AccountWidget::class,
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ]);
    }
}
