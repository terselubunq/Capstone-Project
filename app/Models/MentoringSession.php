<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MentoringSession extends Model
{
    /** @use HasFactory<\Database\Factories\MentoringSessionFactory> */
    use HasFactory;

    protected $fillable = [
        'mentoring_id',
        'title',
        'agenda',
        'scheduled_at',
        'duration_minutes',
        'location',
        'meeting_link',
        'materials',
        'notes',
        'attachments',
        'status',
        'started_at',
        'completed_at',
        'evaluation',
    ];

    protected function casts(): array
    {
        return [
            'scheduled_at' => 'datetime',
            'started_at' => 'datetime',
            'completed_at' => 'datetime',
            'attachments' => 'array',
            'duration_minutes' => 'integer',
        ];
    }

    public function mentoring(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Mentoring::class);
    }

    public function scopeUpcoming($query): void
    {
        $query->where('status', 'scheduled')
            ->where('scheduled_at', '>', now());
    }

    public function scopeCompleted($query): void
    {
        $query->where('status', 'completed');
    }
}
