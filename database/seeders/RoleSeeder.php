<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $roles = [
            [
                'name' => 'Super Admin',
                'slug' => 'super-admin',
                'description' => 'Has full access to all system features',
            ],
            [
                'name' => 'Admin',
                'slug' => 'admin',
                'description' => 'Can manage UMKM data and users',
            ],
            [
                'name' => 'Mentor',
                'slug' => 'mentor',
                'description' => 'Can manage mentoring programs and sessions',
            ],
            [
                'name' => 'Staff',
                'slug' => 'staff',
                'description' => 'Can view and assist with UMKM data entry',
            ],
            [
                'name' => 'UMKM Owner',
                'slug' => 'umkm-owner',
                'description' => 'Can manage their own UMKM data',
            ],
        ];

        foreach ($roles as $role) {
            \App\Models\Role::create($role);
        }
    }
}
