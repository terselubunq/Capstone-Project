<?php

namespace App\Filament\Resources\Umkms\Pages;

use App\Filament\Resources\Umkms\UmkmResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\RestoreAction;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

class EditUmkm extends EditRecord
{
    protected static string $resource = UmkmResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
            ForceDeleteAction::make(),
            RestoreAction::make(),
        ];
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        // Get previous status
        $previousStatus = $this->record->status;

        // If status changed to active and wasn't active before, auto-fill verified_by
        if (isset($data['status']) && $data['status'] === 'active' && $previousStatus !== 'active') {
            $data['verified_by'] = Auth::id();
            $data['verified_at'] = now();
        }

        return $data;
    }
}
