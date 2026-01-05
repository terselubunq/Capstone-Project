<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Role;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // --- 1️⃣ Seed dasar (roles, permissions)
        $this->call([
            RoleSeeder::class,
            PermissionSeeder::class,
            // CategorySeeder::class, // Comment out - input manual via dashboard
        ]);

        // --- 2️⃣ Ambil semua role yang dibutuhkan
        $superAdminRole = Role::where('slug', 'super-admin')->first();
        $adminRole      = Role::where('slug', 'admin')->first();
        $staffRole      = Role::where('slug', 'staff')->first();
        $mentorRole     = Role::where('slug', 'mentor')->first();
        $umkmOwnerRole  = Role::where('slug', 'umkm-owner')->first();

        // --- 3️⃣ Buat akun tetap untuk tiap panel

        // Super Admin
        $superAdmin = User::firstOrCreate(
            ['email' => 'admin@example.com'],
            [
                'name' => 'Super Admin',
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
            ]
        );
        if ($superAdminRole && ! $superAdmin->roles()->where('role_id', $superAdminRole->id)->exists()) {
            $superAdmin->roles()->attach($superAdminRole);
        }

        // Admin
        $adminUser = User::firstOrCreate(
            ['email' => 'adminpanel@example.com'],
            [
                'name' => 'Admin Panel',
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
            ]
        );
        if ($adminRole && ! $adminUser->roles()->where('role_id', $adminRole->id)->exists()) {
            $adminUser->roles()->attach($adminRole);
        }

        // Staff
        $staffUser = User::firstOrCreate(
            ['email' => 'staff@example.com'],
            [
                'name' => 'Staff Panel',
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
            ]
        );
        if ($staffRole && ! $staffUser->roles()->where('role_id', $staffRole->id)->exists()) {
            $staffUser->roles()->attach($staffRole);
        }

        // Mentor
        $mentorUser = User::firstOrCreate(
            ['email' => 'mentor@example.com'],
            [
                'name' => 'Mentor Panel',
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
            ]
        );
        if ($mentorRole && ! $mentorUser->roles()->where('role_id', $mentorRole->id)->exists()) {
            $mentorUser->roles()->attach($mentorRole);
        }

        // UMKM Owner
        $umkmUser = User::firstOrCreate(
            ['email' => 'umkm@example.com'],
            [
                'name' => 'UMKM Owner',
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
            ]
        );
        if ($umkmOwnerRole && ! $umkmUser->roles()->where('role_id', $umkmOwnerRole->id)->exists()) {
            $umkmUser->roles()->attach($umkmOwnerRole);
        }

        // --- 4️⃣ Skip dummy users - input manual via dashboard
        // if ($umkmOwnerRole) {
        //     User::factory(15)->create()->each(fn($user) => $user->roles()->attach($umkmOwnerRole));
        // }
        // if ($mentorRole) {
        //     User::factory(5)->create()->each(fn($user) => $user->roles()->attach($mentorRole));
        // }

        // --- 5️⃣ Skip data seeders - input manual via dashboard
        // $this->call([
        //     UmkmSeeder::class,
        //     ProductSeeder::class,
        //     MentoringSeeder::class,
        //     MentoringSessionSeeder::class,
        // ]);
    }
}
