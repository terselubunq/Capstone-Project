<?php

namespace App\Filament\Resources\Umkms\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ForceDeleteBulkAction;
use Filament\Actions\RestoreBulkAction;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;

class UmkmsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('business_name')
                    ->label('Nama Usaha')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('owner.name')
                    ->label('Pemilik')
                    ->searchable()
                    ->sortable()
                    ->description(fn ($record) => $record->owner?->email),
                TextColumn::make('owner.phone')
                    ->label('Telepon')
                    ->searchable()
                    ->toggleable(),
                TextColumn::make('village')
                    ->label('Kelurahan')
                    ->searchable()
                    ->toggleable(),
                TextColumn::make('district')
                    ->label('Kecamatan')
                    ->searchable()
                    ->toggleable(),
                TextColumn::make('city')
                    ->label('Kota')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('category.name')
                    ->label('Kategori')
                    ->searchable()
                    ->sortable()
                    ->badge(),
                TextColumn::make('business_type')
                    ->label('Skala Usaha')
                    ->searchable()
                    ->sortable()
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'mikro' => 'success',
                        'kecil' => 'warning',
                        'menengah' => 'danger',
                        default => 'gray',
                    }),
                TextColumn::make('established_year')
                    ->label('Tahun Berdiri')
                    ->numeric()
                    ->sortable()
                    ->toggleable(),
                TextColumn::make('employee_count')
                    ->label('Karyawan')
                    ->numeric()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('monthly_revenue')
                    ->label('Omzet Bulanan')
                    ->money('IDR')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                IconColumn::make('has_halal_certificate')
                    ->label('Halal')
                    ->boolean()
                    ->toggleable(isToggledHiddenByDefault: true),
                IconColumn::make('has_pirt')
                    ->label('PIRT')
                    ->boolean()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('status')
                    ->label('Status')
                    ->searchable()
                    ->sortable()
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'active' => 'success',
                        'pending' => 'warning',
                        'draft' => 'gray',
                        'inactive' => 'danger',
                        default => 'gray',
                    })
                    ->formatStateUsing(fn (string $state): string => match ($state) {
                        'active' => '✅ Aktif',
                        'pending' => '⏳ Pending',
                        'draft' => '📝 Draft',
                        'inactive' => '❌ Tidak Aktif',
                        default => $state,
                    }),
                IconColumn::make('is_published')
                    ->label('Published')
                    ->boolean()
                    ->toggleable(),
                TextColumn::make('verifiedBy.name')
                    ->label('Diverifikasi Oleh')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('verified_at')
                    ->label('Tanggal Verifikasi')
                    ->dateTime('d M Y H:i')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('deleted_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->recordActions([
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                    ForceDeleteBulkAction::make(),
                    RestoreBulkAction::make(),
                ]),
            ]);
    }
}
