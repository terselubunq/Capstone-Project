<?php

use App\Models\Document;
use App\Models\Role;
use App\Models\Umkm;
use App\Models\User;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

use function Pest\Laravel\actingAs;

beforeEach(function () {
    Storage::fake('public');
    $this->seed(\Database\Seeders\CategorySeeder::class);
});

it('automatically fills file metadata when uploading a document', function () {
    // Arrange
    $user = User::factory()->create();
    $umkmOwnerRole = Role::firstOrCreate(['slug' => 'umkm-owner'], ['name' => 'UMKM Owner']);
    $user->roles()->attach($umkmOwnerRole->id);

    $umkm = Umkm::factory()->create(['owner_id' => $user->id]);
    $file = UploadedFile::fake()->create('test-document.pdf', 1024); // 1MB PDF

    // Act
    actingAs($user);

    $filePath = $file->store('documents', 'public');

    $document = Document::create([
        'documentable_type' => 'App\\Models\\Umkm',
        'documentable_id' => $umkm->id,
        'title' => 'Test Document',
        'type' => 'certificate',
        'description' => 'Test description',
        'file_path' => $filePath,
        'file_name' => $file->getClientOriginalName(),
        'file_type' => $file->getMimeType(),
        'file_size' => $file->getSize(),
        'uploaded_by' => $user->id,
    ]);

    // Assert
    expect($document)->toBeInstanceOf(Document::class)
        ->and($document->file_name)->toBe('test-document.pdf')
        ->and($document->file_type)->toBe('application/pdf')
        ->and($document->file_size)->toBeGreaterThan(0)
        ->and($document->uploaded_by)->toBe($user->id)
        ->and($document->documentable_type)->toBe('App\\Models\\Umkm')
        ->and($document->documentable_id)->toBe($umkm->id);

    Storage::disk('public')->assertExists($filePath);
});

it('associates document with correct UMKM', function () {
    // Arrange
    $user = User::factory()->create();
    $umkmOwnerRole = Role::firstOrCreate(['slug' => 'umkm-owner'], ['name' => 'UMKM Owner']);
    $user->roles()->attach($umkmOwnerRole->id);

    $umkm = Umkm::factory()->create(['owner_id' => $user->id]);
    $file = UploadedFile::fake()->create('certificate.pdf', 500);

    // Act
    actingAs($user);

    $document = Document::create([
        'documentable_type' => 'App\\Models\\Umkm',
        'documentable_id' => $umkm->id,
        'title' => 'Halal Certificate',
        'type' => 'halal',
        'file_path' => $file->store('documents', 'public'),
        'file_name' => $file->getClientOriginalName(),
        'file_type' => $file->getMimeType(),
        'file_size' => $file->getSize(),
        'uploaded_by' => $user->id,
    ]);

    // Assert
    expect($document->documentable)->toBeInstanceOf(Umkm::class)
        ->and($document->documentable->id)->toBe($umkm->id)
        ->and($document->documentable->business_name)->toBe($umkm->business_name);
});

it('tracks who uploaded the document', function () {
    // Arrange
    $user = User::factory()->create();
    $umkmOwnerRole = Role::firstOrCreate(['slug' => 'umkm-owner'], ['name' => 'UMKM Owner']);
    $user->roles()->attach($umkmOwnerRole->id);

    $umkm = Umkm::factory()->create(['owner_id' => $user->id]);
    $file = UploadedFile::fake()->create('license.pdf', 750);

    // Act
    actingAs($user);

    $document = Document::create([
        'documentable_type' => 'App\\Models\\Umkm',
        'documentable_id' => $umkm->id,
        'title' => 'Business License',
        'type' => 'license',
        'file_path' => $file->store('documents', 'public'),
        'file_name' => $file->getClientOriginalName(),
        'file_type' => $file->getMimeType(),
        'file_size' => $file->getSize(),
        'uploaded_by' => $user->id,
    ]);

    // Assert
    expect($document->uploadedBy)->toBeInstanceOf(User::class)
        ->and($document->uploadedBy->id)->toBe($user->id)
        ->and($document->uploadedBy->name)->toBe($user->name);
});

it('supports various document types', function (string $type, string $label) {
    // Arrange
    $user = User::factory()->create();
    $umkmOwnerRole = Role::firstOrCreate(['slug' => 'umkm-owner'], ['name' => 'UMKM Owner']);
    $user->roles()->attach($umkmOwnerRole->id);

    $umkm = Umkm::factory()->create(['owner_id' => $user->id]);
    $file = UploadedFile::fake()->create("document-{$type}.pdf", 500);

    // Act
    actingAs($user);

    $document = Document::create([
        'documentable_type' => 'App\\Models\\Umkm',
        'documentable_id' => $umkm->id,
        'title' => $label,
        'type' => $type,
        'file_path' => $file->store('documents', 'public'),
        'file_name' => $file->getClientOriginalName(),
        'file_type' => $file->getMimeType(),
        'file_size' => $file->getSize(),
        'uploaded_by' => $user->id,
    ]);

    // Assert
    expect($document->type)->toBe($type);
})->with([
    ['nik', 'NIK Document'],
    ['nib', 'NIB Certificate'],
    ['pirt', 'PIRT Certificate'],
    ['halal', 'Halal Certificate'],
    ['npwp', 'NPWP Document'],
    ['legal', 'Legal Document'],
    ['license', 'Business License'],
    ['certificate', 'General Certificate'],
    ['other', 'Other Document'],
]);
