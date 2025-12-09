<?php

namespace App\Filament\Resources\MentoringSessions;

use App\Filament\Resources\MentoringSessions\Pages\CreateMentoringSession;
use App\Filament\Resources\MentoringSessions\Pages\EditMentoringSession;
use App\Filament\Resources\MentoringSessions\Pages\ListMentoringSessions;
use App\Filament\Resources\MentoringSessions\Schemas\MentoringSessionForm;
use App\Filament\Resources\MentoringSessions\Tables\MentoringSessionsTable;
use App\Models\MentoringSession;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class MentoringSessionResource extends Resource
{
    protected static ?string $model = MentoringSession::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-calendar';

    protected static string|\UnitEnum|null $navigationGroup = 'Mentoring & Assistance';

    protected static ?int $navigationSort = 2;

    protected static ?string $navigationLabel = 'Sessions';

    public static function form(Schema $schema): Schema
    {
        return MentoringSessionForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        $table = MentoringSessionsTable::configure($table);

        // Scope mentoring sessions based on panel
        $panelId = filament()->getCurrentPanel()?->getId();

        if ($panelId === 'umkm-owner') {
            // UMKM owners see sessions for their business
            $table->modifyQueryUsing(function (Builder $query) {
                $userId = Auth::id();
                $query->whereHas('mentoring.umkm', function (Builder $query) use ($userId) {
                    $query->where('owner_id', $userId);
                });
            });
        } elseif ($panelId === 'mentor') {
            // Mentors see their own sessions
            $table->modifyQueryUsing(function (Builder $query) {
                $userId = Auth::id();
                $query->whereHas('mentoring', function (Builder $query) use ($userId) {
                    $query->where('mentor_id', $userId);
                });
            });
        }

        return $table;
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListMentoringSessions::route('/'),
            'create' => CreateMentoringSession::route('/create'),
            'edit' => EditMentoringSession::route('/{record}/edit'),
        ];
    }
}
