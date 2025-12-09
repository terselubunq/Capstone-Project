<?php

namespace App\Filament\Resources\Umkms\Pages;

use App\Filament\Resources\Umkms\UmkmResource;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateUmkm extends CreateRecord
{
    protected static string $resource = UmkmResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Auto-fill created_by with current user
        $data['created_by'] = Auth::id();

        // If status is active, auto-fill verified_by with current user
        if (isset($data['status']) && $data['status'] === 'active') {
            $data['verified_by'] = Auth::id();
            $data['verified_at'] = now();
        }

        return $data;
    }
}
