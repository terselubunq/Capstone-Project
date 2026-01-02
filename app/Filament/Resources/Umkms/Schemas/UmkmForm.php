<?php

namespace App\Filament\Resources\Umkms\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Components\Utilities\Set;
use Filament\Schemas\Schema;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class UmkmForm
{
    public static function configure(Schema $schema): Schema
    {
        $user = Auth::user();
        $isAdmin = $user && $user->hasAnyRole(['super-admin', 'admin', 'staff']);

        return $schema
            ->components([
                // === BUSINESS INFORMATION ===
                Section::make('Informasi Usaha')
                    ->description('Informasi dasar tentang usaha Anda')
                    ->schema([
                        TextInput::make('business_name')
                            ->label('Nama Usaha')
                            ->required()
                            ->maxLength(255)
                            ->live(onBlur: true)
                            ->afterStateUpdated(function ($state, callable $set) {
                                $set('slug', Str::slug($state));
                            })
                            ->placeholder('contoh: Batik Trusmi Sari')
                            ->helperText('Nama resmi usaha Anda'),

                        TextInput::make('slug')
                            ->label('Slug (URL)')
                            ->required()
                            ->maxLength(255)
                            ->unique(ignoreRecord: true)
                            ->helperText('Otomatis diisi dari nama usaha, tapi bisa diubah')
                            ->placeholder('contoh: batik-trusmi-sari'),

                        Select::make('category_id')
                            ->label('Kategori Usaha')
                            ->relationship('category', 'name')
                            ->searchable()
                            ->preload()
                            ->required()
                            ->helperText('Pilih kategori yang sesuai dengan jenis usaha Anda'),

                        Select::make('business_type')
                            ->label('Skala Usaha')
                            ->options([
                                'mikro' => 'Mikro (Omzet < 300 juta/tahun)',
                                'kecil' => 'Kecil (Omzet 300 juta - 2,5 miliar/tahun)',
                                'menengah' => 'Menengah (Omzet 2,5 - 50 miliar/tahun)',
                            ])
                            ->required()
                            ->default('mikro')
                            ->helperText('Sesuai definisi UU No. 20 Tahun 2008')
                            ->live()
                            ->native(false),

                        Textarea::make('description')
                            ->label('Deskripsi Usaha')
                            ->rows(4)
                            ->columnSpanFull()
                            ->placeholder('Jelaskan produk, keunggulan, dan keunikan usaha Anda...')
                            ->helperText('Deskripsi ini akan ditampilkan di profil publik UMKM Anda'),

                        DatePicker::make('established_year')
                            ->label('Tahun Berdiri')
                            ->displayFormat('Y')
                            ->format('Y')
                            ->maxDate(now())
                            ->placeholder('2020')
                            ->helperText('Tahun usaha didirikan'),
                    ])
                    ->columns(2),

                // === OWNER INFORMATION ===
                Section::make('Informasi Pemilik')
                    ->description('Data pemilik usaha')
                    ->schema([
                        Select::make('owner_id')
                            ->label('Pemilik')
                            ->relationship('owner', 'name')
                            ->getOptionLabelFromRecordUsing(fn ($record) => "{$record->name} ({$record->email})")
                            ->searchable(['name', 'email', 'phone'])
                            ->preload()
                            ->required()
                            ->default(Auth::id())
                            ->helperText('Pilih pemilik UMKM. Data nama, NIK, email, dan telepon diambil dari profil user.')
                            ->columnSpanFull(),
                    ]),

                // === ADDRESS INFORMATION ===
                Section::make('Alamat Usaha')
                    ->description('Lokasi dan alamat lengkap usaha')
                    ->schema([
                        Textarea::make('address')
                            ->label('Alamat Lengkap')
                            ->required()
                            ->rows(3)
                            ->columnSpanFull()
                            ->placeholder('Jl. Sunan Gunung Jati No. 123, RT/RW 01/02')
                            ->helperText('Alamat detail termasuk nomor rumah/bangunan'),

                        TextInput::make('village')
                            ->label('Kelurahan/Desa')
                            ->required()
                            ->placeholder('Kejaksan'),

                        TextInput::make('district')
                            ->label('Kecamatan')
                            ->required()
                            ->placeholder('Kejaksan'),

                        TextInput::make('city')
                            ->label('Kota/Kabupaten')
                            ->required()
                            ->default('Cirebon')
                            ->placeholder('Cirebon'),

                        TextInput::make('province')
                            ->label('Provinsi')
                            ->required()
                            ->default('Jawa Barat')
                            ->placeholder('Jawa Barat'),

                        TextInput::make('postal_code')
                            ->label('Kode Pos')
                            ->numeric()
                            ->length(5)
                            ->placeholder('45123'),
                    ])
                    ->columns(3),

                // === BUSINESS DETAILS ===
                Section::make('Detail Usaha')
                    ->description('Informasi tambahan tentang usaha')
                    ->schema([
                        TextInput::make('employee_count')
                            ->label('Jumlah Karyawan')
                            ->required()
                            ->numeric()
                            ->default(1)
                            ->minValue(0)
                            ->placeholder('5')
                            ->helperText('Termasuk pemilik dan keluarga yang membantu'),

                        TextInput::make('monthly_revenue')
                            ->label('Omzet Bulanan (estimasi)')
                            ->numeric()
                            ->prefix('Rp')
                            ->placeholder('10000000')
                            ->helperText(fn ($get) => match ($get('business_type')) {
                                'mikro' => 'Untuk skala mikro: < Rp 25 juta/bulan',
                                'kecil' => 'Untuk skala kecil: Rp 25 juta - 208 juta/bulan',
                                'menengah' => 'Untuk skala menengah: Rp 208 juta - 4,16 miliar/bulan',
                                default => 'Rata-rata pendapatan per bulan',
                            }),

                        TextInput::make('capital')
                            ->label('Modal Usaha')
                            ->numeric()
                            ->prefix('Rp')
                            ->placeholder('50000000')
                            ->helperText('Modal awal atau modal kerja saat ini'),
                    ])
                    ->columns(3),

                // === LEGAL DOCUMENTS ===
                Section::make('Dokumen Legal')
                    ->description('Izin dan sertifikasi usaha')
                    ->schema([
                        TextInput::make('nib')
                            ->label('NIB (Nomor Induk Berusaha)')
                            ->numeric()
                            ->length(13)
                            ->placeholder('1234567890123')
                            ->helperText('Jika sudah memiliki NIB dari OSS (13 digit)')
                            ->rules(['nullable', 'digits:13']),

                        Toggle::make('has_pirt')
                            ->label('Memiliki PIRT')
                            ->helperText('Pangan Industri Rumah Tangga (wajib untuk usaha makanan/minuman)')
                            ->default(false)
                            ->inline(false)
                            ->live(),

                        Toggle::make('has_halal_certificate')
                            ->label('Memiliki Sertifikat Halal')
                            ->helperText('Sertifikat halal dari MUI atau lembaga berwenang')
                            ->default(false)
                            ->inline(false),
                    ])
                    ->columns(3),

                // === ONLINE PRESENCE ===
                Section::make('Media Sosial & Online')
                    ->description('Keberadaan usaha di media sosial dan website')
                    ->schema([
                        TextInput::make('website')
                            ->label('Marketplace Link')
                            ->url()
                            ->placeholder('https://shopee.co.id/toko-anda atau https://tokopedia.com/toko-anda')
                            ->helperText('Link marketplace / website usaha (jika ada)'),

                        TextInput::make('whatsapp')
                            ->label('WhatsApp Business')
                            ->tel()
                            ->placeholder('6281234567890')
                            ->helperText('Format: 628xxx (tanpa tanda +)')
                            ->rules(['nullable', 'regex:/^628[0-9]{8,12}$/']),

                        TextInput::make('instagram')
                            ->label('Instagram')
                            ->placeholder('batiktrusmi')
                            ->helperText('Username Instagram (tanpa @)')
                            ->prefix('@')
                            ->rules(['nullable', 'regex:/^[a-zA-Z0-9._]+$/']),

                        TextInput::make('facebook')
                            ->label('Facebook')
                            ->placeholder('BatikTrusmiOfficial')
                            ->helperText('Username atau nama halaman Facebook')
                            ->rules(['nullable', 'regex:/^[a-zA-Z0-9.]+$/']),

                        TextInput::make('tiktok')
                            ->label('TikTok')
                            ->placeholder('batiktrusmi')
                            ->helperText('Username TikTok (tanpa @)')
                            ->prefix('@')
                            ->rules(['nullable', 'regex:/^[a-zA-Z0-9._]+$/']),
                    ])
                    ->columns(2),

                // === MEDIA UPLOADS ===
                Section::make('Foto & Logo')
                    ->description('Unggah logo dan foto usaha Anda')
                    ->schema([
                        FileUpload::make('logo')
                            ->label('Logo Usaha')
                            ->disk('public')
                            ->directory('umkms/logos')
                            ->image()
                            ->maxSize(2048) // 2MB
                            ->imageEditor()
                            ->imageEditorAspectRatios([
                                '1:1',
                            ])
                            ->helperText('Logo persegi (1:1). Maksimal 2MB. Format: JPG, PNG')
                            ->columnSpanFull(),

                        FileUpload::make('photos')
                            ->label('Foto Usaha')
                            ->disk('public')
                            ->directory('umkms/photos')
                            ->image()
                            ->multiple()
                            ->maxFiles(10)
                            ->maxSize(5120) // 5MB
                            ->imageEditor()
                            ->reorderable()
                            ->helperText('Foto produk, tempat usaha, atau proses produksi. Maksimal 10 foto, 5MB per foto')
                            ->columnSpanFull(),
                    ]),

                Section::make('Lokasi di Peta')
                    ->description('Tandai lokasi usaha Anda di peta')
                    ->schema([
                        TextInput::make('address_search')
                            ->label('Cari Alamat')
                            ->placeholder('Contoh: Jl. Sunan Gunung Jati, Cirebon')
                            ->helperText('Mulai ketik untuk rekomendasi (OpenStreetMap), lalu pilih. Klik di luar kotak untuk set lokasi otomatis.')
                            ->live()
                            ->extraInputAttributes([
                                'id' => 'umkm-address-search',
                                'list' => 'umkm-address-suggestions',
                                'autocomplete' => 'off',
                                'onkeydown' => 'if(event.key === "Enter") { event.preventDefault(); this.blur(); }',
                                'x-data' => '{}',
                                'x-init' => <<<'JS'
(() => {
  const input = $el;
  const listId = input.getAttribute('list');
  if (!listId) return;

  let list = document.getElementById(listId);
  if (!list) {
    list = document.createElement('datalist');
    list.id = listId;
    input.parentElement?.appendChild(list);
  }

  let lastController = null;
  let lastQuery = '';
  let debounce = null;

  const clearOptions = () => {
    while (list.firstChild) list.removeChild(list.firstChild);
  };

  const setOptions = (items) => {
    clearOptions();
    for (const item of items) {
      const opt = document.createElement('option');
      opt.value = item.display_name;
      opt.dataset.lat = item.lat;
      opt.dataset.lon = item.lon;
      list.appendChild(opt);
    }
  };

  const fetchSuggestions = async (q) => {
    if (!q || q.length < 3) {
      clearOptions();
      return;
    }

    if (q === lastQuery) return;
    lastQuery = q;

    if (lastController) lastController.abort();
    lastController = new AbortController();

    const url = `/_internal/geocode/nominatim?q=${encodeURIComponent(q)}`;
    const res = await fetch(url, { signal: lastController.signal });
    if (!res.ok) {
      clearOptions();
      return;
    }

    const data = await res.json();
    setOptions(Array.isArray(data) ? data : []);
  };

  input.addEventListener('input', () => {
    const q = input.value.trim();
    window.clearTimeout(debounce);
    debounce = window.setTimeout(() => {
      fetchSuggestions(q).catch(() => {});
    }, 250);
  });
})();
JS,
                            ])
                            ->afterStateUpdated(function ($state, callable $set, $livewire) {
                                if (empty($state)) {
                                    return;
                                }

                                // Use Nominatim API (OpenStreetMap) to geocode the address
                                try {
                                    $query = urlencode($state.' Cirebon, Indonesia');
                                    $url = "https://nominatim.openstreetmap.org/search?q={$query}&format=json&limit=1&countrycodes=id";

                                    $ch = curl_init();
                                    curl_setopt($ch, CURLOPT_URL, $url);
                                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                                    curl_setopt($ch, CURLOPT_USERAGENT, 'FilamentMapPicker/1.0');
                                    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
                                    $response = curl_exec($ch);
                                    curl_close($ch);

                                    $results = json_decode($response, true);

                                    if (! empty($results) && isset($results[0]['lat'], $results[0]['lon'])) {
                                        $lat = (float) $results[0]['lat'];
                                        $lng = (float) $results[0]['lon'];

                                        // Update the location fields
                                        $set('location', ['lat' => $lat, 'lng' => $lng]);
                                        $set('latitude', $lat);
                                        $set('longitude', $lng);

                                        // Trigger map refresh
                                        $livewire->dispatch('refreshMap');

                                        \Filament\Notifications\Notification::make()
                                            ->success()
                                            ->title('Lokasi Ditemukan')
                                            ->body("Alamat: {$results[0]['display_name']}")
                                            ->send();
                                    } else {
                                        \Filament\Notifications\Notification::make()
                                            ->warning()
                                            ->title('Lokasi Tidak Ditemukan')
                                            ->body('Coba gunakan alamat yang lebih spesifik atau tandai langsung di peta.')
                                            ->send();
                                    }
                                } catch (\Exception $e) {
                                    \Filament\Notifications\Notification::make()
                                        ->danger()
                                        ->title('Error')
                                        ->body('Gagal mencari lokasi. Silakan coba lagi.')
                                        ->send();
                                }
                            })
                            ->dehydrated(false)
                            ->columnSpanFull(),

                        \Dotswan\MapPicker\Fields\Map::make('location')
                            ->label('Lokasi')
                            ->defaultLocation(latitude: -6.7063, longitude: 108.5571) // Cirebon center
                            ->draggable(true)
                            ->clickable(true)
                            ->showMarker(true)
                            ->zoom(13)
                            ->showFullscreenControl(true)
                            ->showZoomControl(true)
                            ->tilesUrl('https://tile.openstreetmap.org/{z}/{x}/{y}.png')
                            ->afterStateUpdated(function (Set $set, ?array $state): void {
                                $set('latitude', $state['lat'] ?? null);
                                $set('longitude', $state['lng'] ?? null);
                            })
                            ->afterStateHydrated(function ($state, $record, Set $set): void {
                                $set('location', [
                                    'lat' => $record?->latitude,
                                    'lng' => $record?->longitude,
                                ]);
                            })
                            ->extraStyles([
                                'min-height: 50vh',
                                'z-index: 1',
                            ])
                            ->helperText('Klik pada peta untuk menandai lokasi usaha Anda, atau gunakan pencarian alamat di atas')
                            ->columnSpanFull(),
                    ]),

                // Hidden fields for latitude/longitude (will be used with map picker)
                Hidden::make('latitude'),
                Hidden::make('longitude'),

                // === ADMIN-ONLY FIELDS ===
                ...($isAdmin ? [
                    Section::make('Status & Verifikasi (Admin)')
                        ->description('Hanya dapat diubah oleh admin')
                        ->schema([
                            Select::make('status')
                                ->label('Status')
                                ->options([
                                    'draft' => '📝 Draft (Belum Diverifikasi)',
                                    'pending' => '⏳ Pending (Menunggu Verifikasi)',
                                    'active' => '✅ Active (Terverifikasi)',
                                    'inactive' => '❌ Inactive (Tidak Aktif)',
                                ])
                                ->required()
                                ->default('draft')
                                ->helperText('Status verifikasi UMKM')
                                ->native(false)
                                ->live(),

                            Textarea::make('rejection_reason')
                                ->label('Alasan Penolakan')
                                ->rows(3)
                                ->visible(fn ($get) => $get('status') === 'inactive')
                                ->placeholder('Jelaskan alasan jika status inactive')
                                ->columnSpanFull(),

                            Toggle::make('is_published')
                                ->label('Publish ke Katalog Publik')
                                ->helperText('Tampilkan UMKM ini di katalog publik')
                                ->default(false)
                                ->inline(false),
                        ])
                        ->columns(2)
                        ->collapsed(),
                ] : [
                    // For non-admin users, set sensible defaults
                    Hidden::make('status')->default('draft'),
                    Hidden::make('is_published')->default(false),
                ]),
            ]);
    }
}
