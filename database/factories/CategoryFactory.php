<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Category>
 */
class CategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = fake()->unique()->randomElement([
            'Kuliner',
            'Fashion',
            'Kerajinan',
            'Pertanian',
            'Jasa',
            'Teknologi',
            'Perdagangan',
            'Industri',
        ]);

        return [
            'name' => $name,
            'slug' => \Illuminate\Support\Str::slug($name),
            'description' => fake()->sentence(),
            'parent_id' => null,
        ];
    }
}
