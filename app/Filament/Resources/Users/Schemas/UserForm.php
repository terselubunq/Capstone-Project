<?php

namespace App\Filament\Resources\Users\Schemas;

use Filament\Forms\Components\CheckboxList;
use Filament\Forms\Components\DateTimePicker;
use Filament\Schemas\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;
use Illuminate\Support\Facades\Hash;

class UserForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make('Informasi Akun')
                    ->schema([
                        TextInput::make('name')
                            ->label('Nama Lengkap')
                            ->required()
                            ->maxLength(255),
                        TextInput::make('email')
                            ->label('Email')
                            ->email()
                            ->required()
                            ->unique(ignoreRecord: true)
                            ->maxLength(255),
                        TextInput::make('phone')
                            ->label('Nomor Telepon')
                            ->tel()
                            ->placeholder('08xxxxxxxxxx'),
                        TextInput::make('nik')
                            ->label('NIK')
                            ->numeric()
                            ->length(16)
                            ->placeholder('16 digit NIK'),
                        TextInput::make('password')
                            ->label('Password')
                            ->password()
                            ->dehydrateStateUsing(fn ($state) => $state ? Hash::make($state) : null)
                            ->dehydrated(fn ($state) => filled($state))
                            ->required(fn (string $operation): bool => $operation === 'create')
                            ->helperText(fn (string $operation): string => 
                                $operation === 'edit' ? 'Kosongkan jika tidak ingin mengubah password' : 'Minimal 8 karakter'
                            ),
                        DateTimePicker::make('email_verified_at')
                            ->label('Email Terverifikasi')
                            ->helperText('Kosongkan jika email belum terverifikasi'),
                    ])
                    ->columns(2),

                Section::make('Role & Akses')
                    ->schema([
                        CheckboxList::make('roles')
                            ->label('Role')
                            ->relationship('roles', 'name')
                            ->helperText('Pilih satu atau lebih role untuk user ini')
                            ->columns(2)
                            ->required(),
                    ]),
            ]);
    }
}
