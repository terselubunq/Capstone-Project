<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Umkm>
 */
class UmkmFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // Business *category* names (contextual, used only for names/description/keywords)
        $businessCategories = [
            'kuliner' => [
                'Warung Empal Gentong Bu {name}',
                'Nasi Jamblang {name}',
                'Tahu Gejrot {name}',
                'Docang {name}',
                'Mie Koclok {name}',
                'Sate Kalong {name}',
                'Empal Asem {name}',
                'Nasi Lengko {name}',
                'Bubur Suro {name}',
                'Kerupuk Melarat {name}',
            ],
            'batik' => [
                'Batik {name}',
                'Batik Trusmi {name}',
                'Batik Megamendung {name}',
                'Batik Tulis {name}',
                'Batik Cap {name}',
            ],
            'kerajinan' => [
                'Kerajinan Rotan {name}',
                'Anyaman Bambu {name}',
                'Kerajinan Kayu Jati {name}',
                'Kerajinan Kulit {name}',
                'Kerajinan Keramik {name}',
            ],
            'fashion' => [
                'Konveksi {name}',
                'Jahit {name}',
                'Bordir {name}',
                'Tas Rajut {name}',
            ],
            'makanan' => [
                'Kue Kering {name}',
                'Kue Basah {name}',
                'Roti {name}',
                'Jajanan Pasar {name}',
                'Terasi {name}',
                'Petis {name}',
            ],
        ];

        // choose a business *category* (for name/description/keywords)
        $categoryKey = fake()->randomElement(array_keys($businessCategories));

        $names = ['Sari', 'Rina', 'Yanti', 'Dewi', 'Ani', 'Ibu Haji', 'Pak Haji', 'Mang', 'Teh', 'Mas', 'Mbak'];
        $businessName = str_replace('{name}', fake()->randomElement($names), fake()->randomElement($businessCategories[$categoryKey]));

        // IMPORTANT: business_type (DB column) expects a size/level of business
        // (e.g. mikro/kecil/menengah). Do not write category keys here.
        $businessSizes = ['mikro', 'kecil', 'menengah'];
        $businessSize = fake()->randomElement($businessSizes);

        // Map categoryKey to keyword for image generation
        $keyword = $this->mapKeyword($categoryKey);

        return [
            'business_name' => $businessName,
            'slug' => \Illuminate\Support\Str::slug($businessName.'-'.fake()->randomNumber(3)),
            'owner_id' => null, // Will be set by seeder
            'address' => fake()->randomElement([
                'Jl. Siliwangi No. '.fake()->numberBetween(1, 200),
                'Jl. Tuparev No. '.fake()->numberBetween(1, 150),
                'Jl. Kartini No. '.fake()->numberBetween(1, 100),
                'Jl. Sunan Gunung Jati No. '.fake()->numberBetween(1, 120),
                'Jl. Kalijaga No. '.fake()->numberBetween(1, 80),
                'Jl. Evakuasi No. '.fake()->numberBetween(1, 90),
                'Jl. Ciremai No. '.fake()->numberBetween(1, 110),
                'Jl. Pemuda No. '.fake()->numberBetween(1, 95),
            ]),
            'village' => fake()->randomElement([
                'Kejaksan', 'Lemahwungkuk', 'Pekalipan', 'Kesenden', 'Sunyaragi',
                'Pegambiran', 'Kecapi', 'Larangan', 'Pulasaren', 'Jagasatru',
            ]),
            'district' => fake()->randomElement([
                'Kejaksan', 'Lemahwungkuk', 'Pekalipan', 'Kesambi', 'Harjamukti',
            ]),
            'city' => 'Cirebon',
            'province' => 'Jawa Barat',
            'postal_code' => '451'.fake()->numberBetween(11, 99),
            'category_id' => null, // Will be set by seeder (based on name/categorization)
            'business_type' => $businessSize, // <-- CORRECT: use mikro/kecil/menengah
            'description' => $this->generateDescription($categoryKey),
            'established_year' => fake()->numberBetween(2005, 2024),
            'employee_count' => fake()->numberBetween(2, 25),
            'monthly_revenue' => fake()->randomFloat(2, 3000000, 50000000),
            'capital' => fake()->randomFloat(2, 10000000, 200000000),
            'nib' => fake()->optional(0.4)->numerify('##############'),
            'has_halal_certificate' => $categoryKey === 'kuliner' ? fake()->boolean(60) : fake()->boolean(20),
            'has_pirt' => in_array($categoryKey, ['kuliner', 'makanan']) ? fake()->boolean(70) : false,
            'website' => fake()->optional(0.2)->url(),
            'facebook' => fake()->optional(0.5)->userName(),
            'instagram' => fake()->optional(0.7)->userName(),
            'tiktok' => fake()->optional(0.3)->userName(),
            'whatsapp' => fake()->optional(0.8)->numerify('628##########'),
            'latitude' => fake()->latitude(-6.756, -6.720), // Cirebon coordinates
            'longitude' => fake()->longitude(108.540, 108.570),

            // Image URLs (contextual by category) - external service (loremflickr)
            'logo' => fake()->optional()->boolean(75) ? "https://loremflickr.com/400/400/{$keyword}" : null,

            'photos' => fake()->optional()->boolean(60)
                ? array_values(array_filter(array_map(function($i) use ($keyword) {
                    return "https://loremflickr.com/800/600/{$keyword}";
                }, range(0, rand(0,2)))))
                : null,

            'status' => fake()->randomElement(['draft', 'pending', 'active', 'inactive']),
            'rejection_reason' => null,
            'verified_at' => fake()->optional()->dateTimeBetween('-1 year', 'now'),
            'verified_by' => null,
            'created_by' => null,
            'is_published' => fake()->boolean(70),
        ];
    }

    private function mapKeyword(string $categoryKey): string
    {
        return match($categoryKey) {
            'kuliner' => 'cirebon,food',
            'batik' => 'batik,cirebon',
            'kerajinan' => 'handicraft,craft',
            'fashion' => 'sewing,clothes',
            'makanan' => 'food,snack',
            default => 'cirebon',
        };
    }

    /**
     * Generate contextual description based on business category
     */
    private function generateDescription(string $categoryKey): string
    {
        $descriptions = [
            'kuliner' => [
                'Kami menyajikan masakan khas Cirebon yang autentik dengan resep turun temurun. Dibuat dengan bahan-bahan pilihan dan bumbu tradisional yang kaya rempah.',
                'Warung kami sudah berdiri sejak puluhan tahun lalu, melayani pelanggan dengan cita rasa khas Cirebon yang tidak berubah. Proses memasak masih menggunakan cara tradisional.',
                'Menyediakan hidangan khas Cirebon dengan porsi yang pas dan harga terjangkau. Cocok untuk santap pagi, siang, maupun malam bersama keluarga.',
                'Usaha kuliner keluarga yang menyajikan menu khas Cirebon dengan cita rasa yang mantap. Tempat bersih dan nyaman untuk bersantap.',
            ],
            'batik' => [
                'Memproduksi dan menjual batik khas Cirebon dengan motif megamendung dan wadasan. Dikerjakan oleh pengrajin berpengalaman dengan teknik tulis dan cap.',
                'Batik kami menggunakan pewarna alami dan kain berkualitas. Setiap kain batik dikerjakan dengan detail dan penuh ketelitian oleh tangan-tangan terampil.',
                'Pusat batik Cirebon yang menyediakan berbagai jenis batik untuk keperluan busana dan interior. Melayani pembelian retail dan grosir.',
                'Galeri batik dengan koleksi lengkap motif khas Cirebon. Tersedia batik tulis premium dan batik cap dengan harga terjangkau.',
            ],
            'kerajinan' => [
                'Memproduksi kerajinan tangan berkualitas tinggi dengan bahan pilihan. Setiap produk dikerjakan oleh pengrajin berpengalaman.',
                'Usaha kerajinan yang sudah melayani pelanggan dari berbagai daerah. Menerima pesanan custom sesuai kebutuhan dan keinginan pembeli.',
                'Menghasilkan produk kerajinan dengan sentuhan seni tradisional dan modern. Cocok untuk souvenir, hadiah, atau koleksi pribadi.',
                'Kerajinan kami mengutamakan kualitas dan keindahan. Setiap produk melalui proses quality control yang ketat.',
            ],
            'fashion' => [
                'Menyediakan layanan jahit dan konveksi dengan hasil rapi dan berkualitas. Melayani pembuatan seragam, baju pesta, dan pakaian custom.',
                'Usaha konveksi yang sudah berpengalaman melayani berbagai instansi dan perorangan. Harga bersaing dengan kualitas terjamin.',
                'Produksi pakaian dan aksesoris fashion dengan desain modern dan trendy. Menggunakan bahan berkualitas dengan jahitan rapi.',
                'Menerima pesanan jahit dan bordir untuk berbagai keperluan. Pengerjaan cepat dan hasil memuaskan.',
            ],
            'makanan' => [
                'Memproduksi makanan olahan dengan bahan berkualitas dan proses yang higienis. Terdaftar PIRT dan memiliki izin usaha.',
                'Usaha makanan rumahan dengan cita rasa khas keluarga. Produk selalu fresh dan dikemas dengan baik.',
                'Menyediakan berbagai jenis makanan olahan siap saji dan siap masak. Cocok untuk oleh-oleh khas Cirebon.',
                'Produksi makanan dengan standar kebersihan yang tinggi. Semua produk halal dan aman dikonsumsi.',
            ],
        ];

        return fake()->randomElement($descriptions[$categoryKey] ?? $descriptions['kuliner']);
    }
}
