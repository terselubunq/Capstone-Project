<?php

namespace App\Filament\Resources\Mentorings;

use App\Filament\Resources\Mentorings\Pages\CreateMentoring;
use App\Filament\Resources\Mentorings\Pages\EditMentoring;
use App\Filament\Resources\Mentorings\Pages\ListMentorings;
use App\Filament\Resources\Mentorings\Schemas\MentoringForm;
use App\Filament\Resources\Mentorings\Tables\MentoringsTable;
use App\Models\Mentoring;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;

class MentoringResource extends Resource
{
    protected static ?string $model = Mentoring::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-academic-cap';

    protected static string|\UnitEnum|null $navigationGroup = 'Mentoring & Assistance';

    protected static ?int $navigationSort = 1;

    public static function form(Schema $schema): Schema
    {
        return MentoringForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        $table = MentoringsTable::configure($table);

        // Mentors see only their own mentorings
        if (filament()->getCurrentPanel()?->getId() === 'mentor') {
            $table->modifyQueryUsing(function (Builder $query) {
                $userId = Auth::id();
                $query->where('mentor_id', $userId);
            });
        }

        return $table;
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\SessionsRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListMentorings::route('/'),
            'create' => CreateMentoring::route('/create'),
            'edit' => EditMentoring::route('/{record}/edit'),
        ];
    }

    public static function getRecordRouteBindingEloquentQuery(): Builder
    {
        return parent::getRecordRouteBindingEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]);
    }
}
