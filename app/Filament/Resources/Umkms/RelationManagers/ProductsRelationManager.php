<?php

namespace App\Filament\Resources\Umkms\RelationManagers;

use App\Filament\Resources\Products\ProductResource;
use Filament\Actions\AssociateAction;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\CreateAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\DissociateAction;
use Filament\Actions\DissociateBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\ForceDeleteBulkAction;
use Filament\Actions\RestoreAction;
use Filament\Actions\RestoreBulkAction;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Schemas\Schema;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProductsRelationManager extends RelationManager
{
    protected static string $relationship = 'products';

    public function form(Schema $schema): Schema
    {
        // Use the ProductResource form, but hide the umkm_id field
        // since it's automatically set by the relation manager
        $schema = ProductResource::form($schema);

        // Hide the UMKM selection field since the relation manager handles this
        foreach ($schema->getComponents() as $component) {
            if ($component->getName() === 'umkm_id') {
                $component->hidden();
            }
        }

        return $schema;
    }

    public function table(Table $table): Table
    {
        // Use the ProductResource table configuration
        $table = ProductResource::table($table);

        // Set the record title attribute
        $table->recordTitleAttribute('name');

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
                ForceDeleteAction::make(),
                RestoreAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DissociateBulkAction::make(),
                    DeleteBulkAction::make(),
                    ForceDeleteBulkAction::make(),
                    RestoreBulkAction::make(),
                ]),
            ])
            ->modifyQueryUsing(fn (Builder $query) => $query
                ->withoutGlobalScopes([
                    SoftDeletingScope::class,
                ]));
    }
}
