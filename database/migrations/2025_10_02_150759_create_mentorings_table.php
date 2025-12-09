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
        Schema::create('mentorings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('umkm_id')->constrained()->cascadeOnDelete();
            $table->foreignId('mentor_id')->constrained('users')->cascadeOnDelete();
            $table->string('program_name');
            $table->text('description')->nullable();
            $table->text('objectives')->nullable();
            $table->enum('type', ['financial', 'marketing', 'production', 'management', 'technology', 'legal', 'other'])->default('management');
            $table->date('start_date');
            $table->date('end_date');
            $table->enum('status', ['scheduled', 'ongoing', 'completed', 'cancelled'])->default('scheduled');
            $table->text('notes')->nullable();
            $table->timestamps();

            $table->index(['umkm_id', 'status']);
            $table->index(['mentor_id', 'status']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mentorings');
    }
};
