<?php

namespace App\Filament\Resources\Products\Schemas;

use App\Models\Umkm;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Schema;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class ProductForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                // UMKM Selection with role-based filtering
                Select::make('umkm_id')
                    ->label('UMKM')
                    ->options(function () {
                        $user = Auth::user();

                        // If user has super-admin, admin, or staff role, show all UMKMs
                        if ($user && $user->hasAnyRole(['super-admin', 'admin', 'staff'])) {
                            return Umkm::pluck('business_name', 'id');
                        }

                        // Otherwise (umkm-owner or other roles), only show their owned UMKMs
                        return Umkm::where('owner_id', Auth::id())
                            ->pluck('business_name', 'id');
                    })
                    ->searchable()
                    ->preload()
                    ->required()
                    ->helperText('Pilih UMKM pemilik produk ini'),

                // Product Name with auto-slug generation
                TextInput::make('name')
                    ->label('Nama Produk')
                    ->required()
                    ->maxLength(255)
                    ->live(onBlur: true)
                    ->afterStateUpdated(function ($state, callable $set) {
                        // Auto-generate slug from name
                        $set('slug', Str::slug($state));
                    })
                    ->placeholder('contoh: Batik Tulis Mega Mendung'),

                // Slug field - auto-filled but editable
                TextInput::make('slug')
                    ->label('Slug (URL)')
                    ->required()
                    ->maxLength(255)
                    ->unique(ignoreRecord: true)
                    ->helperText('Otomatis diisi dari nama produk, tapi bisa diubah sesuai keinginan')
                    ->placeholder('contoh: batik-tulis-mega-mendung'),

                // Description
                Textarea::make('description')
                    ->label('Deskripsi')
                    ->rows(4)
                    ->columnSpanFull()
                    ->placeholder('Jelaskan detail produk, bahan, ukuran, dan keunggulannya...'),

                // Price
                TextInput::make('price')
                    ->label('Harga')
                    ->required()
                    ->numeric()
                    ->prefix('Rp')
                    ->placeholder('50000')
                    ->helperText('Harga dalam Rupiah'),

                // Unit
                TextInput::make('unit')
                    ->label('Satuan')
                    ->required()
                    ->default('pcs')
                    ->placeholder('pcs, kg, meter, dll')
                    ->helperText('Satuan produk (pcs, kg, meter, dll)'),

                // Stock
                TextInput::make('stock')
                    ->label('Stok')
                    ->required()
                    ->numeric()
                    ->default(0)
                    ->minValue(0)
                    ->placeholder('100')
                    ->helperText('Jumlah stok tersedia'),

                // Images - Multiple image upload
                FileUpload::make('images')
                    ->label('Foto Produk')
                    ->disk('public')
                    ->directory('products')
                    ->image()
                    ->multiple()
                    ->maxFiles(5)
                    ->maxSize(5120) // 5MB per image
                    ->imageEditor()
                    ->imageEditorAspectRatios([
                        '1:1',
                        '4:3',
                        '16:9',
                    ])
                    ->helperText('Format: JPG, PNG. Maksimal 5 gambar, 5MB per gambar. Gambar pertama akan menjadi foto utama.')
                    ->columnSpanFull()
                    ->reorderable(),

                // Availability Toggle
                Toggle::make('is_available')
                    ->label('Tersedia')
                    ->helperText('Aktifkan jika produk tersedia untuk dijual')
                    ->default(true)
                    ->inline(false),

                // Featured Toggle
                Toggle::make('is_featured')
                    ->label('Produk Unggulan')
                    ->helperText('Tandai sebagai produk unggulan untuk ditampilkan di halaman utama')
                    ->default(false)
                    ->inline(false),
            ]);
    }
}
