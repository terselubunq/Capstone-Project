<?php

namespace App\Filament\Resources\Mentorings\RelationManagers;

use App\Filament\Resources\MentoringSessions\MentoringSessionResource;
use Filament\Actions\AssociateAction;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\DissociateAction;
use Filament\Actions\DissociateBulkAction;
use Filament\Actions\EditAction;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Table;

class SessionsRelationManager extends RelationManager
{
    protected static string $relationship = 'sessions';

    public function form(Schema $schema): Schema
    {
        // Use the MentoringSessionResource form, but hide the mentoring_id field
        // since it's automatically set by the relation manager
        $schema = MentoringSessionResource::form($schema);

        // Hide the mentoring selection field since the relation manager handles this
        foreach ($schema->getComponents() as $component) {
            if ($component->getName() === 'mentoring_id') {
                $component->hidden();
            }
        }

        return $schema;
    }

    public function table(Table $table): Table
    {
        // Use the MentoringSessionResource table configuration
        $table = MentoringSessionResource::table($table);

        // Set the record title attribute
        $table->recordTitleAttribute('title');

        // Override header and record actions for relation manager
        return $table
            ->headerActions([
                CreateAction::make(),
                AssociateAction::make(),
            ])
            ->recordActions([
                EditAction::make(),
                DissociateAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DissociateBulkAction::make(),
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
