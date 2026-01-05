<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Mentoring;
use App\Models\Product;
use App\Models\Umkm;
use Inertia\Inertia;
use Inertia\Response;

class HomeController extends Controller
{
    /**
     * Display the welcome/home page with real statistics and featured content.
     */
    public function index(): Response
    {
        return Inertia::render('welcome', [
            // Statistics - always included
            'stats' => [
                'total_umkms' => Umkm::where('status', 'active')->where('is_published', true)->count(),
                'total_products' => Product::whereHas('umkm', function ($query) {
                    $query->where('status', 'active')->where('is_published', true);
                })->where('is_available', true)->count(),
                'certified_umkms' => Umkm::where('status', 'active')
                    ->where('is_published', true)
                    ->where(function ($query) {
                        $query->where('has_halal_certificate', true)
                            ->orWhere('has_pirt', true);
                    })
                    ->count(),
                'active_mentorings' => Mentoring::whereIn('status', ['ongoing', 'scheduled'])->count(),
            ],

            // Featured UMKMs - lazy loaded for performance
            'featured_umkms' => fn () => Umkm::with(['category'])
                ->where('status', 'active')
                ->where('is_published', true)
                ->latest('verified_at')
                ->limit(4)
                ->get()
                ->map(fn ($umkm) => [
                    'slug' => $umkm->slug,
                    'name' => $umkm->business_name,
                    'category' => $umkm->category->name,
                    'district' => $umkm->district,
                    'description' => $umkm->description,
                    'logo' => $umkm->logo,
                    'first_image' => $umkm->first_image ?? $umkm->logo,
                    'hasHalal' => $umkm->has_halal_certificate,
                    'hasPirt' => $umkm->has_pirt,
                    'businessType' => $umkm->business_type,
                ]),

            // Top categories with UMKM count - lazy loaded
            'top_categories' => fn () => Category::withCount(['umkms' => function ($query) {
                $query->where('status', 'active')->where('is_published', true);
            }])
                ->has('umkms')
                ->orderByDesc('umkms_count')
                ->limit(6)
                ->get()
                ->filter(fn ($category) => $category->umkms_count > 0)
                ->map(fn ($category) => [
                    'slug' => $category->slug,
                    'name' => $category->name,
                    'count' => $category->umkms_count,
                ]),
        ]);
    }
}
