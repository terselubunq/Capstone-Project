<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('umkms', function (Blueprint $table) {
            // Drop the old fulltext index first (PostgreSQL specific)
            if (config('database.default') === 'pgsql') {
                DB::statement('DROP INDEX IF EXISTS umkms_business_name_owner_name_description_fulltext');
            }

            // Remove the old owner information columns
            $table->dropColumn(['owner_name', 'nik', 'email', 'phone']);

            // Recreate fulltext index without owner_name
            if (config('database.default') !== 'sqlite') {
                $table->fullText(['business_name', 'description']);
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('umkms', function (Blueprint $table) {
            // Drop the new fulltext index
            if (config('database.default') === 'pgsql') {
                DB::statement('DROP INDEX IF EXISTS umkms_business_name_description_fulltext');
            }

            // Re-add the columns
            $table->string('owner_name')->after('slug');
            $table->string('nik', 16)->unique()->nullable()->after('owner_name');
            $table->string('email')->nullable()->after('nik');
            $table->string('phone', 20)->after('email');

            // Recreate old fulltext index
            if (config('database.default') !== 'sqlite') {
                $table->fullText(['business_name', 'owner_name', 'description']);
            }
        });
    }
};
