<?php

namespace App\Http\Controllers;

use App\Models\Mentoring;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class MentoringController extends Controller
{
    /**
     * Display a listing of mentoring programs.
     */
    public function index(Request $request): Response
    {
        $query = Mentoring::query()
            ->with(['umkm.category', 'mentor', 'sessions'])
            ->withCount(['sessions'])
            ->latest('created_at');

        // Filter by status
        if ($request->filled('status')) {
            if ($request->input('status') === 'active') {
                $query->whereIn('status', ['scheduled', 'ongoing']);
            } else {
                $query->where('status', $request->input('status'));
            }
        }

        // Filter by type
        if ($request->filled('type')) {
            $query->where('type', $request->input('type'));
        }

        // Search by program name or UMKM name
        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(function ($q) use ($search) {
                $q->where('program_name', 'like', "%{$search}%")
                    ->orWhereHas('umkm', function ($q) use ($search) {
                        $q->where('business_name', 'like', "%{$search}%");
                    });
            });
        }

        // Paginate results
        $mentorings = $query->paginate(12)->withQueryString();

        // Get statistics
        $stats = [
            'total_programs' => Mentoring::count(),
            'active_programs' => Mentoring::whereIn('status', ['scheduled', 'ongoing'])->count(),
            'completed_programs' => Mentoring::where('status', 'completed')->count(),
            'total_umkms_participated' => Mentoring::distinct('umkm_id')->count('umkm_id'),
        ];

        // Get available types for filter
        $types = [
            ['value' => 'financial', 'label' => 'Keuangan'],
            ['value' => 'marketing', 'label' => 'Pemasaran'],
            ['value' => 'production', 'label' => 'Produksi'],
            ['value' => 'management', 'label' => 'Manajemen'],
            ['value' => 'technology', 'label' => 'Teknologi'],
            ['value' => 'legal', 'label' => 'Legal & Perizinan'],
            ['value' => 'other', 'label' => 'Lainnya'],
        ];

        return Inertia::render('program-mentoring/index', [
            'mentorings' => $mentorings,
            'stats' => $stats,
            'types' => $types,
            'filters' => [
                'search' => $request->input('search'),
                'status' => $request->input('status'),
                'type' => $request->input('type'),
            ],
        ]);
    }

    public function show(int $id): Response
    {
        $program = ProgramMentoring::findOrFail($id);

        return Inertia::render('program-mentoring/show', [
            'program' => $program,
        ]);
    }
}
