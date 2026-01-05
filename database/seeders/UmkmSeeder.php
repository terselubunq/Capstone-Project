<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Storage;
use App\Models\Umkm;
use App\Models\User;
use App\Models\Category;
use Illuminate\Support\Str;

class UmkmSeeder extends Seeder
{
    /**
     * Data UMKM khas Cirebon yang realistis
     */
    private array $umkmData = [
        // KULINER KHAS CIREBON
        [
            'business_name' => 'Warung Empal Gentong Hj. Apong',
            'category_slug' => 'makanan-berat',
            'description' => 'Empal Gentong legendaris dengan resep turun-temurun sejak 1950. Bumbu rempah khas Cirebon dengan kuah santan gurih yang dimasak dalam gentong tanah liat. Menyajikan empal gentong original, empal asem, dan sate kambing.',
            'address' => 'Jl. Kanggraksan No. 12',
            'village' => 'Kanggraksan',
            'district' => 'Harjamukti',
            'established_year' => 1950,
        ],
        [
            'business_name' => 'Nasi Jamblang Ibu Nur',
            'category_slug' => 'makanan-berat',
            'description' => 'Nasi Jamblang autentik dibungkus daun jati dengan aneka lauk pilihan khas Cirebon. Tersedia berbagai lauk seperti semur, sambal goreng ati, cumi asin, tempe orek, dan ayam goreng. Buka setiap hari mulai pukul 06.00.',
            'address' => 'Jl. Cangkol Utara No. 45',
            'village' => 'Lemahwungkuk',
            'district' => 'Lemahwungkuk',
            'established_year' => 1985,
        ],
        [
            'business_name' => 'Tahu Gejrot Mang Oding',
            'category_slug' => 'makanan-ringan',
            'description' => 'Tahu Gejrot khas Cirebon dengan bumbu kecap pedas manis yang meresap. Menggunakan tahu pong goreng renyah dengan taburan bawang goreng. Tersedia level pedas dari 1-5 sesuai selera.',
            'address' => 'Jl. Siliwangi No. 89',
            'village' => 'Kejaksan',
            'district' => 'Kejaksan',
            'established_year' => 1995,
        ],
        [
            'business_name' => 'Mie Koclok Bu Tjik',
            'category_slug' => 'makanan-berat',
            'description' => 'Mie Koclok Cirebon dengan kuah kental santan dan taburan tauge segar. Disajikan dengan telur rebus, ayam suwir, dan kerupuk udang. Rasanya gurih dan mengenyangkan.',
            'address' => 'Jl. Karanggetas No. 56',
            'village' => 'Pekalipan',
            'district' => 'Pekalipan',
            'established_year' => 1978,
        ],
        [
            'business_name' => 'Docang Pak Daman',
            'category_slug' => 'makanan-berat',
            'description' => 'Docang Cirebon dengan lontong, tauge, oncom, dan kuah bumbu kacang spesial. Menu sarapan favorit warga Cirebon yang mengenyangkan dan sehat. Tersedia juga bubur suro.',
            'address' => 'Jl. Pulasaren No. 23',
            'village' => 'Pulasaren',
            'district' => 'Pekalipan',
            'established_year' => 1990,
        ],
        [
            'business_name' => 'Sate Kalong Pak Warso',
            'category_slug' => 'makanan-berat',
            'description' => 'Sate Kalong legendaris yang berjualan malam hari. Menggunakan daging sapi pilihan dengan bumbu kacang khas yang gurih. Disajikan dengan lontong dan acar mentimun.',
            'address' => 'Jl. Kalijaga No. 78',
            'village' => 'Kesenden',
            'district' => 'Kesambi',
            'established_year' => 1988,
        ],
        [
            'business_name' => 'Empal Asem Hj. Euis',
            'category_slug' => 'makanan-berat',
            'description' => 'Empal Asem dengan kuah asem segar yang menyegarkan. Perpaduan daging sapi empuk dengan bumbu rempah dan asam jawa. Dilengkapi sambal terasi dan lalapan.',
            'address' => 'Jl. Sunan Gunung Jati No. 34',
            'village' => 'Lemahwungkuk',
            'district' => 'Lemahwungkuk',
            'established_year' => 1975,
        ],
        [
            'business_name' => 'Nasi Lengko Mas Pepen',
            'category_slug' => 'makanan-berat',
            'description' => 'Nasi Lengko khas Cirebon dengan tahu, tempe, mentimun, tauge, dan bumbu kacang. Menu sederhana yang lezat untuk sarapan atau makan siang. Harga terjangkau dan porsi mantap.',
            'address' => 'Jl. Pemuda No. 67',
            'village' => 'Sunyaragi',
            'district' => 'Kesambi',
            'established_year' => 2005,
        ],
        [
            'business_name' => 'Es Jeruk Kunci Teh Yanti',
            'category_slug' => 'minuman',
            'description' => 'Es Jeruk Kunci khas Cirebon yang menyegarkan. Menggunakan jeruk kunci lokal yang segar dengan sirup manis. Tersedia juga es kelapa muda dan es cendol.',
            'address' => 'Jl. Kartini No. 45',
            'village' => 'Kejaksan',
            'district' => 'Kejaksan',
            'established_year' => 2010,
        ],
        [
            'business_name' => 'Kerupuk Melarat Hj. Aminah',
            'category_slug' => 'makanan-ringan',
            'description' => 'Kerupuk Melarat khas Cirebon yang renyah dan gurih. Dibuat dari bahan tepung tapioka dengan resep tradisional. Cocok sebagai teman makan atau oleh-oleh.',
            'address' => 'Jl. Tuparev No. 112',
            'village' => 'Pegambiran',
            'district' => 'Harjamukti',
            'established_year' => 1992,
        ],
        // BATIK CIREBON
        [
            'business_name' => 'Batik Trusmi Hj. Masina',
            'category_slug' => 'kerajinan-batik',
            'description' => 'Pusat batik Trusmi dengan motif Megamendung, Wadasan, dan Paksinaga Liman. Batik tulis premium dengan pewarna alami dan batik cap berkualitas. Melayani retail dan grosir.',
            'address' => 'Jl. Trusmi Kulon No. 88',
            'village' => 'Trusmi Kulon',
            'district' => 'Plered',
            'established_year' => 1960,
        ],
        [
            'business_name' => 'Galeri Batik Megamendung',
            'category_slug' => 'kerajinan-batik',
            'description' => 'Galeri batik dengan koleksi motif Megamendung klasik dan kontemporer. Setiap kain dikerjakan oleh pengrajin berpengalaman dengan detail yang sempurna. Tersedia workshop batik.',
            'address' => 'Jl. Trusmi Wetan No. 56',
            'village' => 'Trusmi Wetan',
            'district' => 'Plered',
            'established_year' => 1985,
        ],
        [
            'business_name' => 'Batik Tulis Pak Madsari',
            'category_slug' => 'kerajinan-batik',
            'description' => 'Batik tulis eksklusif dengan motif khas Keraton Kasepuhan. Menggunakan pewarna alam dari tumbuhan dan proses pembuatan tradisional. Setiap kain adalah karya seni unik.',
            'address' => 'Jl. Lemahwungkuk No. 23',
            'village' => 'Lemahwungkuk',
            'district' => 'Lemahwungkuk',
            'established_year' => 1970,
        ],
        [
            'business_name' => 'Batik Cap Pekalongan Cirebon',
            'category_slug' => 'kerajinan-batik',
            'description' => 'Batik cap dengan harga terjangkau dan kualitas terbaik. Menyediakan berbagai motif Cirebon untuk busana formal dan casual. Melayani seragam instansi dan perusahaan.',
            'address' => 'Jl. Bypass No. 234',
            'village' => 'Kecapi',
            'district' => 'Harjamukti',
            'established_year' => 2000,
        ],
        [
            'business_name' => 'Rumah Batik Wadasan',
            'category_slug' => 'kerajinan-batik',
            'description' => 'Batik dengan motif Wadasan yang merupakan ikon Cirebon. Tersedia batik tulis, cap, dan kombinasi. Menyediakan juga kain batik untuk keperluan interior dan dekorasi.',
            'address' => 'Jl. Pangeran Drajat No. 78',
            'village' => 'Jagasatru',
            'district' => 'Pekalipan',
            'established_year' => 1995,
        ],
        // KERAJINAN ROTAN & ANYAMAN
        [
            'business_name' => 'Rotan Indah Cirebon',
            'category_slug' => 'kerajinan-rotan',
            'description' => 'Produsen furniture rotan berkualitas ekspor. Memproduksi kursi, meja, sofa, dan dekorasi interior berbahan rotan. Melayani pesanan custom untuk hotel dan restoran.',
            'address' => 'Jl. Plered Permai No. 45',
            'village' => 'Plered',
            'district' => 'Plered',
            'established_year' => 1988,
        ],
        [
            'business_name' => 'Anyaman Bambu Mang Karso',
            'category_slug' => 'kerajinan-anyaman',
            'description' => 'Kerajinan anyaman bambu tradisional untuk keperluan rumah tangga dan dekorasi. Memproduksi bakul, tampah, tudung saji, dan berbagai pernak-pernik rumah tangga.',
            'address' => 'Jl. Wangunharja No. 67',
            'village' => 'Tegalwangi',
            'district' => 'Plered',
            'established_year' => 1980,
        ],
        [
            'business_name' => 'Furniture Rotan Jaya',
            'category_slug' => 'kerajinan-rotan',
            'description' => 'Memproduksi furniture rotan modern dengan desain minimalis. Produk berkualitas ekspor dengan harga lokal. Melayani pemesanan untuk rumah, kafe, dan hotel.',
            'address' => 'Jl. Industri Plered No. 12',
            'village' => 'Plered',
            'district' => 'Plered',
            'established_year' => 2005,
        ],
        // KERAJINAN LAINNYA
        [
            'business_name' => 'Lukisan Kaca Cirebon Art',
            'category_slug' => 'kerajinan-kayu',
            'description' => 'Kerajinan lukisan kaca khas Cirebon dengan motif wayang dan cerita Ramayana. Dikerjakan oleh seniman tradisional dengan teknik pewarnaan tradisional.',
            'address' => 'Jl. Keraton No. 34',
            'village' => 'Lemahwungkuk',
            'district' => 'Lemahwungkuk',
            'established_year' => 1975,
        ],
        [
            'business_name' => 'Topeng Cirebon Mang Tarka',
            'category_slug' => 'kerajinan-kayu',
            'description' => 'Pembuat topeng Cirebon autentik untuk pertunjukan tari topeng dan souvenir. Setiap topeng diukir dengan detail dan dihias dengan warna tradisional.',
            'address' => 'Jl. Slangit No. 56',
            'village' => 'Slangit',
            'district' => 'Plered',
            'established_year' => 1968,
        ],
        // FASHION & KONVEKSI
        [
            'business_name' => 'Konveksi Batik Modern',
            'category_slug' => 'pakaian',
            'description' => 'Konveksi yang mengkhususkan diri pada pakaian batik modern. Melayani pembuatan seragam batik, busana pesta, dan casual wear dengan motif Cirebon.',
            'address' => 'Jl. Evakuasi No. 78',
            'village' => 'Pulasaren',
            'district' => 'Pekalipan',
            'established_year' => 2008,
        ],
        [
            'business_name' => 'Bordir Srikandi Cirebon',
            'category_slug' => 'pakaian',
            'description' => 'Jasa bordir komputer dan manual untuk berbagai keperluan. Melayani bordir logo, nama, dan ornamen untuk seragam, souvenir, dan merchandise.',
            'address' => 'Jl. Ciremai Raya No. 90',
            'village' => 'Sunyaragi',
            'district' => 'Kesambi',
            'established_year' => 2012,
        ],
        [
            'business_name' => 'Tas Rajut Bu Entin',
            'category_slug' => 'tas-dan-sepatu',
            'description' => 'Kerajinan tas rajut handmade dengan berbagai model dan warna. Menggunakan benang berkualitas dengan hasil rajutan rapi. Menerima pesanan custom.',
            'address' => 'Jl. Kesunean No. 34',
            'village' => 'Kesepuhan',
            'district' => 'Lemahwungkuk',
            'established_year' => 2015,
        ],
        // MAKANAN OLAHAN & OLEH-OLEH
        [
            'business_name' => 'Terasi Cap Udang Cirebon',
            'category_slug' => 'makanan-ringan',
            'description' => 'Produsen terasi udang asli Cirebon dengan kualitas premium. Dibuat dari udang rebon segar dengan proses fermentasi tradisional. Tersedia kemasan untuk oleh-oleh.',
            'address' => 'Jl. Pelabuhan No. 23',
            'village' => 'Panjunan',
            'district' => 'Lemahwungkuk',
            'established_year' => 1965,
        ],
        [
            'business_name' => 'Kue Tapel Hj. Siti',
            'category_slug' => 'kue-dan-roti',
            'description' => 'Kue Tapel dan kue tradisional Cirebon lainnya. Dibuat dari bahan berkualitas dengan resep keluarga. Tersedia juga kue cucur, onde-onde, dan kue lapis.',
            'address' => 'Jl. Pangeran Diponegoro No. 56',
            'village' => 'Kejaksan',
            'district' => 'Kejaksan',
            'established_year' => 1980,
        ],
        [
            'business_name' => 'Oleh-Oleh Khas Cirebon Pak Nano',
            'category_slug' => 'makanan-ringan',
            'description' => 'Pusat oleh-oleh khas Cirebon lengkap. Menyediakan kerupuk, rempeyek, terasi, petis, dan makanan ringan lainnya. Kemasan menarik untuk oleh-oleh.',
            'address' => 'Jl. Siliwangi No. 156',
            'village' => 'Kejaksan',
            'district' => 'Kejaksan',
            'established_year' => 2000,
        ],
        [
            'business_name' => 'Petis Udang Bu Warsih',
            'category_slug' => 'makanan-ringan',
            'description' => 'Petis udang khas pesisir Cirebon dengan cita rasa gurih dan manis. Dibuat dari sari udang pilihan dengan proses tradisional. Cocok untuk bumbu dan sambal.',
            'address' => 'Jl. Mundu Pesisir No. 12',
            'village' => 'Mundu',
            'district' => 'Mundu',
            'established_year' => 1975,
        ],
        [
            'business_name' => 'Sirup Cempaka Cirebon',
            'category_slug' => 'minuman',
            'description' => 'Sirup tradisional dari bunga cempaka dengan aroma wangi dan rasa manis segar. Cocok untuk minuman dan campuran es. Produk khas Cirebon yang langka.',
            'address' => 'Jl. Kasepuhan No. 45',
            'village' => 'Kesepuhan',
            'district' => 'Lemahwungkuk',
            'established_year' => 1990,
        ],
        [
            'business_name' => 'Rengginang Bu Imas',
            'category_slug' => 'makanan-ringan',
            'description' => 'Rengginang ketan gurih dan renyah buatan rumahan. Digoreng dengan minyak berkualitas dan dikemas higienis. Tersedia rengginang original dan rasa pedas.',
            'address' => 'Jl. Perumahan Grage No. 78',
            'village' => 'Kecapi',
            'district' => 'Harjamukti',
            'established_year' => 2010,
        ],
    ];

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Ensure owners & categories exist
        $owners = User::all();
        $categories = Category::all();

