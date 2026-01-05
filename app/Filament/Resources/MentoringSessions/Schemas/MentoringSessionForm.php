<?php

namespace App\Filament\Resources\MentoringSessions\Schemas;

use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class MentoringSessionForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('mentoring_id')
                    ->label('Program Mentoring')
                    ->relationship('mentoring', 'program_name')
                    ->searchable()
                    ->preload()
                    ->required(),
                TextInput::make('title')
                    ->required(),
                Textarea::make('agenda')
                    ->columnSpanFull(),
                DateTimePicker::make('scheduled_at')
                    ->required(),
                TextInput::make('duration_minutes')
                    ->required()
                    ->numeric()
                    ->default(60),
                TextInput::make('location'),
                TextInput::make('meeting_link'),
                Textarea::make('materials')
                    ->columnSpanFull(),
                Textarea::make('notes')
                    ->columnSpanFull(),
                TextInput::make('attachments'),
                Select::make('status')
                    ->options([
                        'scheduled' => 'Scheduled',
                        'ongoing' => 'Ongoing',
                        'completed' => 'Completed',
                        'cancelled' => 'Cancelled',
                        'rescheduled' => 'Rescheduled',
                    ])
                    ->required()
                    ->default('scheduled')
                    ->native(false),
                DateTimePicker::make('started_at'),
                DateTimePicker::make('completed_at'),
                Textarea::make('evaluation')
                    ->columnSpanFull(),
            ]);
    }
}
