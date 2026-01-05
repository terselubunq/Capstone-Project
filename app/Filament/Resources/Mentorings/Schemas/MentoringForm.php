<?php

namespace App\Filament\Resources\Mentorings\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;
use Illuminate\Support\Facades\Auth;

class MentoringForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('umkm_id')
                    ->label('UMKM')
                    ->relationship('umkm', 'business_name')
                    ->searchable()
                    ->preload()
                    ->required(),
                    
                // Mentor field - visible for admin/staff, hidden for mentor
                Select::make('mentor_id')
                    ->label('Mentor')
                    ->relationship('mentor', 'name')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->hidden(fn () => filament()->getCurrentPanel()?->getId() === 'mentor'),
                
                // Hidden mentor_id for mentor panel - auto-set to current user
                Hidden::make('mentor_id')
                    ->default(Auth::id())
                    ->dehydrated(true)
                    ->visible(fn () => filament()->getCurrentPanel()?->getId() === 'mentor'),

                TextInput::make('program_name')
                    ->label('Nama Program')
                    ->required(),
                Textarea::make('description')
                    ->label('Deskripsi')
                    ->columnSpanFull(),
                Textarea::make('objectives')
                    ->label('Tujuan Program')
                    ->columnSpanFull(),
                Select::make('type')
                    ->label('Jenis Program')
                    ->options([
                        'financial' => 'Keuangan',
                        'marketing' => 'Pemasaran',
                        'production' => 'Produksi',
                        'management' => 'Manajemen',
                        'technology' => 'Teknologi',
                        'legal' => 'Legalitas',
                        'other' => 'Lainnya',
                    ])
                    ->required()
                    ->default('management')
                    ->native(false),
                DatePicker::make('start_date')
                    ->label('Tanggal Mulai')
                    ->required(),
                DatePicker::make('end_date')
                    ->label('Tanggal Selesai')
                    ->required(),
                Select::make('status')
                    ->label('Status')
                    ->options([
                        'scheduled' => 'Dijadwalkan',
                        'ongoing' => 'Sedang Berlangsung',
                        'completed' => 'Selesai',
                        'cancelled' => 'Dibatalkan',
                    ])
                    ->required()
                    ->default('scheduled')
                    ->native(false),
                Textarea::make('notes')
                    ->label('Catatan')
                    ->columnSpanFull(),
            ]);
    }
}
