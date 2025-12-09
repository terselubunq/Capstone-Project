<?php

namespace App\Policies;

use App\Models\Document;
use App\Models\User;

class DocumentPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'umkm-owner']) ||
               $user->hasPermission('document-view');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Document $document): bool
    {
        // UMKM owners can only view their own documents
        if ($user->hasRole('umkm-owner')) {
            return $document->documentable_type === 'App\\Models\\Umkm' &&
                   $document->documentable &&
                   $document->documentable->owner_id === $user->id;
        }

        return $user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
               $user->hasPermission('document-view');
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'umkm-owner']) ||
               $user->hasPermission('document-create');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Document $document): bool
    {
        // UMKM owners can only update their own documents
        if ($user->hasRole('umkm-owner')) {
            return $document->documentable_type === 'App\\Models\\Umkm' &&
                   $document->documentable &&
                   $document->documentable->owner_id === $user->id;
        }

        return $user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
               $user->hasPermission('document-edit');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Document $document): bool
    {
        // UMKM owners can delete their own documents
        if ($user->hasRole('umkm-owner')) {
            return $document->documentable_type === 'App\\Models\\Umkm' &&
                   $document->documentable &&
                   $document->documentable->owner_id === $user->id;
        }

        return $user->hasAnyRole(['super-admin', 'admin']) ||
               $user->hasPermission('document-delete');
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Document $document): bool
    {
        return false;
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Document $document): bool
    {
        return false;
    }
}
