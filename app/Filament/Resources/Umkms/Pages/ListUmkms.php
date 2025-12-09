<?php

namespace App\Filament\Resources\Umkms\Pages;

use App\Filament\Resources\Umkms\UmkmResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListUmkms extends ListRecords
{
    protected static string $resource = UmkmResource::class;

    protected function getHeaderActions(): array
    {
        // UMKM Owners cannot create new UMKMs (only admins, super-admins, and staff can)
        if (filament()->getCurrentPanel()?->getId() === 'umkm-owner') {
            return [];
        }

        return [
            CreateAction::make(),
        ];
    }
}
