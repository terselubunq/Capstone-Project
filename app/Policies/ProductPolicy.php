<?php

namespace App\Policies;

use App\Models\Product;
use App\Models\User;

class ProductPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'mentor', 'umkm-owner']) ||
               $user->hasPermission('product-view');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Product $product): bool
    {
        // UMKM owners can only view their own products
        if ($user->hasRole('umkm-owner')) {
            return $product->umkm && $product->umkm->owner_id === $user->id;
        }

        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'mentor']) ||
               $user->hasPermission('product-view');
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'umkm-owner']) ||
               $user->hasPermission('product-create');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Product $product): bool
    {
        // UMKM owners can only update their own products
        if ($user->hasRole('umkm-owner')) {
            return $product->umkm && $product->umkm->owner_id === $user->id;
        }

        return $user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
               $user->hasPermission('product-edit');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Product $product): bool
    {
        // UMKM owners can delete their own products
        if ($user->hasRole('umkm-owner')) {
            return $product->umkm && $product->umkm->owner_id === $user->id;
        }

        return $user->hasAnyRole(['super-admin', 'admin']) ||
               $user->hasPermission('product-delete');
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Product $product): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin']);
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Product $product): bool
    {
        return $user->hasRole('super-admin');
    }
}
