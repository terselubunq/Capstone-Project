<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('mentoring_sessions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('mentoring_id')->constrained()->cascadeOnDelete();
            $table->string('title');
            $table->text('agenda')->nullable();
            $table->dateTime('scheduled_at');
            $table->integer('duration_minutes')->default(60);
            $table->string('location')->nullable();
            $table->string('meeting_link')->nullable();
            $table->text('materials')->nullable();
            $table->text('notes')->nullable();
            $table->json('attachments')->nullable();
            $table->enum('status', ['scheduled', 'ongoing', 'completed', 'cancelled', 'rescheduled'])->default('scheduled');
            $table->timestamp('started_at')->nullable();
            $table->timestamp('completed_at')->nullable();
            $table->text('evaluation')->nullable();
            $table->timestamps();

            $table->index(['mentoring_id', 'status']);
            $table->index('scheduled_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mentoring_sessions');
    }
};
