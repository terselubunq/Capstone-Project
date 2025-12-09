<?php

namespace Database\Seeders;

use App\Models\Mentoring;
use App\Models\MentoringSession;
use Illuminate\Database\Seeder;

class MentoringSessionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all mentoring programs
        $mentorings = Mentoring::whereIn('status', ['ongoing', 'completed'])->get();

        if ($mentorings->isEmpty()) {
            $this->command->warn('No mentoring programs found. Skipping session seeder.');

            return;
        }

        // Session templates with realistic agendas
        $sessionTemplates = [
            [
                'title' => 'Sesi Kick-off & Orientasi Program',
                'agenda' => "1. Perkenalan mentor dan peserta\n2. Overview program dan objectives\n3. Penetapan target dan milestone\n4. Q&A session",
                'duration_minutes' => 120,
            ],
            [
                'title' => 'Workshop Analisis SWOT Bisnis',
                'agenda' => "1. Pengenalan metode analisis SWOT\n2. Identifikasi kekuatan dan kelemahan internal\n3. Analisis peluang dan ancaman eksternal\n4. Penyusunan strategi berdasarkan hasil analisis",
                'duration_minutes' => 150,
            ],
            [
                'title' => 'Praktik Pembukuan Keuangan',
                'agenda' => "1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung",
                'duration_minutes' => 180,
            ],
            [
                'title' => 'Strategi Pemasaran Digital',
                'agenda' => "1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital",
                'duration_minutes' => 120,
            ],
            [
                'title' => 'Review & Evaluasi Progress',
                'agenda' => "1. Review pencapaian target\n2. Diskusi kendala dan solusi\n3. Penyesuaian strategi jika diperlukan\n4. Penetapan action plan berikutnya",
                'duration_minutes' => 90,
            ],
            [
                'title' => 'Optimasi Proses Produksi',
                'agenda' => "1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi",
                'duration_minutes' => 150,
            ],
            [
                'title' => 'Branding & Product Development',
                'agenda' => "1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk",
                'duration_minutes' => 120,
            ],
            [
                'title' => 'Closing Session & Action Plan',
                'agenda' => "1. Recap pembelajaran selama program\n2. Evaluasi pencapaian objectives\n3. Penyusunan action plan jangka panjang\n4. Certificate ceremony dan closing",
                'duration_minutes' => 120,
            ],
        ];

        $createdSessions = 0;

        foreach ($mentorings as $mentoring) {
            // Create 3-6 sessions per mentoring program
            $sessionCount = rand(3, 6);
            $startDate = $mentoring->start_date;
            $endDate = $mentoring->end_date;
            $daysBetween = $startDate->diffInDays($endDate);
            $sessionInterval = max(7, floor($daysBetween / $sessionCount)); // At least 1 week between sessions

            for ($i = 0; $i < $sessionCount; $i++) {
                $template = $sessionTemplates[array_rand($sessionTemplates)];
                $scheduledAt = $startDate->copy()->addDays($sessionInterval * $i)->setTime(rand(9, 15), [0, 30][rand(0, 1)]);

                // Determine session status based on mentoring status and scheduled date
                if ($mentoring->status === 'completed' || $scheduledAt->isPast()) {
                    $status = 'completed';
                    $startedAt = $scheduledAt->copy();
                    $completedAt = $scheduledAt->copy()->addMinutes($template['duration_minutes']);
                    $evaluation = 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.';
                } elseif ($scheduledAt->isFuture() && $scheduledAt->diffInDays(now()) <= 7) {
                    $status = 'scheduled';
                    $startedAt = null;
                    $completedAt = null;
                    $evaluation = null;
                } else {
                    $status = 'scheduled';
                    $startedAt = null;
                    $completedAt = null;
                    $evaluation = null;
                }

                MentoringSession::create([
                    'mentoring_id' => $mentoring->id,
                    'title' => $template['title'],
                    'agenda' => $template['agenda'],
                    'scheduled_at' => $scheduledAt,
                    'duration_minutes' => $template['duration_minutes'],
                    'location' => rand(0, 1) ? 'Kantor Dinas Koperasi & UMKM Kota Cirebon' : null,
                    'meeting_link' => rand(0, 1) ? 'https://meet.google.com/'.substr(md5(uniqid()), 0, 10) : null,
                    'materials' => $status === 'completed' ? 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.' : null,
                    'notes' => $status === 'completed' ? 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.' : null,
                    'status' => $status,
                    'started_at' => $startedAt,
                    'completed_at' => $completedAt,
                    'evaluation' => $evaluation,
                ]);

                $createdSessions++;
            }
        }

        $this->command->info("Created {$createdSessions} mentoring sessions.");
    }
}
