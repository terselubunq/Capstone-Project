<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Inspiring;
use Illuminate\Http\Request;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    protected $rootView = 'app';

    public function version(Request $request): ?string
    {
        return parent::version($request);
    }

    public function share(Request $request): array
    {
        if ($this->isFilamentRoute($request)) {
            return parent::share($request);
        }

        [$message, $author] = str(Inspiring::quotes()->random())->explode('-');

        return [
            ...parent::share($request),
            'name' => config('app.name'),
            'quote' => ['message' => trim($message), 'author' => trim($author)],
            'auth' => [
                'user' => $request->user() ? [
                    'id' => $request->user()->id,
                    'name' => $request->user()->name,
                    'email' => $request->user()->email,
                    'role' => $this->getUserPrimaryRole($request->user()),
                    'avatar' => $request->user()->profile_photo_url ?? null,
                ] : null,
            ],
            'sidebarOpen' => ! $request->hasCookie('sidebar_state') || $request->cookie('sidebar_state') === 'true',
        ];
    }

    protected function isFilamentRoute(Request $request): bool
    {
        return $request->is('super-admin*')
            || $request->is('admin*')
            || $request->is('mentor*')
            || $request->is('staff*')
            || $request->is('umkm-owner*');
    }

    protected function getUserPrimaryRole($user): ?string
    {
        if (! $user) {
            return null;
        }

        $user->loadMissing('roles');

        $roleHierarchy = [
            'super-admin',
            'admin',
            'mentor',
            'staff',
            'umkm-owner',
        ];

        $userRoleSlugs = $user->roles->pluck('slug')->toArray();

        foreach ($roleHierarchy as $roleSlug) {
            if (in_array($roleSlug, $userRoleSlugs)) {
                return $roleSlug;
            }
        }

        return $user->roles->first()?->slug;
    }
}