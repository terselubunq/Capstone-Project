<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;

class User extends Authenticatable implements FilamentUser
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'nik',
        'email',
        'phone',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    /**
     * Get the roles that belong to the user.
     */
    public function roles(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(Role::class)->withTimestamps();
    }

    public function hasRole(string $role): bool
    {
        return $this->roles()->where('slug', $role)->exists();
    }

    public function hasAnyRole(array $roles): bool
    {
        return $this->roles()->whereIn('slug', $roles)->exists();
    }

    public function hasPermission(string $permission): bool
    {
        return $this->roles()->whereHas('permissions', function ($query) use ($permission) {
            $query->where('slug', $permission);
        })->exists();
    }

    public function mentorings(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Mentoring::class, 'mentor_id');
    }

    public function createdUmkms(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Umkm::class, 'created_by');
    }

    public function verifiedUmkms(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Umkm::class, 'verified_by');
    }

    public function ownedUmkms(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Umkm::class, 'owner_id');
    }

    public function canAccessPanel(Panel $panel): bool
    {
        // Only super-admin can access the super-admin panel
        if ($panel->getId() === 'super-admin') {
            return $this->hasRole('super-admin');
        }

        // Super-admin and admin can access the admin panel
        if ($panel->getId() === 'admin') {
            return $this->hasAnyRole(['super-admin', 'admin']);
        }

        // Staff panel: super-admin, admin, and staff
        if ($panel->getId() === 'staff') {
            return $this->hasAnyRole(['super-admin', 'admin', 'staff']);
        }

        // Mentor panel: super-admin, admin, and mentor
        if ($panel->getId() === 'mentor') {
            return $this->hasAnyRole(['super-admin', 'admin', 'mentor']);
        }

        // UMKM Owner panel: super-admin, admin, and umkm-owner
        if ($panel->getId() === 'umkm-owner') {
            return $this->hasAnyRole(['super-admin', 'admin', 'umkm-owner']);
        }

        // Deny access to unknown panels
        return false;
    }
}
