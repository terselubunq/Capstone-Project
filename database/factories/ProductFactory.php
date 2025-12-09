<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // Authentic Cirebon products
        $products = [
            // Kuliner
            ['name' => 'Empal Gentong', 'price' => [25000, 35000], 'unit' => 'porsi', 'desc' => 'Empal gentong khas Cirebon dengan kuah santan kental dan daging sapi empuk'],
            ['name' => 'Nasi Jamblang', 'price' => [15000, 25000], 'unit' => 'porsi', 'desc' => 'Nasi jamblang dengan berbagai lauk pilihan, dibungkus daun jati'],
            ['name' => 'Tahu Gejrot', 'price' => [8000, 15000], 'unit' => 'porsi', 'desc' => 'Tahu gejrot dengan kuah kecap pedas manis yang segar'],
            ['name' => 'Docang', 'price' => [10000, 15000], 'unit' => 'porsi', 'desc' => 'Lontong sayur khas Cirebon dengan kuah oncom yang gurih'],
            ['name' => 'Mie Koclok', 'price' => [15000, 20000], 'unit' => 'porsi', 'desc' => 'Mie kuah kental dengan irisan daging dan taburan bawang goreng'],
            ['name' => 'Sate Kalong', 'price' => [20000, 30000], 'unit' => 'porsi', 'desc' => 'Sate kambing khas Cirebon dengan bumbu kacang spesial'],
            ['name' => 'Nasi Lengko', 'price' => [12000, 18000], 'unit' => 'porsi', 'desc' => 'Nasi dengan tempe, tahu, tauge, dan kuah kacang'],
            ['name' => 'Empal Asem', 'price' => [25000, 35000], 'unit' => 'porsi', 'desc' => 'Daging sapi dengan kuah asem segar khas Cirebon'],

            // Batik
            ['name' => 'Kain Batik Tulis Megamendung', 'price' => [250000, 500000], 'unit' => 'pcs', 'desc' => 'Kain batik tulis dengan motif megamendung khas Cirebon'],
            ['name' => 'Kain Batik Cap Wadasan', 'price' => [150000, 300000], 'unit' => 'pcs', 'desc' => 'Batik cap dengan motif wadasan, cocok untuk berbagai acara'],
            ['name' => 'Kemeja Batik Pria', 'price' => [180000, 350000], 'unit' => 'pcs', 'desc' => 'Kemeja batik pria dengan motif Cirebonan modern'],
            ['name' => 'Dress Batik Wanita', 'price' => [200000, 400000], 'unit' => 'pcs', 'desc' => 'Dress batik wanita dengan desain elegan dan nyaman dipakai'],
            ['name' => 'Sarung Batik', 'price' => [120000, 250000], 'unit' => 'pcs', 'desc' => 'Sarung batik dengan motif klasik Cirebon'],
            ['name' => 'Selendang Batik', 'price' => [80000, 150000], 'unit' => 'pcs', 'desc' => 'Selendang batik sutra halus dengan warna cerah'],

            // Kerajinan
            ['name' => 'Kursi Rotan', 'price' => [350000, 750000], 'unit' => 'pcs', 'desc' => 'Kursi rotan anyaman berkualitas tinggi, kuat dan awet'],
            ['name' => 'Meja Rotan', 'price' => [500000, 1000000], 'unit' => 'pcs', 'desc' => 'Meja rotan dengan desain minimalis modern'],
            ['name' => 'Tas Anyaman Bambu', 'price' => [50000, 120000], 'unit' => 'pcs', 'desc' => 'Tas anyaman bambu handmade, cocok untuk sehari-hari'],
            ['name' => 'Kerajinan Kayu Jati', 'price' => [150000, 500000], 'unit' => 'pcs', 'desc' => 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus'],
            ['name' => 'Pigura Ukir', 'price' => [75000, 200000], 'unit' => 'pcs', 'desc' => 'Pigura foto dengan ukiran khas Cirebon'],

            // Makanan Olahan
            ['name' => 'Terasi Udang Cirebon', 'price' => [25000, 50000], 'unit' => 'pack', 'desc' => 'Terasi udang asli Cirebon dengan aroma khas dan rasa gurih'],
            ['name' => 'Petis Udang', 'price' => [20000, 40000], 'unit' => 'botol', 'desc' => 'Petis udang kental untuk pelengkap masakan'],
            ['name' => 'Kerupuk Melarat', 'price' => [15000, 30000], 'unit' => 'pack', 'desc' => 'Kerupuk khas Cirebon yang renyah dan gurih'],
            ['name' => 'Kue Apem', 'price' => [20000, 35000], 'unit' => 'box', 'desc' => 'Kue apem tradisional khas Cirebon, lembut dan manis'],
            ['name' => 'Kue Gapit', 'price' => [25000, 45000], 'unit' => 'box', 'desc' => 'Kue gapit renyah dengan berbagai rasa'],
            ['name' => 'Rengginang', 'price' => [18000, 35000], 'unit' => 'pack', 'desc' => 'Rengginang ketan renyah gurih'],
            ['name' => 'Tape Singkong', 'price' => [15000, 25000], 'unit' => 'pack', 'desc' => 'Tape singkong manis legit khas Cirebon'],
            ['name' => 'Dodol Picnic', 'price' => [30000, 60000], 'unit' => 'box', 'desc' => 'Dodol Cirebon dengan berbagai varian rasa'],

            // Fashion
            ['name' => 'Baju Koko', 'price' => [100000, 200000], 'unit' => 'pcs', 'desc' => 'Baju koko muslim dengan bahan nyaman dan desain modern'],
            ['name' => 'Gamis Syari', 'price' => [150000, 300000], 'unit' => 'pcs', 'desc' => 'Gamis syari dengan bahan adem dan model terkini'],
            ['name' => 'Mukena', 'price' => [80000, 150000], 'unit' => 'set', 'desc' => 'Mukena dengan bahan lembut dan motif cantik'],
            ['name' => 'Tas Rajut', 'price' => [50000, 120000], 'unit' => 'pcs', 'desc' => 'Tas rajut handmade dengan berbagai ukuran dan warna'],
        ];

        $product = fake()->randomElement($products);
        $price = fake()->numberBetween($product['price'][0], $product['price'][1]);

        return [
            'umkm_id' => \App\Models\Umkm::factory(),
            'name' => $product['name'],
            'slug' => \Illuminate\Support\Str::slug($product['name'].'-'.fake()->randomNumber(2)),
            'description' => $product['desc'],
            'price' => $price,
            'unit' => $product['unit'],
            'stock' => fake()->numberBetween(5, 150),
            'images' => fake()->optional(0.7)->randomElements([
                fake()->imageUrl(800, 600, 'food'),
                fake()->imageUrl(800, 600, 'food'),
            ], fake()->numberBetween(1, 2)),
            'is_available' => fake()->boolean(85),
            'is_featured' => fake()->boolean(15),
        ];
    }

    public function available(): static
    {
        return $this->state(fn (array $attributes) => [
            'is_available' => true,
            'stock' => fake()->numberBetween(10, 100),
        ]);
    }

    public function featured(): static
    {
        return $this->state(fn (array $attributes) => [
            'is_featured' => true,
            'is_available' => true,
        ]);
    }
}
