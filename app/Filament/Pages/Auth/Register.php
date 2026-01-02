<?php

namespace App\Filament\Pages\Auth;

use App\Models\Role;
use Filament\Auth\Pages\Register as BaseRegister;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Component;
use Filament\Schemas\Schema;

class Register extends BaseRegister
{
    public function getHeading(): string
    {
        return 'Daftarkan UMKM Anda!';
    }

    public function getSubheading(): ?string
    {
        return 'Isi formulir di bawah untuk mendaftarkan usaha Anda';
    }

    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                $this->getNameFormComponent(),
                $this->getEmailFormComponent(),
                TextInput::make('phone')
                    ->label('Nomor Telepon')
                    ->tel()
                    ->maxLength(20)
                    ->placeholder('08123456789'),
                Textarea::make('address')
                    ->label('Alamat')
                    ->rows(3)
                    ->maxLength(500)
                    ->placeholder('Alamat lengkap Anda'),
                $this->getPasswordFormComponent(),
                $this->getPasswordConfirmationFormComponent(),
            ]);
    }

    protected function handleRegistration(array $data): \Illuminate\Database\Eloquent\Model
    {
        // Create user
        $user = $this->getUserModel()::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => $data['password'], // Already hashed by form component
        ]);

        // Assign umkm-owner role
        $umkmOwnerRole = Role::where('slug', 'umkm-owner')->first();
        if ($umkmOwnerRole) {
            $user->roles()->attach($umkmOwnerRole->id);
        }

        return $user;
    }

    protected function getNameFormComponent(): Component
    {
        return parent::getNameFormComponent()
            ->label('Nama Lengkap')
            ->placeholder('Masukkan nama lengkap Anda');
    }

    protected function getEmailFormComponent(): Component
    {
        return parent::getEmailFormComponent()
            ->label('Email')
            ->placeholder('email@example.com');
    }

    protected function getPasswordFormComponent(): Component
    {
        return parent::getPasswordFormComponent()
            ->label('Password')
            ->placeholder('Minimal 8 karakter')
            ->revealable();
    }

    protected function getPasswordConfirmationFormComponent(): Component
    {
        return parent::getPasswordConfirmationFormComponent()
            ->label('Konfirmasi Password')
            ->placeholder('Ulangi password')
            ->revealable();
    }

    protected function getFormActions(): array
    {
        return [
            $this->getRegisterFormAction()
                ->label('Daftar'),
        ];
    }

    /**
     * Get the URL to redirect to after registration.
     * This ensures users are redirected to the UMKM Owner panel.
     */
    protected function getRegisteredRedirectUrl(): string
    {
        return '/umkm-owner';
    }
}
