<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            [
                'name' => 'Kuliner',
                'slug' => 'kuliner',
                'description' => 'Usaha makanan dan minuman',
                'subcategories' => [
                    ['name' => 'Makanan Ringan', 'slug' => 'makanan-ringan'],
                    ['name' => 'Makanan Berat', 'slug' => 'makanan-berat'],
                    ['name' => 'Minuman', 'slug' => 'minuman'],
                    ['name' => 'Kue dan Roti', 'slug' => 'kue-dan-roti'],
                ],
            ],
            [
                'name' => 'Fashion',
                'slug' => 'fashion',
                'description' => 'Usaha pakaian dan aksesoris',
                'subcategories' => [
                    ['name' => 'Pakaian', 'slug' => 'pakaian'],
                    ['name' => 'Aksesoris', 'slug' => 'aksesoris'],
                    ['name' => 'Tas dan Sepatu', 'slug' => 'tas-dan-sepatu'],
                ],
            ],
            [
                'name' => 'Kerajinan',
                'slug' => 'kerajinan',
                'description' => 'Usaha kerajinan tangan',
                'subcategories' => [
                    ['name' => 'Kerajinan Kayu', 'slug' => 'kerajinan-kayu'],
                    ['name' => 'Kerajinan Rotan', 'slug' => 'kerajinan-rotan'],
                    ['name' => 'Kerajinan Anyaman', 'slug' => 'kerajinan-anyaman'],
                    ['name' => 'Kerajinan Batik', 'slug' => 'kerajinan-batik'],
                ],
            ],
            [
                'name' => 'Pertanian',
                'slug' => 'pertanian',
                'description' => 'Usaha pertanian dan perkebunan',
                'subcategories' => [
                    ['name' => 'Sayuran', 'slug' => 'sayuran'],
                    ['name' => 'Buah-buahan', 'slug' => 'buah-buahan'],
                    ['name' => 'Tanaman Hias', 'slug' => 'tanaman-hias'],
                ],
            ],
            [
                'name' => 'Jasa',
                'slug' => 'jasa',
                'description' => 'Usaha jasa dan layanan',
                'subcategories' => [
                    ['name' => 'Jasa Konsultasi', 'slug' => 'jasa-konsultasi'],
                    ['name' => 'Jasa Desain', 'slug' => 'jasa-desain'],
                    ['name' => 'Jasa Event', 'slug' => 'jasa-event'],
                ],
            ],
            [
                'name' => 'Teknologi',
                'slug' => 'teknologi',
                'description' => 'Usaha berbasis teknologi',
                'subcategories' => [
                    ['name' => 'Software Development', 'slug' => 'software-development'],
                    ['name' => 'Digital Marketing', 'slug' => 'digital-marketing'],
                    ['name' => 'E-Commerce', 'slug' => 'e-commerce'],
                ],
            ],
        ];

        foreach ($categories as $categoryData) {
            $subcategories = $categoryData['subcategories'] ?? [];
            unset($categoryData['subcategories']);

            $category = \App\Models\Category::create($categoryData);

            foreach ($subcategories as $subcategory) {
                \App\Models\Category::create([
                    'name' => $subcategory['name'],
                    'slug' => $subcategory['slug'],
                    'description' => null,
                    'parent_id' => $category->id,
                ]);
            }
        }
    }
}
