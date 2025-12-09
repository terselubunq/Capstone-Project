<?php

namespace App\Filament\Resources\Documents\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Support\Enums\FontWeight;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class DocumentsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('title')
                    ->label('Judul Dokumen')
                    ->searchable()
                    ->sortable()
                    ->weight(FontWeight::Bold)
                    ->description(fn ($record) => $record->description),

                TextColumn::make('type')
                    ->label('Jenis')
                    ->badge()
                    ->searchable()
                    ->sortable()
                    ->color(fn (string $state): string => match ($state) {
                        'nik' => 'info',
                        'nib' => 'success',
                        'pirt' => 'warning',
                        'halal' => 'success',
                        'npwp' => 'info',
                        'legal' => 'primary',
                        'license' => 'warning',
                        'certificate' => 'success',
                        default => 'gray',
                    })
                    ->formatStateUsing(fn (string $state): string => match ($state) {
                        'nik' => 'NIK',
                        'nib' => 'NIB',
                        'pirt' => 'PIRT',
                        'halal' => 'Sertifikat Halal',
                        'npwp' => 'NPWP',
                        'legal' => 'Dokumen Legal',
                        'license' => 'Izin Usaha',
                        'certificate' => 'Sertifikat',
                        'other' => 'Lainnya',
                        default => $state,
                    }),

                TextColumn::make('documentable.business_name')
                    ->label('UMKM')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                TextColumn::make('file_name')
                    ->label('Nama File')
                    ->searchable()
                    ->limit(30)
                    ->tooltip(fn ($record) => $record->file_name),

                TextColumn::make('file_type')
                    ->label('Tipe File')
                    ->badge()
                    ->formatStateUsing(fn (string $state): string => match (true) {
                        str_contains($state, 'pdf') => 'PDF',
                        str_contains($state, 'image') => 'Gambar',
                        str_contains($state, 'word') => 'Word',
                        str_contains($state, 'document') => 'Dokumen',
                        default => strtoupper(pathinfo($state, PATHINFO_EXTENSION)),
                    })
                    ->color(fn (string $state): string => match (true) {
                        str_contains($state, 'pdf') => 'danger',
                        str_contains($state, 'image') => 'success',
                        str_contains($state, 'word') => 'info',
                        str_contains($state, 'document') => 'warning',
                        default => 'gray',
                    })
                    ->toggleable(),

                TextColumn::make('file_size')
                    ->label('Ukuran')
                    ->formatStateUsing(fn (int $state): string => match (true) {
                        $state >= 1048576 => number_format($state / 1048576, 2).' MB',
                        $state >= 1024 => number_format($state / 1024, 2).' KB',
                        default => $state.' B',
                    })
                    ->sortable()
                    ->toggleable(),

                TextColumn::make('uploadedBy.name')
                    ->label('Diupload Oleh')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                TextColumn::make('created_at')
                    ->label('Tanggal Upload')
                    ->dateTime('d M Y H:i')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),

                TextColumn::make('updated_at')
                    ->label('Diperbarui')
                    ->dateTime('d M Y H:i')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