        if ($owners->count() === 0) {
            $this->command->warn('No users (owners) found. Please seed users first.');
            return;
        }

        if ($categories->count() === 0) {
            $this->command->warn('No categories found. Please run CategorySeeder first.');
            return;
        }

        $imageMap = [
            'kuliner' => '/storage/umkms/placeholder/kuliner.png',
            'batik' => '/storage/umkms/placeholder/batik.png',
            'kerajinan' => '/storage/umkms/placeholder/kerajinan.png',
            'fashion' => '/storage/umkms/placeholder/fashion.png',
        ];

        // Create UMKMs from predefined data
        foreach ($this->umkmData as $data) {
            $category = $categories->where('slug', $data['category_slug'])->first();
            
            if (!$category) {
                // Fallback to parent category
                $parentSlug = explode('-', $data['category_slug'])[0];
                $category = $categories->where('slug', $parentSlug)->first();
            }
            
            if (!$category) {
                $category = $categories->first();
            }

            // Determine placeholder image
            $placeholderKey = 'kuliner';
            $businessNameLower = strtolower($data['business_name']);
            if (str_contains($businessNameLower, 'batik')) {
                $placeholderKey = 'batik';
            } elseif (str_contains($businessNameLower, 'rotan') || 
                      str_contains($businessNameLower, 'anyaman') || 
                      str_contains($businessNameLower, 'kerajinan') ||
                      str_contains($businessNameLower, 'lukisan') ||
                      str_contains($businessNameLower, 'topeng')) {
                $placeholderKey = 'kerajinan';
            } elseif (str_contains($businessNameLower, 'konveksi') || 
                      str_contains($businessNameLower, 'bordir') ||
                      str_contains($businessNameLower, 'jahit') ||
                      str_contains($businessNameLower, 'tas')) {
                $placeholderKey = 'fashion';
            }

            $businessSizes = ['mikro', 'kecil', 'menengah'];

            Umkm::create([
                'business_name' => $data['business_name'],
                'slug' => Str::slug($data['business_name']) . '-' . fake()->randomNumber(3),
                'owner_id' => $owners->random()->id,
                'address' => $data['address'],
                'village' => $data['village'],
                'district' => $data['district'],
                'city' => 'Cirebon',
                'province' => 'Jawa Barat',
                'postal_code' => '451' . fake()->numberBetween(11, 99),
                'category_id' => $category->id,
                'business_type' => fake()->randomElement($businessSizes),
                'description' => $data['description'],
                'established_year' => $data['established_year'],
                'employee_count' => fake()->numberBetween(2, 25),
                'monthly_revenue' => fake()->randomFloat(2, 3000000, 50000000),
                'capital' => fake()->randomFloat(2, 10000000, 200000000),
                'nib' => fake()->optional(0.4)->numerify('##############'),
                'has_halal_certificate' => in_array($data['category_slug'], ['makanan-berat', 'makanan-ringan', 'minuman', 'kue-dan-roti']) 
                    ? fake()->boolean(60) : fake()->boolean(20),
                'has_pirt' => in_array($data['category_slug'], ['makanan-berat', 'makanan-ringan', 'minuman', 'kue-dan-roti']) 
                    ? fake()->boolean(70) : false,
                // Marketplace - Shopee dan Tokopedia
                'website' => fake()->randomElement([
                    'https://shopee.co.id',
                    'https://www.tokopedia.com',
                ]),
                // Social Media dengan link lengkap
                'facebook' => 'https://www.facebook.com',
                'instagram' => 'https://www.instagram.com',
                'tiktok' => 'https://www.tiktok.com',
                'whatsapp' => '628' . fake()->numerify('##########'),
                'latitude' => fake()->latitude(-6.756, -6.720),
                'longitude' => fake()->longitude(108.540, 108.570),
                'logo' => $imageMap[$placeholderKey],
                'photos' => [$imageMap[$placeholderKey]],
                'status' => 'active',
                'is_published' => true,
                'verified_at' => now(),
                'verified_by' => $owners->random()->id,
                'created_by' => $owners->random()->id,
            ]);
        }

        $this->command->info('Created ' . count($this->umkmData) . ' UMKMs khas Cirebon (kuliner, batik, kerajinan, fashion).');
    }
}
