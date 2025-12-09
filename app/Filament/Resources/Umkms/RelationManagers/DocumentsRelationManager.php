<?php

namespace App\Filament\Resources\Umkms\RelationManagers;

use App\Filament\Resources\Documents\DocumentResource;
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

class DocumentsRelationManager extends RelationManager
{
    protected static string $relationship = 'documents';

    public function form(Schema $schema): Schema
    {
        // Use the DocumentResource form, but hide the documentable fields
        // since they're automatically set by the relation manager
        $schema = DocumentResource::form($schema);

        // Hide the documentable_id and documentable_type fields
        // since the relation manager handles this automatically
        foreach ($schema->getComponents() as $component) {
            if (in_array($component->getName(), ['documentable_id', 'documentable_type'])) {
                $component->hidden();
            }
        }

        return $schema;
    }

    public function table(Table $table): Table
    {
        // Use the DocumentResource table configuration
        $table = DocumentResource::table($table);

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
