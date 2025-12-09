<?php

namespace App\Filament\Resources\Roles\RelationManagers;

use App\Filament\Resources\Permissions\PermissionResource;
use Filament\Actions\AttachAction;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\DetachAction;
use Filament\Actions\DetachBulkAction;
use Filament\Actions\EditAction;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Table;

class PermissionsRelationManager extends RelationManager
{
    protected static string $relationship = 'permissions';

    public function form(Schema $schema): Schema
    {
        // Use the PermissionResource form for consistency
        // This includes name, slug, description, and group fields
        return PermissionResource::form($schema);
    }

    public function table(Table $table): Table
    {
        // Use the PermissionResource table configuration
        $table = PermissionResource::table($table);

        // Set the record title attribute
        $table->recordTitleAttribute('name');

        // Override header and record actions for relation manager (many-to-many)
        return $table
            ->headerActions([
                CreateAction::make(),
                AttachAction::make()
                    ->preloadRecordSelect(),
            ])
            ->recordActions([
                EditAction::make(),
                DetachAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DetachBulkAction::make(),
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
