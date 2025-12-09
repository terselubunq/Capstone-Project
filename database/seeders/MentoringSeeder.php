<?php

namespace Database\Seeders;

use App\Models\Mentoring;
use App\Models\Umkm;
use App\Models\User;
use Illuminate\Database\Seeder;

class MentoringSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all UMKMs and mentors
        $umkms = Umkm::where('status', 'active')->where('is_published', true)->get();
        $mentors = User::whereHas('roles', function ($query) {
            $query->where('slug', 'mentor');
        })->get();

        if ($umkms->isEmpty() || $mentors->isEmpty()) {
            $this->command->warn('No UMKMs or mentors found. Skipping mentoring seeder.');

            return;
        }

        // Program templates with realistic data
        $programTemplates = [
            [
                'program_name' => 'Dasar-Dasar Kewirausahaan',
                'description' => 'Program untuk pemula yang baru memulai usaha. Pelajari fundamental bisnis, manajemen keuangan dasar, dan strategi pemasaran untuk mengembangkan UMKM Anda.',
                'objectives' => "1. Memahami konsep dasar kewirausahaan dan mindset bisnis\n2. Menguasai manajemen keuangan sederhana untuk UMKM\n3. Mempelajari strategi pemasaran dasar yang efektif\n4. Mengembangkan rencana bisnis yang terstruktur",
                'type' => 'management',
            ],
            [
                'program_name' => 'Digital Marketing untuk UMKM',
                'description' => 'Kuasai strategi pemasaran digital, media sosial, dan e-commerce untuk meningkatkan jangkauan pasar dan penjualan produk Anda di era digital.',
                'objectives' => "1. Menguasai teknik pemasaran melalui media sosial\n2. Membangun brand awareness di platform digital\n3. Memanfaatkan marketplace untuk meningkatkan penjualan\n4. Menganalisis data untuk optimasi strategi pemasaran",
                'type' => 'marketing',
            ],
            [
                'program_name' => 'Manajemen Keuangan Bisnis',
                'description' => 'Pelajari pembukuan, analisis laporan keuangan, dan perencanaan keuangan untuk keberlanjutan usaha dan pertumbuhan bisnis yang sehat.',
                'objectives' => "1. Melakukan pembukuan keuangan yang rapi dan sistematis\n2. Memahami laporan keuangan (laba rugi, neraca, arus kas)\n3. Mengelola modal kerja dan investasi dengan bijak\n4. Merencanakan keuangan jangka panjang untuk pertumbuhan bisnis",
                'type' => 'financial',
            ],
            [
                'program_name' => 'Optimasi Proses Produksi',
                'description' => 'Tingkatkan efisiensi produksi, quality control, dan supply chain management untuk meningkatkan produktivitas dan mengurangi biaya operasional.',
                'objectives' => "1. Mengoptimalkan alur proses produksi\n2. Menerapkan quality control yang efektif\n3. Mengelola inventory dan supply chain\n4. Meningkatkan produktivitas tanpa mengurangi kualitas",
                'type' => 'production',
            ],
            [
                'program_name' => 'Ekspor & Sertifikasi Produk',
                'description' => 'Persiapan ekspor, proses sertifikasi Halal, PIRT, SNI, dan standar internasional lainnya untuk membuka peluang pasar yang lebih luas.',
                'objectives' => "1. Memahami regulasi dan persyaratan ekspor\n2. Mempersiapkan dokumentasi ekspor yang lengkap\n3. Mendapatkan sertifikasi produk (Halal, PIRT, SNI)\n4. Membuka akses ke pasar internasional",
                'type' => 'legal',
            ],
            [
                'program_name' => 'Pengembangan Produk & Inovasi',
                'description' => 'Mengembangkan produk baru, meningkatkan kualitas produk existing, dan menciptakan inovasi yang sesuai dengan kebutuhan pasar.',
                'objectives' => "1. Melakukan riset pasar untuk pengembangan produk\n2. Menciptakan inovasi produk yang unik\n3. Meningkatkan kualitas dan daya saing produk\n4. Melakukan uji coba dan validasi produk baru",
                'type' => 'production',
            ],
            [
                'program_name' => 'Teknologi untuk UMKM',
                'description' => 'Implementasi teknologi untuk meningkatkan efisiensi operasional, dari sistem POS, inventory management, hingga customer relationship management.',
                'objectives' => "1. Memilih teknologi yang tepat untuk bisnis\n2. Implementasi sistem POS dan inventory digital\n3. Memanfaatkan CRM untuk customer management\n4. Menggunakan analitik untuk business intelligence",
                'type' => 'technology',
            ],
            [
                'program_name' => 'Branding & Packaging',
                'description' => 'Membangun brand identity yang kuat dan desain packaging yang menarik untuk meningkatkan perceived value produk di mata konsumen.',
                'objectives' => "1. Membangun brand identity yang konsisten\n2. Mendesain packaging yang menarik dan fungsional\n3. Menciptakan storytelling brand yang engaging\n4. Meningkatkan perceived value melalui branding",
                'type' => 'marketing',
            ],
        ];

        // Create mentoring programs for random UMKMs
        $createdPrograms = 0;
        $targetPrograms = min(25, $umkms->count()); // Create up to 25 programs

        foreach ($umkms->random(min($targetPrograms, $umkms->count())) as $umkm) {
            $template = $programTemplates[array_rand($programTemplates)];
            $mentor = $mentors->random();

            // Random status distribution
            $statusRand = rand(1, 100);
            if ($statusRand <= 40) {
                $status = 'ongoing';
                $startDate = now()->subMonths(rand(1, 3));
                $endDate = now()->addMonths(rand(1, 3));
            } elseif ($statusRand <= 70) {
                $status = 'completed';
                $startDate = now()->subMonths(rand(4, 12));
                $endDate = now()->subMonths(rand(1, 3));
            } elseif ($statusRand <= 90) {
                $status = 'scheduled';
                $startDate = now()->addWeeks(rand(1, 4));
                $endDate = now()->addMonths(rand(2, 4));
            } else {
                $status = 'cancelled';
                $startDate = now()->subMonths(rand(1, 2));
                $endDate = now()->addMonths(rand(1, 2));
            }

            Mentoring::create([
                'umkm_id' => $umkm->id,
                'mentor_id' => $mentor->id,
                'program_name' => $template['program_name'],
                'description' => $template['description'],
                'objectives' => $template['objectives'],
                'type' => $template['type'],
                'start_date' => $startDate,
                'end_date' => $endDate,
                'status' => $status,
                'notes' => $status === 'completed' ? 'Program telah selesai dilaksanakan dengan baik. UMKM menunjukkan peningkatan signifikan dalam penerapan materi.' : null,
            ]);

            $createdPrograms++;
        }

        $this->command->info("Created {$createdPrograms} mentoring programs.");
    }
}
