<?php

namespace App\Filament\Resources\Documents\Schemas;

use App\Models\Umkm;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;
use Illuminate\Support\Facades\Auth;

class DocumentForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                // Documentable relationship - Select UMKM
                Select::make('documentable_id')
                    ->label('UMKM')
                    ->options(function () {
                        $user = Auth::user();

                        // If user has super-admin, admin, or staff role, show all UMKMs
                        if ($user && $user->hasAnyRole(['super-admin', 'admin', 'staff'])) {
                            return Umkm::pluck('business_name', 'id');
                        }

                        // Otherwise (umkm-owner or other roles), only show their owned UMKMs
                        return Umkm::where('owner_id', Auth::id())
                            ->pluck('business_name', 'id');
                    })
                    ->searchable()
                    ->preload()
                    ->required()
                    ->live()
                    ->helperText('Pilih UMKM yang terkait dengan dokumen ini'),

                // Hidden field for documentable_type (always Umkm)
                Hidden::make('documentable_type')
                    ->default('App\\Models\\Umkm'),

                // Document details
                TextInput::make('title')
                    ->label('Judul Dokumen')
                    ->required()
                    ->maxLength(255)
                    ->placeholder('contoh: Sertifikat Halal 2025'),

                Select::make('type')
                    ->label('Jenis Dokumen')
                    ->options([
                        'nik' => 'NIK (Nomor Induk Kependudukan)',
                        'nib' => 'NIB (Nomor Induk Berusaha)',
                        'pirt' => 'PIRT (Pangan Industri Rumah Tangga)',
                        'halal' => 'Sertifikat Halal',
                        'npwp' => 'NPWP',
                        'legal' => 'Dokumen Legal Lainnya',
                        'license' => 'Izin Usaha',
                        'certificate' => 'Sertifikat',
                        'other' => 'Lainnya',
                    ])
                    ->required()
                    ->default('other')
                    ->searchable(),

                Textarea::make('description')
                    ->label('Deskripsi')
                    ->rows(3)
                    ->columnSpanFull()
                    ->placeholder('Tambahkan deskripsi atau catatan tentang dokumen ini (opsional)'),

                // File upload - this handles everything automatically
                FileUpload::make('file_path')
                    ->label('Upload Dokumen')
                    ->disk('public')
                    ->directory('documents')
                    ->acceptedFileTypes(['application/pdf', 'image/*', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'])
                    ->maxSize(10240) // 10MB
                    ->required()
                    ->helperText('Format: PDF, Gambar, atau Word. Maksimal 10MB')
                    ->storeFileNamesIn('file_name')
                    ->afterStateUpdated(function ($state, callable $set, callable $get) {
                        // Auto-fill file metadata when file is uploaded
                        if ($state instanceof \Livewire\Features\SupportFileUploads\TemporaryUploadedFile) {
                            $set('file_name', $state->getClientOriginalName());
                            $set('file_type', $state->getMimeType());
                            $set('file_size', $state->getSize());
                        }
                    }),

                // Hidden fields - auto-filled
                Hidden::make('file_name'),
                Hidden::make('file_type'),
                Hidden::make('file_size'),

                Hidden::make('uploaded_by')
                    ->default(Auth::id()),
            ]);
    }
}
