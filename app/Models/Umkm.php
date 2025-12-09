<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Umkm extends Model
{
    use HasFactory;
    use \Illuminate\Database\Eloquent\SoftDeletes;

    protected $fillable = [
        'business_name',
        'slug',
        'owner_id',
        'address',
        'village',
        'district',
        'city',
        'province',
        'postal_code',
        'category_id',
        'business_type',
        'description',
        'established_year',
        'employee_count',
        'monthly_revenue',
        'capital',
        'nib',
        'has_halal_certificate',
        'has_pirt',
        'website',
        'facebook',
        'instagram',
        'tiktok',
        'whatsapp',
        'latitude',
        'longitude',
        'logo',
        'photos',
        'status',
        'rejection_reason',
        'verified_at',
        'verified_by',
        'created_by',
        'is_published',
    ];

    /**
     * Correct Eloquent casts property (important!)
     */
    protected $casts = [
        'photos' => 'array',
        'has_halal_certificate' => 'boolean',
        'has_pirt' => 'boolean',
        'is_published' => 'boolean',
        'verified_at' => 'datetime',
        'monthly_revenue' => 'decimal:2',
        'capital' => 'decimal:2',
        'latitude' => 'decimal:8',
        'longitude' => 'decimal:8',
        'employee_count' => 'integer',
    ];

    public function category(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function products(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Product::class);
    }

    public function mentorings(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Mentoring::class);
    }

    public function documents(): \Illuminate\Database\Eloquent\Relations\MorphMany
    {
        return $this->morphMany(Document::class, 'documentable');
    }

    public function verifiedBy(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'verified_by');
    }

    public function createdBy(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function owner(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function scopePublished($query): void
    {
        $query->where('is_published', true)->where('status', 'active');
    }

    public function scopeActive($query): void
    {
        $query->where('status', 'active');
    }

    /**
     * Accessor: first_image — returns the best candidate for the main UMKM image
     */
    public function getFirstImageAttribute(): ?string
    {
        // 1) prefer photos (array)
        if ($this->photos) {
            if (is_array($this->photos) && count($this->photos) > 0) {
                return $this->photos[0];
            }

            // if photos stored as string that looks like JSON -> try decode
            if (is_string($this->photos)) {
                $s = trim($this->photos);
                $s = str_replace('\\/', '/', $s);
                $decoded = json_decode($s, true);
                if (json_last_error() === JSON_ERROR_NONE && is_array($decoded) && count($decoded) > 0) {
                    return $decoded[0];
                }
            }
        }

        // 2) fallback to logo
        if (!empty($this->logo) && is_string($this->logo)) {
            return $this->logo;
        }

        return null;
    }
}
