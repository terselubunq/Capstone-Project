<?php

namespace App\Filament\Resources\Mentorings\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class MentoringForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('umkm_id')
                    ->relationship('umkm', 'id')
                    ->required(),
                Select::make('mentor_id')
                    ->relationship('mentor', 'name')
                    ->required(),
                TextInput::make('program_name')
                    ->required(),
                Textarea::make('description')
                    ->columnSpanFull(),
                Textarea::make('objectives')
                    ->columnSpanFull(),
                TextInput::make('type')
                    ->required()
                    ->default('management'),
                DatePicker::make('start_date')
                    ->required(),
                DatePicker::make('end_date')
                    ->required(),
                TextInput::make('status')
                    ->required()
                    ->default('scheduled'),
                Textarea::make('notes')
                    ->columnSpanFull(),
            ]);
    }
}
