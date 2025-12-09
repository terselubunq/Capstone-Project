<?php

namespace App\Filament\Resources\Mentorings\Pages;

use App\Filament\Resources\Mentorings\MentoringResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\RestoreAction;
use Filament\Resources\Pages\EditRecord;

class EditMentoring extends EditRecord
{
    protected static string $resource = MentoringResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
            ForceDeleteAction::make(),
            RestoreAction::make(),
        ];
    }
}
