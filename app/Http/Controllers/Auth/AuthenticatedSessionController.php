<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Inertia\Response;
use Laravel\Fortify\Features;

class AuthenticatedSessionController extends Controller
{
    /**
     * Show the login page.
     */
    public function create(Request $request): Response|\Symfony\Component\HttpFoundation\Response
    {
        // If user is already authenticated, redirect to their dashboard with full page reload
        if (Auth::check()) {
            $user = Auth::user();
            
            if ($user->hasRole('super-admin')) {
                return Inertia::location('/super-admin');
            } elseif ($user->hasRole('admin')) {
                return Inertia::location('/admin');
            } elseif ($user->hasRole('staff')) {
                return Inertia::location('/staff');
            } elseif ($user->hasRole('mentor')) {
                return Inertia::location('/mentor');
            } elseif ($user->hasRole('umkm-owner')) {
                return Inertia::location('/umkm-owner');
            }
            
            return Inertia::location('/');
        }

        return Inertia::render('auth/login', [
            'canResetPassword' => Route::has('password.request'),
            'status' => $request->session()->get('status'),
        ]);
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): \Symfony\Component\HttpFoundation\Response
    {
        $user = $request->validateCredentials();

        if (Features::enabled(Features::twoFactorAuthentication()) && $user->hasEnabledTwoFactorAuthentication()) {
            $request->session()->put([
                'login.id' => $user->getKey(),
                'login.remember' => $request->boolean('remember'),
            ]);

            return to_route('two-factor.login');
        }

        Auth::login($user, $request->boolean('remember'));
        $request->session()->regenerate();

        // 🔥 Use Inertia::location() for full page reload to Filament panels
        if ($user->hasRole('super-admin')) {
            return Inertia::location('/super-admin');
        } elseif ($user->hasRole('admin')) {
            return Inertia::location('/admin');
        } elseif ($user->hasRole('staff')) {
            return Inertia::location('/staff');
        } elseif ($user->hasRole('mentor')) {
            return Inertia::location('/mentor');
        } elseif ($user->hasRole('umkm-owner')) {
            return Inertia::location('/umkm-owner');
        }

        // default fallback
        return Inertia::location('/');
    }

    /**
     * Destroy an authenticated session (logout).
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }
}
