<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Umkm;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    /**
     * Produk berdasarkan jenis UMKM
     */
    private array $productsByType = [
        // KULINER - Empal Gentong
        'empal gentong' => [
            ['name' => 'Empal Gentong Original', 'price' => [30000, 35000], 'unit' => 'porsi', 'desc' => 'Empal gentong dengan kuah santan kental dan daging sapi empuk, dimasak dalam gentong tanah liat.'],
            ['name' => 'Empal Gentong Spesial', 'price' => [40000, 50000], 'unit' => 'porsi', 'desc' => 'Empal gentong dengan tambahan babat, kikil, dan usus pilihan.'],
            ['name' => 'Empal Asem', 'price' => [28000, 35000], 'unit' => 'porsi', 'desc' => 'Daging sapi empuk dengan kuah asem segar dari asam jawa.'],
            ['name' => 'Sate Kambing', 'price' => [35000, 45000], 'unit' => 'porsi', 'desc' => 'Sate kambing empuk dengan bumbu kacang khas.'],
            ['name' => 'Nasi Putih', 'price' => [5000, 7000], 'unit' => 'porsi', 'desc' => 'Nasi putih pulen pendamping empal.'],
        ],
        // KULINER - Nasi Jamblang
        'nasi jamblang' => [
            ['name' => 'Nasi Jamblang Komplit', 'price' => [25000, 35000], 'unit' => 'porsi', 'desc' => 'Nasi jamblang dengan 5 pilihan lauk favorit, dibungkus daun jati.'],
            ['name' => 'Nasi Jamblang Biasa', 'price' => [15000, 20000], 'unit' => 'porsi', 'desc' => 'Nasi jamblang dengan 2 pilihan lauk.'],
            ['name' => 'Lauk Semur Daging', 'price' => [15000, 20000], 'unit' => 'porsi', 'desc' => 'Semur daging sapi manis gurih.'],
            ['name' => 'Lauk Cumi Asin', 'price' => [12000, 18000], 'unit' => 'porsi', 'desc' => 'Cumi asin goreng kering yang gurih.'],
            ['name' => 'Lauk Ayam Goreng', 'price' => [15000, 20000], 'unit' => 'porsi', 'desc' => 'Ayam goreng renyah bumbu kuning.'],
            ['name' => 'Lauk Tempe Orek', 'price' => [8000, 12000], 'unit' => 'porsi', 'desc' => 'Tempe orek manis kecap.'],
        ],
        // KULINER - Tahu Gejrot
        'tahu gejrot' => [
            ['name' => 'Tahu Gejrot Original', 'price' => [10000, 15000], 'unit' => 'porsi', 'desc' => 'Tahu pong goreng dengan bumbu kecap pedas manis.'],
            ['name' => 'Tahu Gejrot Jumbo', 'price' => [18000, 25000], 'unit' => 'porsi', 'desc' => 'Porsi jumbo dengan lebih banyak tahu dan bawang goreng.'],
            ['name' => 'Tahu Gejrot Extra Pedas', 'price' => [12000, 18000], 'unit' => 'porsi', 'desc' => 'Tahu gejrot dengan level pedas maksimal.'],
            ['name' => 'Paket Tahu Gejrot + Es Teh', 'price' => [15000, 20000], 'unit' => 'paket', 'desc' => 'Paket hemat tahu gejrot dengan es teh manis.'],
        ],
        // KULINER - Mie Koclok
        'mie koclok' => [
            ['name' => 'Mie Koclok Original', 'price' => [18000, 22000], 'unit' => 'porsi', 'desc' => 'Mie dengan kuah santan kental, tauge, dan telur rebus.'],
            ['name' => 'Mie Koclok Spesial', 'price' => [25000, 32000], 'unit' => 'porsi', 'desc' => 'Mie koclok dengan tambahan ayam suwir dan kerupuk udang.'],
            ['name' => 'Mie Koclok Tanpa Kuah', 'price' => [18000, 22000], 'unit' => 'porsi', 'desc' => 'Mie koclok kering dengan bumbu kacang.'],
        ],
        // KULINER - Docang
        'docang' => [
            ['name' => 'Docang Original', 'price' => [12000, 15000], 'unit' => 'porsi', 'desc' => 'Lontong dengan tauge, oncom, dan kuah bumbu kacang.'],
            ['name' => 'Docang Spesial', 'price' => [18000, 22000], 'unit' => 'porsi', 'desc' => 'Docang dengan tambahan kerupuk dan emping.'],
            ['name' => 'Bubur Suro', 'price' => [12000, 18000], 'unit' => 'porsi', 'desc' => 'Bubur khas Cirebon dengan bumbu gurih.'],
        ],
        // KULINER - Sate Kalong
        'sate kalong' => [
            ['name' => 'Sate Kalong 10 Tusuk', 'price' => [35000, 45000], 'unit' => 'porsi', 'desc' => 'Sate daging sapi dengan bumbu kacang khas.'],
            ['name' => 'Sate Kalong 15 Tusuk', 'price' => [50000, 65000], 'unit' => 'porsi', 'desc' => 'Porsi lebih besar untuk berdua.'],
            ['name' => 'Paket Sate + Lontong', 'price' => [40000, 55000], 'unit' => 'paket', 'desc' => 'Sate kalong dengan lontong dan acar.'],
        ],
        // KULINER - Empal Asem
        'empal asem' => [
            ['name' => 'Empal Asem Original', 'price' => [30000, 38000], 'unit' => 'porsi', 'desc' => 'Daging sapi empuk dengan kuah asem segar.'],
            ['name' => 'Empal Asem Spesial', 'price' => [42000, 52000], 'unit' => 'porsi', 'desc' => 'Empal asem dengan tambahan jeroan pilihan.'],
            ['name' => 'Lalapan Lengkap', 'price' => [5000, 8000], 'unit' => 'porsi', 'desc' => 'Lalapan segar dengan sambal terasi.'],
        ],
        // KULINER - Nasi Lengko
        'nasi lengko' => [
            ['name' => 'Nasi Lengko Original', 'price' => [12000, 15000], 'unit' => 'porsi', 'desc' => 'Nasi dengan tahu, tempe, tauge, mentimun, dan bumbu kacang.'],
            ['name' => 'Nasi Lengko Telur', 'price' => [15000, 20000], 'unit' => 'porsi', 'desc' => 'Nasi lengko dengan tambahan telur ceplok.'],
            ['name' => 'Nasi Lengko Ayam', 'price' => [20000, 25000], 'unit' => 'porsi', 'desc' => 'Nasi lengko dengan tambahan ayam goreng.'],
        ],
        // KULINER - Minuman
        'es jeruk' => [
            ['name' => 'Es Jeruk Kunci', 'price' => [8000, 12000], 'unit' => 'gelas', 'desc' => 'Jeruk kunci segar dengan sirup manis dan es.'],
            ['name' => 'Es Kelapa Muda', 'price' => [12000, 18000], 'unit' => 'gelas', 'desc' => 'Kelapa muda segar dengan dagingnya.'],
            ['name' => 'Es Cendol', 'price' => [10000, 15000], 'unit' => 'gelas', 'desc' => 'Cendol dengan santan dan gula merah.'],
            ['name' => 'Es Campur', 'price' => [12000, 18000], 'unit' => 'gelas', 'desc' => 'Es campur dengan berbagai topping.'],
        ],
        // KULINER - Kerupuk
        'kerupuk melarat' => [
            ['name' => 'Kerupuk Melarat Original', 'price' => [20000, 28000], 'unit' => 'pack', 'desc' => 'Kerupuk renyah gurih dalam kemasan 250gr.'],
            ['name' => 'Kerupuk Melarat Jumbo', 'price' => [35000, 45000], 'unit' => 'pack', 'desc' => 'Kemasan besar 500gr untuk oleh-oleh.'],
            ['name' => 'Paket Kerupuk Mix', 'price' => [50000, 65000], 'unit' => 'paket', 'desc' => 'Paket 3 rasa kerupuk dalam satu box.'],
        ],
        // BATIK
        'batik' => [
            ['name' => 'Kain Batik Tulis Megamendung', 'price' => [350000, 750000], 'unit' => 'lembar', 'desc' => 'Batik tulis asli dengan motif megamendung klasik, pewarna alami.'],
            ['name' => 'Kain Batik Tulis Wadasan', 'price' => [300000, 600000], 'unit' => 'lembar', 'desc' => 'Batik tulis motif wadasan dengan detail halus.'],
            ['name' => 'Kain Batik Cap Megamendung', 'price' => [150000, 250000], 'unit' => 'lembar', 'desc' => 'Batik cap berkualitas dengan motif megamendung.'],
            ['name' => 'Kemeja Batik Pria', 'price' => [180000, 350000], 'unit' => 'pcs', 'desc' => 'Kemeja batik lengan panjang motif Cirebon.'],
            ['name' => 'Dress Batik Wanita', 'price' => [250000, 450000], 'unit' => 'pcs', 'desc' => 'Dress batik elegan untuk acara formal.'],
            ['name' => 'Sarung Batik', 'price' => [120000, 200000], 'unit' => 'pcs', 'desc' => 'Sarung batik dengan motif klasik.'],
            ['name' => 'Selendang Batik', 'price' => [80000, 150000], 'unit' => 'pcs', 'desc' => 'Selendang batik sutra halus.'],
            ['name' => 'Kain Batik Paksinaga Liman', 'price' => [400000, 850000], 'unit' => 'lembar', 'desc' => 'Batik tulis motif paksinaga liman yang ekslusif.'],
        ],
        // KERAJINAN ROTAN
        'rotan' => [
            ['name' => 'Kursi Rotan Single', 'price' => [450000, 750000], 'unit' => 'pcs', 'desc' => 'Kursi rotan anyaman dengan bantal duduk.'],
            ['name' => 'Set Kursi Tamu Rotan', 'price' => [2500000, 4500000], 'unit' => 'set', 'desc' => 'Set kursi tamu 3-2-1 dengan meja.'],
            ['name' => 'Meja Rotan Bundar', 'price' => [650000, 1200000], 'unit' => 'pcs', 'desc' => 'Meja rotan dengan top kaca.'],
            ['name' => 'Ayunan Rotan', 'price' => [1200000, 2000000], 'unit' => 'pcs', 'desc' => 'Ayunan gantung rotan untuk teras.'],
            ['name' => 'Rak Rotan Minimalis', 'price' => [350000, 600000], 'unit' => 'pcs', 'desc' => 'Rak display rotan 3 tingkat.'],
            ['name' => 'Keranjang Rotan Dekorasi', 'price' => [85000, 150000], 'unit' => 'pcs', 'desc' => 'Keranjang rotan untuk dekorasi interior.'],
        ],
        // KERAJINAN ANYAMAN BAMBU
        'anyaman bambu' => [
            ['name' => 'Bakul Nasi Bambu', 'price' => [35000, 60000], 'unit' => 'pcs', 'desc' => 'Bakul nasi tradisional dari anyaman bambu.'],
            ['name' => 'Tampah Bambu', 'price' => [25000, 45000], 'unit' => 'pcs', 'desc' => 'Tampah untuk menjemur atau display.'],
            ['name' => 'Tudung Saji Bambu', 'price' => [40000, 75000], 'unit' => 'pcs', 'desc' => 'Tudung saji ukuran besar dengan anyaman halus.'],
            ['name' => 'Tas Anyaman Bambu', 'price' => [65000, 120000], 'unit' => 'pcs', 'desc' => 'Tas jinjing dari anyaman bambu.'],
            ['name' => 'Set Piring Bambu', 'price' => [80000, 150000], 'unit' => 'set', 'desc' => 'Set 6 piring anyaman bambu untuk dekorasi.'],
        ],
        // LUKISAN KACA
        'lukisan kaca' => [
            ['name' => 'Lukisan Kaca Wayang Kecil', 'price' => [150000, 300000], 'unit' => 'pcs', 'desc' => 'Lukisan kaca motif wayang ukuran 20x30cm.'],
            ['name' => 'Lukisan Kaca Wayang Besar', 'price' => [450000, 850000], 'unit' => 'pcs', 'desc' => 'Lukisan kaca motif wayang ukuran 50x70cm.'],
            ['name' => 'Lukisan Kaca Kaligrafi', 'price' => [250000, 500000], 'unit' => 'pcs', 'desc' => 'Lukisan kaca kaligrafi dengan frame kayu.'],
            ['name' => 'Lukisan Kaca Custom', 'price' => [500000, 1500000], 'unit' => 'pcs', 'desc' => 'Lukisan kaca pesanan dengan desain khusus.'],
        ],
        // TOPENG
        'topeng' => [
            ['name' => 'Topeng Panji', 'price' => [150000, 300000], 'unit' => 'pcs', 'desc' => 'Topeng tari Panji dengan warna putih.'],
            ['name' => 'Topeng Samba', 'price' => [150000, 300000], 'unit' => 'pcs', 'desc' => 'Topeng tari Samba dengan warna merah.'],
            ['name' => 'Topeng Rumyang', 'price' => [180000, 350000], 'unit' => 'pcs', 'desc' => 'Topeng tari Rumyang dengan hiasan emas.'],
            ['name' => 'Topeng Tumenggung', 'price' => [200000, 400000], 'unit' => 'pcs', 'desc' => 'Topeng karakter Tumenggung untuk koleksi.'],
            ['name' => 'Set Topeng Cirebon', 'price' => [800000, 1500000], 'unit' => 'set', 'desc' => 'Set 5 topeng utama tari topeng Cirebon.'],
        ],
        // KONVEKSI
        'konveksi' => [
            ['name' => 'Seragam Batik Kantor', 'price' => [150000, 250000], 'unit' => 'pcs', 'desc' => 'Seragam batik untuk kantor, minimal order 20 pcs.'],
            ['name' => 'Kemeja Casual Batik', 'price' => [180000, 280000], 'unit' => 'pcs', 'desc' => 'Kemeja batik casual untuk sehari-hari.'],
            ['name' => 'Gamis Batik Modern', 'price' => [220000, 380000], 'unit' => 'pcs', 'desc' => 'Gamis batik dengan desain modern.'],
            ['name' => 'Batik Couple Set', 'price' => [350000, 550000], 'unit' => 'set', 'desc' => 'Set batik couple kemeja dan dress.'],
        ],
        // BORDIR
        'bordir' => [
            ['name' => 'Bordir Logo Perusahaan', 'price' => [15000, 30000], 'unit' => 'pcs', 'desc' => 'Bordir logo untuk seragam, minimal 50 pcs.'],
            ['name' => 'Bordir Nama', 'price' => [10000, 20000], 'unit' => 'pcs', 'desc' => 'Bordir nama untuk seragam sekolah/kantor.'],
            ['name' => 'Badge Bordir Custom', 'price' => [25000, 50000], 'unit' => 'pcs', 'desc' => 'Badge dengan desain custom.'],
            ['name' => 'Mukena Bordir', 'price' => [180000, 350000], 'unit' => 'set', 'desc' => 'Mukena dengan bordir ornamen halus.'],
        ],
        // TAS RAJUT
        'tas rajut' => [
            ['name' => 'Tas Rajut Tote Bag', 'price' => [85000, 150000], 'unit' => 'pcs', 'desc' => 'Tas rajut model tote bag dengan warna polos.'],
            ['name' => 'Tas Rajut Sling Bag', 'price' => [75000, 130000], 'unit' => 'pcs', 'desc' => 'Tas selempang rajut ukuran sedang.'],
            ['name' => 'Tas Rajut Bucket', 'price' => [95000, 180000], 'unit' => 'pcs', 'desc' => 'Tas rajut model bucket bag.'],
            ['name' => 'Dompet Rajut', 'price' => [45000, 80000], 'unit' => 'pcs', 'desc' => 'Dompet kecil rajut dengan resleting.'],
            ['name' => 'Tas Laptop Rajut', 'price' => [120000, 200000], 'unit' => 'pcs', 'desc' => 'Tas laptop rajut dengan padding dalam.'],
        ],
        // TERASI
        'terasi' => [
            ['name' => 'Terasi Udang Premium 250gr', 'price' => [35000, 50000], 'unit' => 'pack', 'desc' => 'Terasi udang pilihan dengan aroma khas.'],
            ['name' => 'Terasi Udang 500gr', 'price' => [60000, 85000], 'unit' => 'pack', 'desc' => 'Kemasan hemat untuk keluarga.'],
            ['name' => 'Terasi Ikan', 'price' => [30000, 45000], 'unit' => 'pack', 'desc' => 'Terasi dari ikan pilihan.'],
            ['name' => 'Paket Terasi Oleh-oleh', 'price' => [100000, 150000], 'unit' => 'paket', 'desc' => 'Paket terasi dalam box eksklusif.'],
        ],
        // KUE TRADISIONAL
        'kue tapel' => [
            ['name' => 'Kue Tapel Original', 'price' => [25000, 40000], 'unit' => 'box', 'desc' => 'Kue tapel tradisional dalam kemasan box.'],
            ['name' => 'Kue Cucur', 'price' => [20000, 35000], 'unit' => 'box', 'desc' => 'Kue cucur manis dengan gula merah.'],
            ['name' => 'Onde-onde', 'price' => [25000, 40000], 'unit' => 'box', 'desc' => 'Onde-onde isi kacang hijau.'],
            ['name' => 'Kue Lapis', 'price' => [30000, 50000], 'unit' => 'box', 'desc' => 'Kue lapis legit tradisional.'],
            ['name' => 'Paket Kue Mix', 'price' => [75000, 120000], 'unit' => 'paket', 'desc' => 'Paket campuran 4 jenis kue tradisional.'],
        ],
        // OLEH-OLEH
        'oleh-oleh' => [
            ['name' => 'Paket Oleh-oleh Lengkap', 'price' => [150000, 250000], 'unit' => 'paket', 'desc' => 'Paket lengkap berisi kerupuk, terasi, dan kue khas.'],
            ['name' => 'Kerupuk Udang', 'price' => [35000, 55000], 'unit' => 'pack', 'desc' => 'Kerupuk udang renyah kemasan 500gr.'],
            ['name' => 'Rempeyek Kacang', 'price' => [30000, 45000], 'unit' => 'pack', 'desc' => 'Rempeyek kacang gurih renyah.'],
            ['name' => 'Sambal Terasi Botol', 'price' => [25000, 40000], 'unit' => 'botol', 'desc' => 'Sambal terasi siap saji dalam botol.'],
            ['name' => 'Abon Ikan', 'price' => [40000, 65000], 'unit' => 'pack', 'desc' => 'Abon ikan khas pesisir Cirebon.'],
        ],
        // PETIS
        'petis udang' => [
            ['name' => 'Petis Udang 250ml', 'price' => [25000, 40000], 'unit' => 'botol', 'desc' => 'Petis udang kental dalam botol kaca.'],
            ['name' => 'Petis Udang 500ml', 'price' => [45000, 70000], 'unit' => 'botol', 'desc' => 'Petis udang kemasan besar.'],
            ['name' => 'Petis Ikan', 'price' => [22000, 35000], 'unit' => 'botol', 'desc' => 'Petis ikan untuk bumbu masakan.'],
        ],
        // SIRUP
        'sirup cempaka' => [
            ['name' => 'Sirup Cempaka 500ml', 'price' => [35000, 55000], 'unit' => 'botol', 'desc' => 'Sirup bunga cempaka wangi dan manis.'],
            ['name' => 'Sirup Cempaka 1L', 'price' => [60000, 90000], 'unit' => 'botol', 'desc' => 'Sirup cempaka kemasan besar.'],
            ['name' => 'Paket Sirup 3 Botol', 'price' => [95000, 150000], 'unit' => 'paket', 'desc' => 'Paket hemat 3 botol sirup cempaka.'],
        ],
        // RENGGINANG
        'rengginang' => [
            ['name' => 'Rengginang Original', 'price' => [22000, 35000], 'unit' => 'pack', 'desc' => 'Rengginang ketan gurih renyah.'],
            ['name' => 'Rengginang Pedas', 'price' => [25000, 40000], 'unit' => 'pack', 'desc' => 'Rengginang dengan bumbu pedas.'],
            ['name' => 'Rengginang Jumbo', 'price' => [40000, 60000], 'unit' => 'pack', 'desc' => 'Kemasan besar 500gr untuk oleh-oleh.'],
        ],
    ];

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $umkms = Umkm::all();

        if ($umkms->count() === 0) {
            $this->command->warn('No UMKMs found. Make sure to run UmkmSeeder first.');
            return;
        }

        // Image placeholders berdasarkan kategori
        $imageMap = [
            'kuliner' => '/storage/products/placeholder/kuliner.png',
            'batik' => '/storage/products/placeholder/batik.png',
            'kerajinan' => '/storage/products/placeholder/kerajinan.png',
            'fashion' => '/storage/products/placeholder/fashion.png',
            'makanan' => '/storage/products/placeholder/makanan.png',
        ];

        $productCount = 0;

        foreach ($umkms as $umkm) {
            $products = $this->getProductsForUmkm($umkm->business_name);
            
            // Determine image category based on business name
            $businessNameLower = strtolower($umkm->business_name);
            $imageKey = 'kuliner'; // default
            
            if (str_contains($businessNameLower, 'batik') || 
                str_contains($businessNameLower, 'megamendung') || 
                str_contains($businessNameLower, 'wadasan')) {
                $imageKey = 'batik';
            } elseif (str_contains($businessNameLower, 'rotan') || 
                      str_contains($businessNameLower, 'anyaman') || 
                      str_contains($businessNameLower, 'lukisan') ||
                      str_contains($businessNameLower, 'topeng')) {
                $imageKey = 'kerajinan';
            } elseif (str_contains($businessNameLower, 'konveksi') || 
                      str_contains($businessNameLower, 'bordir') ||
                      str_contains($businessNameLower, 'jahit') ||
                      str_contains($businessNameLower, 'tas rajut')) {
                $imageKey = 'fashion';
            } elseif (str_contains($businessNameLower, 'terasi') || 
                      str_contains($businessNameLower, 'petis') ||
                      str_contains($businessNameLower, 'kue') ||
                      str_contains($businessNameLower, 'oleh-oleh') ||
                      str_contains($businessNameLower, 'rengginang') ||
                      str_contains($businessNameLower, 'sirup') ||
                      str_contains($businessNameLower, 'kerupuk')) {
                $imageKey = 'makanan';
            }
            
            foreach ($products as $productData) {
                $price = fake()->numberBetween($productData['price'][0], $productData['price'][1]);
                
                Product::create([
                    'umkm_id' => $umkm->id,
                    'name' => $productData['name'],
                    'slug' => Str::slug($productData['name'] . '-' . fake()->randomNumber(3)),
                    'description' => $productData['desc'],
                    'price' => $price,
                    'unit' => $productData['unit'],
                    'stock' => fake()->numberBetween(10, 150),
                    'images' => [$imageMap[$imageKey]], // Array of images
                    'is_available' => true,
                    'is_featured' => fake()->boolean(20),
                ]);
                
                $productCount++;
            }
        }

        $this->command->info("Created {$productCount} products for " . $umkms->count() . ' UMKMs khas Cirebon.');
    }

    /**
     * Get products based on UMKM business name
     */
    private function getProductsForUmkm(string $businessName): array
    {
        $businessNameLower = strtolower($businessName);
        
        // Match by keyword in business name
        foreach ($this->productsByType as $keyword => $products) {
            if (str_contains($businessNameLower, $keyword)) {
                return $products;
            }
        }

        // Fallback matching by category type
        if (str_contains($businessNameLower, 'batik') || str_contains($businessNameLower, 'megamendung') || str_contains($businessNameLower, 'wadasan')) {
            return $this->productsByType['batik'];
        }
        
        if (str_contains($businessNameLower, 'furniture') || str_contains($businessNameLower, 'rotan indah') || str_contains($businessNameLower, 'jaya')) {
            return $this->productsByType['rotan'];
        }

        if (str_contains($businessNameLower, 'warung') || str_contains($businessNameLower, 'nasi') || str_contains($businessNameLower, 'mie')) {
            return $this->productsByType['nasi jamblang'];
        }

        // Default fallback
        return $this->productsByType['oleh-oleh'];
    }
}
