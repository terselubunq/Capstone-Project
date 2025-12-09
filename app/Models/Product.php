<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    use \Illuminate\Database\Eloquent\SoftDeletes;

    protected $fillable = [
        'umkm_id',
        'name',
        'slug',
        'description',
        'price',
        'unit',
        'stock',
        'images',
        'is_available',
        'is_featured',
    ];

    /**
     * Correct Eloquent casts property (important!)
     */
    protected $casts = [
        'images' => 'array',
        'price' => 'decimal:2',
        'is_available' => 'boolean',
        'is_featured' => 'boolean',
        'stock' => 'integer',
    ];

    public function umkm(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Umkm::class);
    }

    public function scopeAvailable($query): void
    {
        $query->where('is_available', true);
    }

    public function scopeFeatured($query): void
    {
        $query->where('is_featured', true);
    }

    /**
     * Accessor: first_image — returns the best candidate for the product image
     */
    public function getFirstImageAttribute(): ?string
    {
        // If images already cast to array, use first non-empty
        if ($this->images) {
            if (is_array($this->images) && count($this->images) > 0) {
                return $this->images[0];
            }

            // If images is string (double-encoded), try to clean and decode
            if (is_string($this->images)) {
                $s = trim($this->images);
                $s = str_replace('\\/', '/', $s);
                $decoded = json_decode($s, true);
                if (json_last_error() === JSON_ERROR_NONE && is_array($decoded) && count($decoded) > 0) {
                    return $decoded[0];
                }

                // last resort: regex extract first http(s) url inside string
                if (preg_match('/https?:\/\/[^\s"\']+/', $s, $m)) {
                    return $m[0];
                }
            }
        }

        return null;
    }
}
