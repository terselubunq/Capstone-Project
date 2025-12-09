<?php

namespace App\Filament\Resources\Documents\Pages;

use App\Filament\Resources\Documents\DocumentResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Storage;

class EditDocument extends EditRecord
{
    protected static string $resource = DocumentResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        // If a new file was uploaded, update the metadata
        if (! empty($data['file_path']) && $data['file_path'] !== $this->record->file_path) {
            $filePath = $data['file_path'];
            $disk = Storage::disk('public');

            if ($disk->exists($filePath)) {
                $data['file_name'] = basename($filePath);
                $data['file_size'] = $disk->size($filePath);
                $data['file_type'] = mime_content_type(storage_path('app/public/'.$filePath)) ?: 'application/octet-stream';
            }
        }

        return $data;
    }
}
