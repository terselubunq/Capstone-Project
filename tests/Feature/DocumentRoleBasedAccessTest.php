<?php

use App\Models\Role;
use App\Models\Umkm;
use App\Models\User;

use function Pest\Laravel\actingAs;

beforeEach(function () {
    $this->seed(\Database\Seeders\CategorySeeder::class);
});

it('shows all UMKMs to super-admin users', function () {
    // Arrange
    $superAdmin = User::factory()->create();
    $superAdminRole = Role::firstOrCreate(['slug' => 'super-admin'], ['name' => 'Super Admin']);
    $superAdmin->roles()->attach($superAdminRole->id);

    $umkm1 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);
    $umkm2 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);
    $umkm3 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);

    // Act
    actingAs($superAdmin);

    // Assert - super-admin should see all UMKMs
    $options = \App\Filament\Resources\Documents\Schemas\DocumentForm::configure(
        new \Filament\Schemas\Schema
    )->getComponents()[0]->getOptions();

    expect(count($options))->toBeGreaterThanOrEqual(3)
        ->and($options)->toHaveKey($umkm1->id)
        ->and($options)->toHaveKey($umkm2->id)
        ->and($options)->toHaveKey($umkm3->id);
});

it('shows all UMKMs to admin users', function () {
    // Arrange
    $admin = User::factory()->create();
    $adminRole = Role::firstOrCreate(['slug' => 'admin'], ['name' => 'Admin']);
    $admin->roles()->attach($adminRole->id);

    $umkm1 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);
    $umkm2 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);

    // Act
    actingAs($admin);

    // Assert - admin should see all UMKMs
    $options = \App\Filament\Resources\Documents\Schemas\DocumentForm::configure(
        new \Filament\Schemas\Schema
    )->getComponents()[0]->getOptions();

    expect(count($options))->toBeGreaterThanOrEqual(2)
        ->and($options)->toHaveKey($umkm1->id)
        ->and($options)->toHaveKey($umkm2->id);
});

it('shows all UMKMs to staff users', function () {
    // Arrange
    $staff = User::factory()->create();
    $staffRole = Role::firstOrCreate(['slug' => 'staff'], ['name' => 'Staff']);
    $staff->roles()->attach($staffRole->id);

    $umkm1 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);
    $umkm2 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);

    // Act
    actingAs($staff);

    // Assert - staff should see all UMKMs
    $options = \App\Filament\Resources\Documents\Schemas\DocumentForm::configure(
        new \Filament\Schemas\Schema
    )->getComponents()[0]->getOptions();

    expect(count($options))->toBeGreaterThanOrEqual(2)
        ->and($options)->toHaveKey($umkm1->id)
        ->and($options)->toHaveKey($umkm2->id);
});

it('shows only owned UMKMs to umkm-owner users', function () {
    // Arrange
    $owner = User::factory()->create();
    $ownerRole = Role::firstOrCreate(['slug' => 'umkm-owner'], ['name' => 'UMKM Owner']);
    $owner->roles()->attach($ownerRole->id);

    $ownedUmkm1 = Umkm::factory()->create(['owner_id' => $owner->id]);
    $ownedUmkm2 = Umkm::factory()->create(['owner_id' => $owner->id]);
    $otherUmkm = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);

    // Act
    actingAs($owner);

    // Assert - umkm-owner should only see their own UMKMs
    $options = \App\Filament\Resources\Documents\Schemas\DocumentForm::configure(
        new \Filament\Schemas\Schema
    )->getComponents()[0]->getOptions();

    expect($options)->toHaveKey($ownedUmkm1->id)
        ->and($options)->toHaveKey($ownedUmkm2->id)
        ->and($options)->not->toHaveKey($otherUmkm->id)
        ->and(count($options))->toBe(2);
});

it('shows only owned UMKMs to users without privileged roles', function () {
    // Arrange
    $user = User::factory()->create();
    $mentorRole = Role::firstOrCreate(['slug' => 'mentor'], ['name' => 'Mentor']);
    $user->roles()->attach($mentorRole->id);

    $ownedUmkm = Umkm::factory()->create(['owner_id' => $user->id]);
    $otherUmkm1 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);
    $otherUmkm2 = Umkm::factory()->create(['owner_id' => User::factory()->create()->id]);

    // Act
    actingAs($user);

    // Assert - non-privileged users should only see their own UMKMs
    $options = \App\Filament\Resources\Documents\Schemas\DocumentForm::configure(
        new \Filament\Schemas\Schema
    )->getComponents()[0]->getOptions();

    expect($options)->toHaveKey($ownedUmkm->id)
        ->and($options)->not->toHaveKey($otherUmkm1->id)
        ->and($options)->not->toHaveKey($otherUmkm2->id)
        ->and(count($options))->toBe(1);
});
