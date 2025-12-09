<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $permissions = [
            // UMKM Management
            ['name' => 'View UMKM', 'slug' => 'view-umkm', 'description' => 'View UMKM data', 'group' => 'umkm'],
            ['name' => 'Create UMKM', 'slug' => 'create-umkm', 'description' => 'Create new UMKM', 'group' => 'umkm'],
            ['name' => 'Edit UMKM', 'slug' => 'edit-umkm', 'description' => 'Edit UMKM data', 'group' => 'umkm'],
            ['name' => 'Delete UMKM', 'slug' => 'delete-umkm', 'description' => 'Delete UMKM', 'group' => 'umkm'],
            ['name' => 'Verify UMKM', 'slug' => 'verify-umkm', 'description' => 'Verify UMKM data', 'group' => 'umkm'],
            ['name' => 'Publish UMKM', 'slug' => 'publish-umkm', 'description' => 'Publish UMKM to catalog', 'group' => 'umkm'],

            // Product Management
            ['name' => 'View Products', 'slug' => 'view-products', 'description' => 'View products', 'group' => 'umkm'],
            ['name' => 'Manage Products', 'slug' => 'manage-products', 'description' => 'Create, edit, delete products', 'group' => 'umkm'],

            // Mentoring Management
            ['name' => 'View Mentoring', 'slug' => 'view-mentoring', 'description' => 'View mentoring programs', 'group' => 'mentoring'],
            ['name' => 'Create Mentoring', 'slug' => 'create-mentoring', 'description' => 'Create mentoring programs', 'group' => 'mentoring'],
            ['name' => 'Edit Mentoring', 'slug' => 'edit-mentoring', 'description' => 'Edit mentoring programs', 'group' => 'mentoring'],
            ['name' => 'Delete Mentoring', 'slug' => 'delete-mentoring', 'description' => 'Delete mentoring programs', 'group' => 'mentoring'],
            ['name' => 'Manage Sessions', 'slug' => 'manage-sessions', 'description' => 'Manage mentoring sessions', 'group' => 'mentoring'],

            // User Management
            ['name' => 'View Users', 'slug' => 'view-users', 'description' => 'View users', 'group' => 'user'],
            ['name' => 'Create Users', 'slug' => 'create-users', 'description' => 'Create new users', 'group' => 'user'],
            ['name' => 'Edit Users', 'slug' => 'edit-users', 'description' => 'Edit users', 'group' => 'user'],
            ['name' => 'Delete Users', 'slug' => 'delete-users', 'description' => 'Delete users', 'group' => 'user'],
            ['name' => 'Manage Roles', 'slug' => 'manage-roles', 'description' => 'Assign roles to users', 'group' => 'user'],

            // Document Management
            ['name' => 'View Documents', 'slug' => 'view-documents', 'description' => 'View documents', 'group' => 'umkm'],
            ['name' => 'Upload Documents', 'slug' => 'upload-documents', 'description' => 'Upload documents', 'group' => 'umkm'],
            ['name' => 'Delete Documents', 'slug' => 'delete-documents', 'description' => 'Delete documents', 'group' => 'umkm'],

            // System
            ['name' => 'View Dashboard', 'slug' => 'view-dashboard', 'description' => 'Access dashboard', 'group' => 'system'],
            ['name' => 'View Reports', 'slug' => 'view-reports', 'description' => 'View system reports', 'group' => 'system'],
            ['name' => 'Manage Categories', 'slug' => 'manage-categories', 'description' => 'Manage UMKM categories', 'group' => 'system'],
        ];

        foreach ($permissions as $permission) {
            \App\Models\Permission::create($permission);
        }

        // Assign permissions to roles
        $superAdmin = \App\Models\Role::where('slug', 'super-admin')->first();
        $superAdmin->permissions()->attach(\App\Models\Permission::all());

        $admin = \App\Models\Role::where('slug', 'admin')->first();
        $admin->permissions()->attach(
            \App\Models\Permission::whereIn('group', ['umkm', 'mentoring', 'system'])->pluck('id')
        );

        $mentor = \App\Models\Role::where('slug', 'mentor')->first();
        $mentor->permissions()->attach(
            \App\Models\Permission::whereIn('slug', [
                'view-umkm',
                'view-mentoring',
                'create-mentoring',
                'edit-mentoring',
                'manage-sessions',
                'view-dashboard',
            ])->pluck('id')
        );

        $staff = \App\Models\Role::where('slug', 'staff')->first();
        $staff->permissions()->attach(
            \App\Models\Permission::whereIn('slug', [
                'view-umkm',
                'create-umkm',
                'edit-umkm',
                'view-products',
                'view-documents',
                'upload-documents',
                'view-dashboard',
            ])->pluck('id')
        );

        $umkmOwner = \App\Models\Role::where('slug', 'umkm-owner')->first();
        $umkmOwner->permissions()->attach(
            \App\Models\Permission::whereIn('slug', [
                'view-umkm',
                'edit-umkm',
                'view-products',
                'manage-products',
                'view-documents',
                'upload-documents',
                'view-mentoring',
                'view-dashboard',
            ])->pluck('id')
        );
    }
}
