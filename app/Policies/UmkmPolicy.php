<?php

namespace App\Policies;

use App\Models\Umkm;
use App\Models\User;

class UmkmPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'mentor', 'umkm-owner']) ||
               $user->hasPermission('umkm-view');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Umkm $umkm): bool
    {
        // Admins, staff, and mentors can view all
        if ($user->hasAnyRole(['super-admin', 'admin', 'staff', 'mentor']) ||
            $user->hasPermission('umkm-view')) {
            return true;
        }

        // UMKM owners can only view their own UMKMs
        if ($user->hasRole('umkm-owner')) {
            return $umkm->owner_id === $user->id;
        }

        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
               $user->hasPermission('umkm-create');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Umkm $umkm): bool
    {
        // Admins and staff can edit all
        if ($user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
            $user->hasPermission('umkm-edit')) {
            return true;
        }

        // UMKM owners can only edit their own UMKMs
        if ($user->hasRole('umkm-owner')) {
            return $umkm->owner_id === $user->id;
        }

        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Umkm $umkm): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin']) ||
               $user->hasPermission('umkm-delete');
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Umkm $umkm): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin']) ||
               $user->hasPermission('umkm-delete');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Umkm $umkm): bool
    {
        return $user->hasRole('super-admin');
    }
}
