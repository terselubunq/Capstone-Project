<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Document>
 */
class DocumentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $fileName = fake()->uuid().'.pdf';

        return [
            'documentable_type' => \App\Models\Umkm::class,
            'documentable_id' => \App\Models\Umkm::factory(),
            'title' => fake()->sentence(3),
            'description' => fake()->optional()->sentence(),
            'type' => fake()->randomElement(['ktp', 'npwp', 'nib', 'siup', 'halal', 'pirt', 'certificate', 'report', 'other']),
            'file_path' => 'documents/'.$fileName,
            'file_name' => $fileName,
            'file_type' => fake()->randomElement(['application/pdf', 'image/jpeg', 'image/png']),
            'file_size' => fake()->numberBetween(100000, 5000000),
            'uploaded_by' => null,
        ];
    }

    public function forUmkm(\App\Models\Umkm $umkm): static
    {
        return $this->state(fn (array $attributes) => [
            'documentable_type' => \App\Models\Umkm::class,
            'documentable_id' => $umkm->id,
        ]);
    }
}
