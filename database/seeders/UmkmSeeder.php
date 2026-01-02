<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Http;
use App\Models\Umkm;
use App\Models\User;
use App\Models\Category;

class UmkmSeeder extends Seeder
{
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

        $keywordMap = [
            'kuliner'    => 'cirebon,food',
            'batik'      => 'batik,cirebon',
            'kerajinan'  => 'handicraft,craft',
            'fashion'    => 'sewing,clothes',
            'makanan'    => 'food,snack',
        ];

        // helper to download and store a remote image to storage/public (returns Storage::url or null)
        $download = function ($url, $destPath) {
            try {
                $res = Http::timeout(15)->get($url);
                if ($res->ok()) {
                    Storage::disk('public')->put($destPath, $res->body());
                    return Storage::url($destPath);
                }
            } catch (\Exception $e) {
                // ignore; caller will fallback to remote url
            }
            return null;
        };

        $createAndSave = function (Umkm $umkm) use ($owners, $categories, $keywordMap, $download) {
            // set owner if missing
            if (!$umkm->owner_id) {
                $umkm->owner_id = $owners->random()->id;
            }

            // determine category using heuristics
            $foundCategory = null;
            if (str_contains($umkm->business_name, 'Batik')) {
                $foundCategory = $categories->where('slug', 'like', '%batik%')->first();
            } elseif (str_contains($umkm->business_name, 'Rotan') ||
                      str_contains($umkm->business_name, 'Anyaman') ||
                      str_contains($umkm->business_name, 'Kerajinan')) {
                $foundCategory = $categories->where('slug', 'like', '%kerajinan%')->first();
            } elseif (str_contains($umkm->business_name, 'Konveksi') ||
                      str_contains($umkm->business_name, 'Jahit') ||
                      str_contains($umkm->business_name, 'Tas Rajut')) {
                $foundCategory = $categories->where('slug', 'like', '%fashion%')->first();
            } else {
                $foundCategory = $categories->where('slug', 'kuliner')->first();
            }

            // final fallback to guaranteed category
            if ($foundCategory && $foundCategory->id) {
                $umkm->category_id = $foundCategory->id;
            } else {
                $fallback = Category::inRandomOrder()->first();
                $umkm->category_id = $fallback->id;
                $this->command->warn("UmkmSeeder: heuristic failed for '{$umkm->business_name}', falling back to category id {$fallback->id} (slug: {$fallback->slug})");
            }

            // set created_by / verified_by if missing
            $umkm->created_by = $umkm->created_by ?: $owners->random()->id;
            $umkm->verified_by = $umkm->verified_by ?: $owners->random()->id;

            // Save now that required NOT NULL fields are set
            $umkm->save();

            // choose placeholder image based on category
            $imageMap = [
                'kuliner' => '/storage/umkms/placeholder/kuliner.png',
                'batik' => '/storage/umkms/placeholder/batik.png',
                'kerajinan' => '/storage/umkms/placeholder/kerajinan.png',
                'fashion' => '/storage/umkms/placeholder/fashion.png',
            ];
            
            // Determine which placeholder to use based on business name
            $placeholderKey = 'kuliner'; // default
            if (str_contains(strtolower($umkm->business_name), 'batik')) {
                $placeholderKey = 'batik';
            } elseif (str_contains(strtolower($umkm->business_name), 'rotan') ||
                      str_contains(strtolower($umkm->business_name), 'anyaman') ||
                      str_contains(strtolower($umkm->business_name), 'kerajinan') ||
                      str_contains(strtolower($umkm->business_name), 'bordir')) {
                $placeholderKey = 'kerajinan';
            } elseif (str_contains(strtolower($umkm->business_name), 'konveksi') ||
                      str_contains(strtolower($umkm->business_name), 'jahit') ||
                      str_contains(strtolower($umkm->business_name), 'tas') ||
                      str_contains(strtolower($umkm->business_name), 'rajut')) {
                $placeholderKey = 'fashion';
            }

            // Use local placeholder image
            $umkm->logo = $imageMap[$placeholderKey];
            $umkm->photos = [$imageMap[$placeholderKey]];
            $umkm->save();
        };

        // ---------- create active/published (20) in-memory and then persist after setting required fields ----------
        $instances = Umkm::factory(20)
            ->state(function (array $attributes) {
                return [
                    'status' => 'active',
                    'is_published' => true,
                    'verified_at' => now(),
                ];
            })
            ->make(); // not persisted

        foreach ($instances as $umkm) {
            $createAndSave($umkm);
        }

        // ---------- pending (5) — create in-memory, ensure fields, save ----------
        $pending = Umkm::factory(5)
            ->state([
                'status' => 'pending',
                'is_published' => false,
            ])
            ->make();

        foreach ($pending as $umkm) {
            $createAndSave($umkm);
        }

        // ---------- draft (5) ----------
        $drafts = Umkm::factory(5)
            ->state([
                'status' => 'draft',
                'is_published' => false,
            ])
            ->make();

        foreach ($drafts as $umkm) {
            $createAndSave($umkm);
        }

        $this->command->info('Created UMKMs (active/published + pending + draft).');
    }
}
