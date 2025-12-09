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
        Schema::create('umkms', function (Blueprint $table) {
            $table->id();
            $table->string('business_name');
            $table->string('slug')->unique();
            $table->string('owner_name');
            $table->string('nik', 16)->unique()->nullable();
            $table->string('email')->nullable();
            $table->string('phone', 20);
            $table->text('address');
            $table->string('village');
            $table->string('district');
            $table->string('city')->default('Cirebon');
            $table->string('province')->default('Jawa Barat');
            $table->string('postal_code', 5)->nullable();
            $table->foreignId('category_id')->constrained()->cascadeOnDelete();
            $table->enum('business_type', ['mikro', 'kecil', 'menengah'])->default('mikro');
            $table->text('description')->nullable();
            $table->year('established_year')->nullable();
            $table->integer('employee_count')->default(0);
            $table->decimal('monthly_revenue', 15, 2)->nullable();
            $table->decimal('capital', 15, 2)->nullable();
            $table->string('nib')->nullable()->comment('Nomor Induk Berusaha');
            $table->boolean('has_halal_certificate')->default(false);
            $table->boolean('has_pirt')->default(false)->comment('Pangan Industri Rumah Tangga');
            $table->string('website')->nullable();
            $table->string('facebook')->nullable();
            $table->string('instagram')->nullable();
            $table->string('tiktok')->nullable();
            $table->string('whatsapp')->nullable();
            $table->decimal('latitude', 10, 8)->nullable();
            $table->decimal('longitude', 11, 8)->nullable();
            $table->string('logo')->nullable();
            $table->json('photos')->nullable();
            $table->enum('status', ['draft', 'pending', 'active', 'inactive', 'rejected'])->default('draft');
            $table->text('rejection_reason')->nullable();
            $table->timestamp('verified_at')->nullable();
            $table->foreignId('verified_by')->nullable()->constrained('users')->nullOnDelete();
            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();
            $table->boolean('is_published')->default(false);
            $table->timestamps();
            $table->softDeletes();

            $table->index(['status', 'is_published']);
            $table->index(['category_id', 'business_type']);

            // Only add fulltext index for databases that support it
            if (config('database.default') !== 'sqlite') {
                $table->fullText(['business_name', 'owner_name', 'description']);
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('umkms');
    }
};
