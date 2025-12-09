<?php

namespace App\Filament\Resources\Documents\Pages;

use App\Filament\Resources\Documents\DocumentResource;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class CreateDocument extends CreateRecord
{
    protected static string $resource = DocumentResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Ensure uploaded_by is set
        $data['uploaded_by'] = $data['uploaded_by'] ?? Auth::id();

        // If file metadata wasn't set by the form, extract it from the uploaded file
        if (! empty($data['file_path'])) {
            $filePath = $data['file_path'];

            if (empty($data['file_name']) || empty($data['file_type']) || empty($data['file_size'])) {
                // Get file info from storage
                $disk = Storage::disk('public');

                if ($disk->exists($filePath)) {
                    $data['file_name'] = $data['file_name'] ?? basename($filePath);
                    $data['file_size'] = $data['file_size'] ?? $disk->size($filePath);

                    // Get mime type from file extension
                    $extension = pathinfo($filePath, PATHINFO_EXTENSION);
                    $data['file_type'] = $data['file_type'] ?? mime_content_type(storage_path('app/public/'.$filePath)) ?: 'application/octet-stream';
                }
            }
        }

        return $data;
    }
}
