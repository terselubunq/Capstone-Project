<?php

namespace App\Policies;

use App\Models\MentoringSession;
use App\Models\User;

class MentoringSessionPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'mentor', 'umkm-owner']) ||
               $user->hasPermission('mentoring-session-view');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, MentoringSession $mentoringSession): bool
    {
        // UMKM owners can only view sessions for their business
        if ($user->hasRole('umkm-owner')) {
            return $mentoringSession->mentoring &&
                   $mentoringSession->mentoring->umkm &&
                   $mentoringSession->mentoring->umkm->owner_id === $user->id;
        }

        // Mentors can view their own sessions
        if ($user->hasRole('mentor')) {
            return $mentoringSession->mentoring &&
                   $mentoringSession->mentoring->mentor_id === $user->id;
        }

        return $user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
               $user->hasPermission('mentoring-session-view');
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'mentor']) ||
               $user->hasPermission('mentoring-session-create');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, MentoringSession $mentoringSession): bool
    {
        // Mentors can update their own sessions
        if ($user->hasRole('mentor')) {
            return $mentoringSession->mentoring &&
                   $mentoringSession->mentoring->mentor_id === $user->id;
        }

        return $user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
               $user->hasPermission('mentoring-session-edit');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, MentoringSession $mentoringSession): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin']) ||
               $user->hasPermission('mentoring-session-delete');
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, MentoringSession $mentoringSession): bool
    {
        return false;
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, MentoringSession $mentoringSession): bool
    {
        return false;
    }
}
