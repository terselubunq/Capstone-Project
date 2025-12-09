<?php

use App\Models\Role;
use App\Models\User;
use Filament\Facades\Filament;

beforeEach(function () {
    $this->artisan('db:seed', ['--class' => 'Database\\Seeders\\RoleSeeder']);
});

describe('Super Admin Panel Access', function () {
    test('super admin can access super admin panel', function () {
        $superAdminRole = Role::where('slug', 'super-admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($superAdminRole);
        $user->refresh();

        expect($user->hasRole('super-admin'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('super-admin')))->toBeTrue();
    });

    test('admin cannot access super admin panel', function () {
        $adminRole = Role::where('slug', 'admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($adminRole);
        $user->refresh();

        expect($user->hasRole('admin'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('super-admin')))->toBeFalse();
    });

    test('staff cannot access super admin panel', function () {
        $staffRole = Role::where('slug', 'staff')->first();
        $user = User::factory()->create();
        $user->roles()->attach($staffRole);
        $user->refresh();

        expect($user->hasRole('staff'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('super-admin')))->toBeFalse();
    });

    test('user without role cannot access super admin panel', function () {
        $user = User::factory()->create();

        expect($user->canAccessPanel(Filament::getPanel('super-admin')))->toBeFalse();
    });
});

describe('Admin Panel Access', function () {
    test('super admin can access admin panel', function () {
        $superAdminRole = Role::where('slug', 'super-admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($superAdminRole);
        $user->refresh();

        expect($user->hasRole('super-admin'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('admin')))->toBeTrue();
    });

    test('admin can access admin panel', function () {
        $adminRole = Role::where('slug', 'admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($adminRole);
        $user->refresh();

        expect($user->hasRole('admin'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('admin')))->toBeTrue();
    });

    test('staff cannot access admin panel', function () {
        $staffRole = Role::where('slug', 'staff')->first();
        $user = User::factory()->create();
        $user->roles()->attach($staffRole);
        $user->refresh();

        expect($user->hasRole('staff'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('admin')))->toBeFalse();
    });

    test('mentor cannot access admin panel', function () {
        $mentorRole = Role::where('slug', 'mentor')->first();
        $user = User::factory()->create();
        $user->roles()->attach($mentorRole);
        $user->refresh();

        expect($user->hasRole('mentor'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('admin')))->toBeFalse();
    });

    test('user without role cannot access admin panel', function () {
        $user = User::factory()->create();

        expect($user->canAccessPanel(Filament::getPanel('admin')))->toBeFalse();
    });
});

describe('Staff Panel Access', function () {
    test('super admin can access staff panel', function () {
        $superAdminRole = Role::where('slug', 'super-admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($superAdminRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('staff')))->toBeTrue();
    });

    test('admin can access staff panel', function () {
        $adminRole = Role::where('slug', 'admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($adminRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('staff')))->toBeTrue();
    });

    test('staff can access staff panel', function () {
        $staffRole = Role::where('slug', 'staff')->first();
        $user = User::factory()->create();
        $user->roles()->attach($staffRole);
        $user->refresh();

        expect($user->hasRole('staff'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('staff')))->toBeTrue();
    });

    test('mentor cannot access staff panel', function () {
        $mentorRole = Role::where('slug', 'mentor')->first();
        $user = User::factory()->create();
        $user->roles()->attach($mentorRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('staff')))->toBeFalse();
    });

    test('umkm owner cannot access staff panel', function () {
        $umkmOwnerRole = Role::where('slug', 'umkm-owner')->first();
        $user = User::factory()->create();
        $user->roles()->attach($umkmOwnerRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('staff')))->toBeFalse();
    });
});

describe('Mentor Panel Access', function () {
    test('super admin can access mentor panel', function () {
        $superAdminRole = Role::where('slug', 'super-admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($superAdminRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('mentor')))->toBeTrue();
    });

    test('admin can access mentor panel', function () {
        $adminRole = Role::where('slug', 'admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($adminRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('mentor')))->toBeTrue();
    });

    test('mentor can access mentor panel', function () {
        $mentorRole = Role::where('slug', 'mentor')->first();
        $user = User::factory()->create();
        $user->roles()->attach($mentorRole);
        $user->refresh();

        expect($user->hasRole('mentor'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('mentor')))->toBeTrue();
    });

    test('staff cannot access mentor panel', function () {
        $staffRole = Role::where('slug', 'staff')->first();
        $user = User::factory()->create();
        $user->roles()->attach($staffRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('mentor')))->toBeFalse();
    });

    test('umkm owner cannot access mentor panel', function () {
        $umkmOwnerRole = Role::where('slug', 'umkm-owner')->first();
        $user = User::factory()->create();
        $user->roles()->attach($umkmOwnerRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('mentor')))->toBeFalse();
    });
});

describe('UMKM Owner Panel Access', function () {
    test('super admin can access umkm owner panel', function () {
        $superAdminRole = Role::where('slug', 'super-admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($superAdminRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('umkm-owner')))->toBeTrue();
    });

    test('admin can access umkm owner panel', function () {
        $adminRole = Role::where('slug', 'admin')->first();
        $user = User::factory()->create();
        $user->roles()->attach($adminRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('umkm-owner')))->toBeTrue();
    });

    test('umkm owner can access umkm owner panel', function () {
        $umkmOwnerRole = Role::where('slug', 'umkm-owner')->first();
        $user = User::factory()->create();
        $user->roles()->attach($umkmOwnerRole);
        $user->refresh();

        expect($user->hasRole('umkm-owner'))->toBeTrue();
        expect($user->canAccessPanel(Filament::getPanel('umkm-owner')))->toBeTrue();
    });

    test('staff cannot access umkm owner panel', function () {
        $staffRole = Role::where('slug', 'staff')->first();
        $user = User::factory()->create();
        $user->roles()->attach($staffRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('umkm-owner')))->toBeFalse();
    });

    test('mentor cannot access umkm owner panel', function () {
        $mentorRole = Role::where('slug', 'mentor')->first();
        $user = User::factory()->create();
        $user->roles()->attach($mentorRole);
        $user->refresh();

        expect($user->canAccessPanel(Filament::getPanel('umkm-owner')))->toBeFalse();
    });
});
