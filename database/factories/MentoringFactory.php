<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Mentoring>
 */
class MentoringFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $startDate = fake()->dateTimeBetween('-6 months', '+3 months');
        $endDate = fake()->dateTimeBetween($startDate, '+6 months');

        return [
            'umkm_id' => \App\Models\Umkm::factory(),
            'mentor_id' => \App\Models\User::factory(),
            'program_name' => fake()->sentence(4),
            'description' => fake()->paragraphs(2, true),
            'objectives' => fake()->paragraphs(3, true),
            'type' => fake()->randomElement(['financial', 'marketing', 'production', 'management', 'technology', 'legal', 'other']),
            'start_date' => $startDate,
            'end_date' => $endDate,
            'status' => fake()->randomElement(['scheduled', 'ongoing', 'completed', 'cancelled']),
            'notes' => fake()->optional()->paragraph(),
        ];
    }

    public function ongoing(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'ongoing',
            'start_date' => fake()->dateTimeBetween('-3 months', 'now'),
            'end_date' => fake()->dateTimeBetween('now', '+3 months'),
        ]);
    }

    public function completed(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'completed',
            'start_date' => fake()->dateTimeBetween('-1 year', '-3 months'),
            'end_date' => fake()->dateTimeBetween('-3 months', 'now'),
        ]);
    }
}
