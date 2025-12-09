<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $umkms = \App\Models\Umkm::all();

        if ($umkms->count() === 0) {
            $this->command->warn('No UMKMs found. Make sure to run UmkmSeeder first.');
            return;
        }

        // For each UMKM, create 3-8 products
        foreach ($umkms as $umkm) {
            \App\Models\Product::factory(rand(3, 8))
                ->for($umkm)
                ->create();
        }

        $this->command->info('Created products for ' . $umkms->count() . ' UMKMs');
    }
}
