<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\MentoringSession>
 */
class MentoringSessionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $scheduledAt = fake()->dateTimeBetween('-3 months', '+3 months');
        $status = fake()->randomElement(['scheduled', 'ongoing', 'completed', 'cancelled', 'rescheduled']);

        return [
            'mentoring_id' => \App\Models\Mentoring::factory(),
            'title' => fake()->sentence(5),
            'agenda' => fake()->paragraphs(2, true),
            'scheduled_at' => $scheduledAt,
            'duration_minutes' => fake()->randomElement([60, 90, 120, 180]),
            'location' => fake()->optional()->address(),
            'meeting_link' => fake()->optional()->url(),
            'materials' => fake()->optional()->paragraphs(3, true),
            'notes' => fake()->optional()->paragraph(),
            'attachments' => fake()->optional()->randomElements([
                fake()->url(),
                fake()->url(),
            ]),
            'status' => $status,
            'started_at' => $status === 'completed' ? fake()->dateTime() : null,
            'completed_at' => $status === 'completed' ? fake()->dateTime() : null,
            'evaluation' => $status === 'completed' ? fake()->paragraph() : null,
        ];
    }

    public function completed(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'completed',
            'scheduled_at' => fake()->dateTimeBetween('-3 months', 'now'),
            'started_at' => fake()->dateTimeBetween('-3 months', 'now'),
            'completed_at' => fake()->dateTimeBetween('-3 months', 'now'),
            'evaluation' => fake()->paragraph(),
        ]);
    }

    public function upcoming(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'scheduled',
            'scheduled_at' => fake()->dateTimeBetween('now', '+3 months'),
            'started_at' => null,
            'completed_at' => null,
            'evaluation' => null,
        ]);
    }
}
