<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Umkm;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class CatalogController extends Controller
{
    public function index(Request $request): Response
    {
        $query = Umkm::query()
            ->with(['category'])
            ->withCount(['products' => function ($q) {
                $q->where('is_available', true);
            }])
            ->where('status', 'active')
            ->where('is_published', true);

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(function ($q) use ($search) {
                $q->where('business_name', 'like', "%{$search}%")
                    ->orWhere('description', 'like', "%{$search}%")
                    ->orWhereHas('owner', function ($ownerQuery) use ($search) {
                        $ownerQuery->where('name', 'like', "%{$search}%");
                    });
            });
        }

        if ($request->filled('categories')) {
            $categorySlugs = $request->input('categories');
            $categoryIds = Category::whereIn('slug', $categorySlugs)->pluck('id');
            if ($categoryIds->isNotEmpty()) {
                $query->whereIn('category_id', $categoryIds);
            }
        }

        if ($request->filled('districts')) {
            $query->whereIn('district', $request->input('districts'));
        }

        if ($request->filled('business_types')) {
            $query->whereIn('business_type', $request->input('business_types'));
        }

        $query->orderByDesc('is_published')->latest('updated_at');

        $umkms = $query->paginate(12)->withQueryString();

        // transform collection items so frontend gets first_image consistently
        $umkms->getCollection()->transform(function ($umkm) {
            $arr = $umkm->toArray();
            $arr['first_image'] = $umkm->first_image ?? $umkm->logo;
            return $arr;
        });

        $categories = Category::withCount(['umkms' => function ($q) {
            $q->where('status', 'active')->where('is_published', true);
        }])->has('umkms')->orderBy('name')->get()->filter(function ($category) {
            return $category->umkms_count > 0;
        })->values();

        $districts = Umkm::where('status', 'active')->where('is_published', true)->distinct()->orderBy('district')->pluck('district')->filter()->values();

        return Inertia::render('katalog/index', [
            'umkms' => $umkms,
            'categories' => $categories,
            'districts' => $districts,
            'filters' => [
                'search' => $request->input('search'),
                'categories' => $request->input('categories', []),
                'districts' => $request->input('districts', []),
                'business_types' => $request->input('business_types', []),
            ],
        ]);
    }

    public function show(string $slug): Response
    {
        $umkmModel = Umkm::with(['category', 'products' => function ($q) {
            $q->where('is_available', true)->latest();
        }])
            ->where('slug', $slug)
            ->where('status', 'active')
            ->where('is_published', true)
            ->firstOrFail();

        // make array and attach first_image for umkm and each product
        $umkm = $umkmModel->toArray();
        $umkm['first_image'] = $umkmModel->first_image ?? $umkmModel->logo;

        $umkm['products'] = $umkmModel->products->map(function ($p) {
            $arr = $p->toArray();
            $arr['first_image'] = $p->first_image;
            return $arr;
        })->toArray();

        return Inertia::render('katalog/show', [
            'umkm' => $umkm,
        ]);
    }
}
