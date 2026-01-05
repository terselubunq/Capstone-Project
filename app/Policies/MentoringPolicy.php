<?php

namespace App\Policies;

use App\Models\Mentoring;
use App\Models\User;

class MentoringPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'mentor']) ||
               $user->hasPermission('mentoring-view');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Mentoring $mentoring): bool
    {
        // Mentors can view their own mentorings
        if ($user->id === $mentoring->mentor_id) {
            return true;
        }

        return $user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
               $user->hasPermission('mentoring-view');
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin', 'staff', 'mentor']) ||
               $user->hasPermission('mentoring-create');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Mentoring $mentoring): bool
    {
        // Mentors can update their own mentorings
        if ($user->id === $mentoring->mentor_id) {
            return true;
        }

        return $user->hasAnyRole(['super-admin', 'admin', 'staff']) ||
               $user->hasPermission('mentoring-edit');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Mentoring $mentoring): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin']) ||
               $user->hasPermission('mentoring-delete');
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Mentoring $mentoring): bool
    {
        return $user->hasAnyRole(['super-admin', 'admin']);
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Mentoring $mentoring): bool
    {
        return $user->hasRole('super-admin');
    }
}
