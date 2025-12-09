<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mentoring extends Model
{
    /** @use HasFactory<\Database\Factories\MentoringFactory> */
    use HasFactory;

    use \Illuminate\Database\Eloquent\SoftDeletes;

    protected $fillable = [
        'umkm_id',
        'mentor_id',
        'program_name',
        'description',
        'objectives',
        'type',
        'start_date',
        'end_date',
        'status',
        'notes',
    ];

    protected function casts(): array
    {
        return [
            'start_date' => 'date',
            'end_date' => 'date',
        ];
    }

    public function umkm(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Umkm::class);
    }

    public function mentor(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'mentor_id');
    }

    public function sessions(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(MentoringSession::class);
    }

    public function scopeActive($query): void
    {
        $query->whereIn('status', ['scheduled', 'ongoing']);
    }

    public function scopeCompleted($query): void
    {
        $query->where('status', 'completed');
    }
}
