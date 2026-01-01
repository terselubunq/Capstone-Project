-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 29, 2025 at 06:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ailsya3`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4', 'i:1;', 1767019528),
('laravel_cache_ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4:timer', 'i:1767019528;', 1767019528);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Kuliner', 'kuliner', 'Usaha makanan dan minuman', NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(2, 'Makanan Ringan', 'makanan-ringan', NULL, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(3, 'Makanan Berat', 'makanan-berat', NULL, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(4, 'Minuman', 'minuman', NULL, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(5, 'Kue dan Roti', 'kue-dan-roti', NULL, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(6, 'Fashion', 'fashion', 'Usaha pakaian dan aksesoris', NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(7, 'Pakaian', 'pakaian', NULL, 6, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(8, 'Aksesoris', 'aksesoris', NULL, 6, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(9, 'Tas dan Sepatu', 'tas-dan-sepatu', NULL, 6, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(10, 'Kerajinan', 'kerajinan', 'Usaha kerajinan tangan', NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(11, 'Kerajinan Kayu', 'kerajinan-kayu', NULL, 10, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(12, 'Kerajinan Rotan', 'kerajinan-rotan', NULL, 10, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(13, 'Kerajinan Anyaman', 'kerajinan-anyaman', NULL, 10, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(14, 'Kerajinan Batik', 'kerajinan-batik', NULL, 10, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(15, 'Pertanian', 'pertanian', 'Usaha pertanian dan perkebunan', NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(16, 'Sayuran', 'sayuran', NULL, 15, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(17, 'Buah-buahan', 'buah-buahan', NULL, 15, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(18, 'Tanaman Hias', 'tanaman-hias', NULL, 15, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(19, 'Jasa', 'jasa', 'Usaha jasa dan layanan', NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(20, 'Jasa Konsultasi', 'jasa-konsultasi', NULL, 19, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(21, 'Jasa Desain', 'jasa-desain', NULL, 19, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(22, 'Jasa Event', 'jasa-event', NULL, 19, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(23, 'Teknologi', 'teknologi', 'Usaha berbasis teknologi', NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(24, 'Software Development', 'software-development', NULL, 23, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(25, 'Digital Marketing', 'digital-marketing', NULL, 23, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(26, 'E-Commerce', 'e-commerce', NULL, 23, '2025-12-20 09:41:52', '2025-12-20 09:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `documentable_type` varchar(255) NOT NULL,
  `documentable_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('ktp','npwp','nib','siup','halal','pirt','certificate','report','other') NOT NULL DEFAULT 'other',
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `uploaded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mentorings`
--

CREATE TABLE `mentorings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `umkm_id` bigint(20) UNSIGNED NOT NULL,
  `mentor_id` bigint(20) UNSIGNED NOT NULL,
  `program_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `objectives` text DEFAULT NULL,
  `type` enum('financial','marketing','production','management','technology','legal','other') NOT NULL DEFAULT 'management',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('scheduled','ongoing','completed','cancelled') NOT NULL DEFAULT 'scheduled',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mentorings`
--

INSERT INTO `mentorings` (`id`, `umkm_id`, `mentor_id`, `program_name`, `description`, `objectives`, `type`, `start_date`, `end_date`, `status`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 22, 'Branding & Packaging', 'Membangun brand identity yang kuat dan desain packaging yang menarik untuk meningkatkan perceived value produk di mata konsumen.', '1. Membangun brand identity yang konsisten\n2. Mendesain packaging yang menarik dan fungsional\n3. Menciptakan storytelling brand yang engaging\n4. Meningkatkan perceived value melalui branding', 'marketing', '2025-09-20', '2026-02-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(2, 2, 25, 'Teknologi untuk UMKM', 'Implementasi teknologi untuk meningkatkan efisiensi operasional, dari sistem POS, inventory management, hingga customer relationship management.', '1. Memilih teknologi yang tepat untuk bisnis\n2. Implementasi sistem POS dan inventory digital\n3. Memanfaatkan CRM untuk customer management\n4. Menggunakan analitik untuk business intelligence', 'technology', '2025-03-20', '2025-11-20', 'completed', 'Program telah selesai dilaksanakan dengan baik. UMKM menunjukkan peningkatan signifikan dalam penerapan materi.', '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(3, 3, 23, 'Ekspor & Sertifikasi Produk', 'Persiapan ekspor, proses sertifikasi Halal, PIRT, SNI, dan standar internasional lainnya untuk membuka peluang pasar yang lebih luas.', '1. Memahami regulasi dan persyaratan ekspor\n2. Mempersiapkan dokumentasi ekspor yang lengkap\n3. Mendapatkan sertifikasi produk (Halal, PIRT, SNI)\n4. Membuka akses ke pasar internasional', 'legal', '2025-08-20', '2025-09-20', 'completed', 'Program telah selesai dilaksanakan dengan baik. UMKM menunjukkan peningkatan signifikan dalam penerapan materi.', '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(4, 4, 21, 'Optimasi Proses Produksi', 'Tingkatkan efisiensi produksi, quality control, dan supply chain management untuk meningkatkan produktivitas dan mengurangi biaya operasional.', '1. Mengoptimalkan alur proses produksi\n2. Menerapkan quality control yang efektif\n3. Mengelola inventory dan supply chain\n4. Meningkatkan produktivitas tanpa mengurangi kualitas', 'production', '2025-04-20', '2025-10-20', 'completed', 'Program telah selesai dilaksanakan dengan baik. UMKM menunjukkan peningkatan signifikan dalam penerapan materi.', '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(5, 5, 4, 'Digital Marketing untuk UMKM', 'Kuasai strategi pemasaran digital, media sosial, dan e-commerce untuk meningkatkan jangkauan pasar dan penjualan produk Anda di era digital.', '1. Menguasai teknik pemasaran melalui media sosial\n2. Membangun brand awareness di platform digital\n3. Memanfaatkan marketplace untuk meningkatkan penjualan\n4. Menganalisis data untuk optimasi strategi pemasaran', 'marketing', '2025-10-20', '2026-03-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(6, 6, 22, 'Branding & Packaging', 'Membangun brand identity yang kuat dan desain packaging yang menarik untuk meningkatkan perceived value produk di mata konsumen.', '1. Membangun brand identity yang konsisten\n2. Mendesain packaging yang menarik dan fungsional\n3. Menciptakan storytelling brand yang engaging\n4. Meningkatkan perceived value melalui branding', 'marketing', '2025-10-20', '2026-02-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(7, 7, 23, 'Digital Marketing untuk UMKM', 'Kuasai strategi pemasaran digital, media sosial, dan e-commerce untuk meningkatkan jangkauan pasar dan penjualan produk Anda di era digital.', '1. Menguasai teknik pemasaran melalui media sosial\n2. Membangun brand awareness di platform digital\n3. Memanfaatkan marketplace untuk meningkatkan penjualan\n4. Menganalisis data untuk optimasi strategi pemasaran', 'marketing', '2025-11-20', '2026-01-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(8, 8, 25, 'Pengembangan Produk & Inovasi', 'Mengembangkan produk baru, meningkatkan kualitas produk existing, dan menciptakan inovasi yang sesuai dengan kebutuhan pasar.', '1. Melakukan riset pasar untuk pengembangan produk\n2. Menciptakan inovasi produk yang unik\n3. Meningkatkan kualitas dan daya saing produk\n4. Melakukan uji coba dan validasi produk baru', 'production', '2025-03-20', '2025-11-20', 'completed', 'Program telah selesai dilaksanakan dengan baik. UMKM menunjukkan peningkatan signifikan dalam penerapan materi.', '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(9, 9, 21, 'Ekspor & Sertifikasi Produk', 'Persiapan ekspor, proses sertifikasi Halal, PIRT, SNI, dan standar internasional lainnya untuk membuka peluang pasar yang lebih luas.', '1. Memahami regulasi dan persyaratan ekspor\n2. Mempersiapkan dokumentasi ekspor yang lengkap\n3. Mendapatkan sertifikasi produk (Halal, PIRT, SNI)\n4. Membuka akses ke pasar internasional', 'legal', '2025-10-20', '2026-01-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(10, 10, 21, 'Branding & Packaging', 'Membangun brand identity yang kuat dan desain packaging yang menarik untuk meningkatkan perceived value produk di mata konsumen.', '1. Membangun brand identity yang konsisten\n2. Mendesain packaging yang menarik dan fungsional\n3. Menciptakan storytelling brand yang engaging\n4. Meningkatkan perceived value melalui branding', 'marketing', '2025-05-20', '2025-10-20', 'completed', 'Program telah selesai dilaksanakan dengan baik. UMKM menunjukkan peningkatan signifikan dalam penerapan materi.', '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(11, 11, 21, 'Dasar-Dasar Kewirausahaan', 'Program untuk pemula yang baru memulai usaha. Pelajari fundamental bisnis, manajemen keuangan dasar, dan strategi pemasaran untuk mengembangkan UMKM Anda.', '1. Memahami konsep dasar kewirausahaan dan mindset bisnis\n2. Menguasai manajemen keuangan sederhana untuk UMKM\n3. Mempelajari strategi pemasaran dasar yang efektif\n4. Mengembangkan rencana bisnis yang terstruktur', 'management', '2025-09-20', '2026-02-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(12, 12, 24, 'Digital Marketing untuk UMKM', 'Kuasai strategi pemasaran digital, media sosial, dan e-commerce untuk meningkatkan jangkauan pasar dan penjualan produk Anda di era digital.', '1. Menguasai teknik pemasaran melalui media sosial\n2. Membangun brand awareness di platform digital\n3. Memanfaatkan marketplace untuk meningkatkan penjualan\n4. Menganalisis data untuk optimasi strategi pemasaran', 'marketing', '2025-10-20', '2026-02-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(13, 13, 24, 'Teknologi untuk UMKM', 'Implementasi teknologi untuk meningkatkan efisiensi operasional, dari sistem POS, inventory management, hingga customer relationship management.', '1. Memilih teknologi yang tepat untuk bisnis\n2. Implementasi sistem POS dan inventory digital\n3. Memanfaatkan CRM untuk customer management\n4. Menggunakan analitik untuk business intelligence', 'technology', '2025-11-20', '2026-01-20', 'cancelled', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(14, 14, 21, 'Ekspor & Sertifikasi Produk', 'Persiapan ekspor, proses sertifikasi Halal, PIRT, SNI, dan standar internasional lainnya untuk membuka peluang pasar yang lebih luas.', '1. Memahami regulasi dan persyaratan ekspor\n2. Mempersiapkan dokumentasi ekspor yang lengkap\n3. Mendapatkan sertifikasi produk (Halal, PIRT, SNI)\n4. Membuka akses ke pasar internasional', 'legal', '2026-01-17', '2026-04-20', 'scheduled', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(15, 15, 24, 'Teknologi untuk UMKM', 'Implementasi teknologi untuk meningkatkan efisiensi operasional, dari sistem POS, inventory management, hingga customer relationship management.', '1. Memilih teknologi yang tepat untuk bisnis\n2. Implementasi sistem POS dan inventory digital\n3. Memanfaatkan CRM untuk customer management\n4. Menggunakan analitik untuk business intelligence', 'technology', '2025-09-20', '2026-01-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(16, 16, 22, 'Pengembangan Produk & Inovasi', 'Mengembangkan produk baru, meningkatkan kualitas produk existing, dan menciptakan inovasi yang sesuai dengan kebutuhan pasar.', '1. Melakukan riset pasar untuk pengembangan produk\n2. Menciptakan inovasi produk yang unik\n3. Meningkatkan kualitas dan daya saing produk\n4. Melakukan uji coba dan validasi produk baru', 'production', '2025-10-20', '2026-02-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(17, 17, 25, 'Teknologi untuk UMKM', 'Implementasi teknologi untuk meningkatkan efisiensi operasional, dari sistem POS, inventory management, hingga customer relationship management.', '1. Memilih teknologi yang tepat untuk bisnis\n2. Implementasi sistem POS dan inventory digital\n3. Memanfaatkan CRM untuk customer management\n4. Menggunakan analitik untuk business intelligence', 'technology', '2024-12-20', '2025-10-20', 'completed', 'Program telah selesai dilaksanakan dengan baik. UMKM menunjukkan peningkatan signifikan dalam penerapan materi.', '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(18, 18, 24, 'Ekspor & Sertifikasi Produk', 'Persiapan ekspor, proses sertifikasi Halal, PIRT, SNI, dan standar internasional lainnya untuk membuka peluang pasar yang lebih luas.', '1. Memahami regulasi dan persyaratan ekspor\n2. Mempersiapkan dokumentasi ekspor yang lengkap\n3. Mendapatkan sertifikasi produk (Halal, PIRT, SNI)\n4. Membuka akses ke pasar internasional', 'legal', '2025-03-20', '2025-11-20', 'completed', 'Program telah selesai dilaksanakan dengan baik. UMKM menunjukkan peningkatan signifikan dalam penerapan materi.', '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(19, 19, 21, 'Digital Marketing untuk UMKM', 'Kuasai strategi pemasaran digital, media sosial, dan e-commerce untuk meningkatkan jangkauan pasar dan penjualan produk Anda di era digital.', '1. Menguasai teknik pemasaran melalui media sosial\n2. Membangun brand awareness di platform digital\n3. Memanfaatkan marketplace untuk meningkatkan penjualan\n4. Menganalisis data untuk optimasi strategi pemasaran', 'marketing', '2025-09-20', '2026-02-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(20, 20, 22, 'Branding & Packaging', 'Membangun brand identity yang kuat dan desain packaging yang menarik untuk meningkatkan perceived value produk di mata konsumen.', '1. Membangun brand identity yang konsisten\n2. Mendesain packaging yang menarik dan fungsional\n3. Menciptakan storytelling brand yang engaging\n4. Meningkatkan perceived value melalui branding', 'marketing', '2025-11-20', '2026-03-20', 'ongoing', NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mentoring_sessions`
--

CREATE TABLE `mentoring_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mentoring_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `agenda` text DEFAULT NULL,
  `scheduled_at` datetime NOT NULL,
  `duration_minutes` int(11) NOT NULL DEFAULT 60,
  `location` varchar(255) DEFAULT NULL,
  `meeting_link` varchar(255) DEFAULT NULL,
  `materials` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachments`)),
  `status` enum('scheduled','ongoing','completed','cancelled','rescheduled') NOT NULL DEFAULT 'scheduled',
  `started_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `evaluation` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mentoring_sessions`
--

INSERT INTO `mentoring_sessions` (`id`, `mentoring_id`, `title`, `agenda`, `scheduled_at`, `duration_minutes`, `location`, `meeting_link`, `materials`, `notes`, `attachments`, `status`, `started_at`, `completed_at`, `evaluation`, `created_at`, `updated_at`) VALUES
(1, 1, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2025-09-20 10:00:00', 150, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-09-20 03:00:00', '2025-09-20 05:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(2, 1, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-10-20 09:00:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-10-20 02:00:00', '2025-10-20 04:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(3, 1, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2025-11-19 15:00:00', 150, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-19 08:00:00', '2025-11-19 10:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(4, 1, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-12-19 12:00:00', 180, NULL, 'https://meet.google.com/06732578e8', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-19 05:00:00', '2025-12-19 08:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(5, 1, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2026-01-18 12:00:00', 180, NULL, 'https://meet.google.com/f95d3f4408', NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(6, 2, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-03-20 15:30:00', 180, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-03-20 08:30:00', '2025-03-20 11:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(7, 2, 'Review & Evaluasi Progress', '1. Review pencapaian target\n2. Diskusi kendala dan solusi\n3. Penyesuaian strategi jika diperlukan\n4. Penetapan action plan berikutnya', '2025-06-09 10:30:00', 90, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-06-09 03:30:00', '2025-06-09 05:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(8, 2, 'Closing Session & Action Plan', '1. Recap pembelajaran selama program\n2. Evaluasi pencapaian objectives\n3. Penyusunan action plan jangka panjang\n4. Certificate ceremony dan closing', '2025-08-29 14:30:00', 120, NULL, 'https://meet.google.com/2fc6fe0c2f', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-08-29 07:30:00', '2025-08-29 09:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(9, 3, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-08-20 14:30:00', 180, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-08-20 07:30:00', '2025-08-20 10:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(10, 3, 'Branding & Product Development', '1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk', '2025-08-27 14:00:00', 120, NULL, 'https://meet.google.com/babc52bded', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-08-27 07:00:00', '2025-08-27 09:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(11, 3, 'Branding & Product Development', '1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk', '2025-09-03 13:00:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/6e9749ab55', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-09-03 06:00:00', '2025-09-03 08:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(12, 3, 'Workshop Analisis SWOT Bisnis', '1. Pengenalan metode analisis SWOT\n2. Identifikasi kekuatan dan kelemahan internal\n3. Analisis peluang dan ancaman eksternal\n4. Penyusunan strategi berdasarkan hasil analisis', '2025-09-10 09:30:00', 150, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-09-10 02:30:00', '2025-09-10 05:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(13, 4, 'Branding & Product Development', '1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk', '2025-04-20 11:00:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-04-20 04:00:00', '2025-04-20 06:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(14, 4, 'Workshop Analisis SWOT Bisnis', '1. Pengenalan metode analisis SWOT\n2. Identifikasi kekuatan dan kelemahan internal\n3. Analisis peluang dan ancaman eksternal\n4. Penyusunan strategi berdasarkan hasil analisis', '2025-06-20 15:30:00', 150, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/3e77b8baac', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-06-20 08:30:00', '2025-06-20 11:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(15, 4, 'Branding & Product Development', '1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk', '2025-08-20 09:30:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/af2a469586', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-08-20 02:30:00', '2025-08-20 04:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(16, 5, 'Closing Session & Action Plan', '1. Recap pembelajaran selama program\n2. Evaluasi pencapaian objectives\n3. Penyusunan action plan jangka panjang\n4. Certificate ceremony dan closing', '2025-10-20 09:30:00', 120, NULL, 'https://meet.google.com/2ffab297b0', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-10-20 02:30:00', '2025-10-20 04:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(17, 5, 'Sesi Kick-off & Orientasi Program', '1. Perkenalan mentor dan peserta\n2. Overview program dan objectives\n3. Penetapan target dan milestone\n4. Q&A session', '2025-11-14 09:00:00', 120, NULL, 'https://meet.google.com/36718c09d7', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-14 02:00:00', '2025-11-14 04:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(18, 5, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-12-09 15:00:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/4a71700935', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-09 08:00:00', '2025-12-09 10:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(19, 5, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2026-01-03 12:00:00', 180, NULL, NULL, NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(20, 5, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2026-01-28 15:00:00', 180, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/4941864a8f', NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(21, 5, 'Closing Session & Action Plan', '1. Recap pembelajaran selama program\n2. Evaluasi pencapaian objectives\n3. Penyusunan action plan jangka panjang\n4. Certificate ceremony dan closing', '2026-02-22 14:30:00', 120, NULL, 'https://meet.google.com/7b3a46e6d8', NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(22, 6, 'Review & Evaluasi Progress', '1. Review pencapaian target\n2. Diskusi kendala dan solusi\n3. Penyesuaian strategi jika diperlukan\n4. Penetapan action plan berikutnya', '2025-10-20 14:00:00', 90, NULL, 'https://meet.google.com/5af91100b4', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-10-20 07:00:00', '2025-10-20 08:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(23, 6, 'Branding & Product Development', '1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk', '2025-11-13 10:30:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-13 03:30:00', '2025-11-13 05:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(24, 6, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2025-12-07 13:00:00', 150, NULL, 'https://meet.google.com/492956a351', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-07 06:00:00', '2025-12-07 08:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(25, 6, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2025-12-31 10:30:00', 150, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(26, 6, 'Review & Evaluasi Progress', '1. Review pencapaian target\n2. Diskusi kendala dan solusi\n3. Penyesuaian strategi jika diperlukan\n4. Penetapan action plan berikutnya', '2026-01-24 15:00:00', 90, NULL, NULL, NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(27, 7, 'Workshop Analisis SWOT Bisnis', '1. Pengenalan metode analisis SWOT\n2. Identifikasi kekuatan dan kelemahan internal\n3. Analisis peluang dan ancaman eksternal\n4. Penyusunan strategi berdasarkan hasil analisis', '2025-11-20 13:00:00', 150, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-20 06:00:00', '2025-11-20 08:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(28, 7, 'Branding & Product Development', '1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk', '2025-12-10 09:30:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/4272ce5403', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-10 02:30:00', '2025-12-10 04:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(29, 7, 'Sesi Kick-off & Orientasi Program', '1. Perkenalan mentor dan peserta\n2. Overview program dan objectives\n3. Penetapan target dan milestone\n4. Q&A session', '2025-12-30 15:00:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(30, 8, 'Branding & Product Development', '1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk', '2025-03-20 09:00:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-03-20 02:00:00', '2025-03-20 04:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(31, 8, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-06-09 11:00:00', 120, NULL, 'https://meet.google.com/79082230e9', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-06-09 04:00:00', '2025-06-09 06:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(32, 8, 'Closing Session & Action Plan', '1. Recap pembelajaran selama program\n2. Evaluasi pencapaian objectives\n3. Penyusunan action plan jangka panjang\n4. Certificate ceremony dan closing', '2025-08-29 15:00:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/c0bfcc63e2', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-08-29 08:00:00', '2025-08-29 10:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(33, 9, 'Workshop Analisis SWOT Bisnis', '1. Pengenalan metode analisis SWOT\n2. Identifikasi kekuatan dan kelemahan internal\n3. Analisis peluang dan ancaman eksternal\n4. Penyusunan strategi berdasarkan hasil analisis', '2025-10-20 15:00:00', 150, NULL, 'https://meet.google.com/466b07832b', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-10-20 08:00:00', '2025-10-20 10:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(34, 9, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-11-19 13:30:00', 180, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/1164326a76', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-19 06:30:00', '2025-11-19 09:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(35, 9, 'Sesi Kick-off & Orientasi Program', '1. Perkenalan mentor dan peserta\n2. Overview program dan objectives\n3. Penetapan target dan milestone\n4. Q&A session', '2025-12-19 11:30:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-19 04:30:00', '2025-12-19 06:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(36, 10, 'Branding & Product Development', '1. Membangun brand identity\n2. Riset pasar dan kompetitor\n3. Pengembangan unique value proposition\n4. Design thinking untuk inovasi produk', '2025-05-20 09:30:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-05-20 02:30:00', '2025-05-20 04:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(37, 10, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2025-06-27 12:30:00', 150, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-06-27 05:30:00', '2025-06-27 08:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(38, 10, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-08-04 09:00:00', 180, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-08-04 02:00:00', '2025-08-04 05:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(39, 10, 'Review & Evaluasi Progress', '1. Review pencapaian target\n2. Diskusi kendala dan solusi\n3. Penyesuaian strategi jika diperlukan\n4. Penetapan action plan berikutnya', '2025-09-11 13:30:00', 90, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/0ff594f7ce', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-09-11 06:30:00', '2025-09-11 08:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(40, 11, 'Closing Session & Action Plan', '1. Recap pembelajaran selama program\n2. Evaluasi pencapaian objectives\n3. Penyusunan action plan jangka panjang\n4. Certificate ceremony dan closing', '2025-09-20 15:00:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-09-20 08:00:00', '2025-09-20 10:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(41, 11, 'Workshop Analisis SWOT Bisnis', '1. Pengenalan metode analisis SWOT\n2. Identifikasi kekuatan dan kelemahan internal\n3. Analisis peluang dan ancaman eksternal\n4. Penyusunan strategi berdasarkan hasil analisis', '2025-10-20 13:00:00', 150, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/71d8acf479', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-10-20 06:00:00', '2025-10-20 08:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(42, 11, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-11-19 14:30:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/284ad2c0de', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-19 07:30:00', '2025-11-19 09:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(43, 11, 'Sesi Kick-off & Orientasi Program', '1. Perkenalan mentor dan peserta\n2. Overview program dan objectives\n3. Penetapan target dan milestone\n4. Q&A session', '2025-12-19 15:00:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-19 08:00:00', '2025-12-19 10:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(44, 11, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2026-01-18 10:30:00', 180, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(45, 12, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-10-20 12:30:00', 180, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-10-20 05:30:00', '2025-10-20 08:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(46, 12, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-11-19 11:30:00', 180, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/7afbf10549', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-19 04:30:00', '2025-11-19 07:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(47, 12, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2025-12-19 10:00:00', 150, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-19 03:00:00', '2025-12-19 05:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(48, 12, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2026-01-18 11:00:00', 150, NULL, 'https://meet.google.com/8a24baf681', NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(49, 15, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-09-20 12:30:00', 120, NULL, 'https://meet.google.com/2232880863', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-09-20 05:30:00', '2025-09-20 07:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(50, 15, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2025-10-30 14:30:00', 150, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/0b22a5ce16', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-10-30 07:30:00', '2025-10-30 10:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(51, 15, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-12-09 13:30:00', 120, NULL, 'https://meet.google.com/30af5a0f68', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-09 06:30:00', '2025-12-09 08:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(52, 16, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-10-20 13:00:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-10-20 06:00:00', '2025-10-20 08:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(53, 16, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2025-11-30 12:30:00', 150, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-30 05:30:00', '2025-11-30 08:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(54, 16, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2026-01-10 15:00:00', 150, NULL, 'https://meet.google.com/deb9891f77', NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(55, 17, 'Optimasi Proses Produksi', '1. Mapping alur produksi existing\n2. Identifikasi bottleneck dan waste\n3. Implementasi improvement\n4. Monitoring hasil optimasi', '2024-12-20 15:00:00', 150, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2024-12-20 08:00:00', '2024-12-20 10:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(56, 17, 'Review & Evaluasi Progress', '1. Review pencapaian target\n2. Diskusi kendala dan solusi\n3. Penyesuaian strategi jika diperlukan\n4. Penetapan action plan berikutnya', '2025-03-06 15:00:00', 90, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-03-06 08:00:00', '2025-03-06 09:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(57, 17, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-05-21 14:00:00', 180, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-05-21 07:00:00', '2025-05-21 10:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(58, 17, 'Closing Session & Action Plan', '1. Recap pembelajaran selama program\n2. Evaluasi pencapaian objectives\n3. Penyusunan action plan jangka panjang\n4. Certificate ceremony dan closing', '2025-08-05 09:30:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/5d255ea673', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-08-05 02:30:00', '2025-08-05 04:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(59, 18, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-03-20 15:30:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-03-20 08:30:00', '2025-03-20 10:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(60, 18, 'Closing Session & Action Plan', '1. Recap pembelajaran selama program\n2. Evaluasi pencapaian objectives\n3. Penyusunan action plan jangka panjang\n4. Certificate ceremony dan closing', '2025-06-09 10:00:00', 120, NULL, 'https://meet.google.com/5f052972aa', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-06-09 03:00:00', '2025-06-09 05:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(61, 18, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-08-29 15:30:00', 120, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-08-29 08:30:00', '2025-08-29 10:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(62, 19, 'Review & Evaluasi Progress', '1. Review pencapaian target\n2. Diskusi kendala dan solusi\n3. Penyesuaian strategi jika diperlukan\n4. Penetapan action plan berikutnya', '2025-09-20 14:00:00', 90, NULL, NULL, 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-09-20 07:00:00', '2025-09-20 08:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(63, 19, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2025-11-10 14:30:00', 180, NULL, 'https://meet.google.com/d3187a45c3', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-10 07:30:00', '2025-11-10 10:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(64, 19, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-12-31 11:30:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/7b3816ecb7', NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(65, 20, 'Strategi Pemasaran Digital', '1. Platform media sosial untuk bisnis\n2. Content marketing dan storytelling\n3. Teknik engagement dengan customer\n4. Analisis performa kampanye digital', '2025-11-20 15:30:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/a2ff0c1052', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-11-20 08:30:00', '2025-11-20 10:30:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(66, 20, 'Sesi Kick-off & Orientasi Program', '1. Perkenalan mentor dan peserta\n2. Overview program dan objectives\n3. Penetapan target dan milestone\n4. Q&A session', '2025-12-20 09:00:00', 120, 'Kantor Dinas Koperasi & UMKM Kota Cirebon', 'https://meet.google.com/7dc4ac18ba', 'Materi presentasi, worksheet, dan studi kasus telah dibagikan kepada peserta.', 'Peserta diminta untuk mengimplementasikan pembelajaran dalam bisnis mereka.', NULL, 'completed', '2025-12-20 02:00:00', '2025-12-20 04:00:00', 'Sesi berjalan dengan baik. Peserta aktif dan responsif. Materi tersampaikan dengan jelas.', '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(67, 20, 'Praktik Pembukuan Keuangan', '1. Dasar-dasar pembukuan\n2. Pencatatan transaksi harian\n3. Penyusunan laporan keuangan sederhana\n4. Studi kasus dan praktik langsung', '2026-01-19 15:30:00', 180, NULL, 'https://meet.google.com/5fbcea0d23', NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16'),
(68, 20, 'Review & Evaluasi Progress', '1. Review pencapaian target\n2. Diskusi kendala dan solusi\n3. Penyesuaian strategi jika diperlukan\n4. Penetapan action plan berikutnya', '2026-02-18 10:00:00', 90, NULL, NULL, NULL, NULL, NULL, 'scheduled', NULL, NULL, NULL, '2025-12-20 09:44:16', '2025-12-20 09:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_26_100418_add_two_factor_columns_to_users_table', 1),
(5, '2025_10_02_150745_create_categories_table', 1),
(6, '2025_10_02_150746_create_roles_table', 1),
(7, '2025_10_02_150747_create_permissions_table', 1),
(8, '2025_10_02_150749_create_umkms_table', 1),
(9, '2025_10_02_150759_create_mentorings_table', 1),
(10, '2025_10_02_150805_create_mentoring_sessions_table', 1),
(11, '2025_10_02_150809_create_products_table', 1),
(12, '2025_10_02_150813_create_documents_table', 1),
(13, '2025_10_02_150829_create_role_user_table', 1),
(14, '2025_10_02_150834_create_permission_role_table', 1),
(15, '2025_10_02_152807_add_soft_deletes_to_mentorings_table', 1),
(16, '2025_10_02_152813_add_soft_deletes_to_products_table', 1),
(17, '2025_10_02_163010_add_owner_id_to_umkms_table', 1),
(18, '2025_10_05_081807_add_nik_and_phone_to_users_table', 1),
(19, '2025_10_05_142338_remove_owner_info_columns_from_umkms_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `group`, `created_at`, `updated_at`) VALUES
(1, 'View UMKM', 'view-umkm', 'View UMKM data', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(2, 'Create UMKM', 'create-umkm', 'Create new UMKM', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(3, 'Edit UMKM', 'edit-umkm', 'Edit UMKM data', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(4, 'Delete UMKM', 'delete-umkm', 'Delete UMKM', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(5, 'Verify UMKM', 'verify-umkm', 'Verify UMKM data', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(6, 'Publish UMKM', 'publish-umkm', 'Publish UMKM to catalog', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(7, 'View Products', 'view-products', 'View products', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(8, 'Manage Products', 'manage-products', 'Create, edit, delete products', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(9, 'View Mentoring', 'view-mentoring', 'View mentoring programs', 'mentoring', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(10, 'Create Mentoring', 'create-mentoring', 'Create mentoring programs', 'mentoring', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(11, 'Edit Mentoring', 'edit-mentoring', 'Edit mentoring programs', 'mentoring', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(12, 'Delete Mentoring', 'delete-mentoring', 'Delete mentoring programs', 'mentoring', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(13, 'Manage Sessions', 'manage-sessions', 'Manage mentoring sessions', 'mentoring', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(14, 'View Users', 'view-users', 'View users', 'user', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(15, 'Create Users', 'create-users', 'Create new users', 'user', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(16, 'Edit Users', 'edit-users', 'Edit users', 'user', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(17, 'Delete Users', 'delete-users', 'Delete users', 'user', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(18, 'Manage Roles', 'manage-roles', 'Assign roles to users', 'user', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(19, 'View Documents', 'view-documents', 'View documents', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(20, 'Upload Documents', 'upload-documents', 'Upload documents', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(21, 'Delete Documents', 'delete-documents', 'Delete documents', 'umkm', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(22, 'View Dashboard', 'view-dashboard', 'Access dashboard', 'system', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(23, 'View Reports', 'view-reports', 'View system reports', 'system', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(24, 'Manage Categories', 'manage-categories', 'Manage UMKM categories', 'system', '2025-12-20 09:41:52', '2025-12-20 09:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(2, 2, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(3, 3, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(4, 4, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(5, 5, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(6, 6, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(7, 7, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(8, 8, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(9, 9, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(10, 10, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(11, 11, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(12, 12, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(13, 13, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(14, 14, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(15, 15, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(16, 16, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(17, 17, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(18, 18, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(19, 19, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(20, 20, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(21, 21, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(22, 22, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(23, 23, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(24, 24, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(25, 1, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(26, 2, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(27, 3, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(28, 4, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(29, 5, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(30, 6, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(31, 7, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(32, 8, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(33, 9, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(34, 10, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(35, 11, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(36, 12, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(37, 13, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(38, 19, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(39, 20, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(40, 21, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(41, 22, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(42, 23, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(43, 24, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(44, 10, 3, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(45, 11, 3, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(46, 13, 3, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(47, 22, 3, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(48, 9, 3, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(49, 1, 3, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(50, 2, 4, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(51, 3, 4, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(52, 20, 4, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(53, 22, 4, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(54, 19, 4, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(55, 7, 4, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(56, 1, 4, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(57, 3, 5, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(58, 8, 5, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(59, 20, 5, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(60, 22, 5, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(61, 19, 5, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(62, 9, 5, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(63, 7, 5, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(64, 1, 5, '2025-12-20 09:41:52', '2025-12-20 09:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `umkm_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `unit` varchar(255) NOT NULL DEFAULT 'pcs',
  `stock` int(11) NOT NULL DEFAULT 0,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `umkm_id`, `name`, `slug`, `description`, `price`, `unit`, `stock`, `images`, `is_available`, `is_featured`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Petis Udang', 'petis-udang-76', 'Petis udang kental untuk pelengkap masakan', 30203.00, 'botol', 117, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004444?text=food+id\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(2, 1, 'Mie Koclok', 'mie-koclok-33', 'Mie kuah kental dengan irisan daging dan taburan bawang goreng', 19263.00, 'porsi', 134, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001199?text=food+pariatur\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(3, 1, 'Nasi Jamblang', 'nasi-jamblang-19', 'Nasi jamblang dengan berbagai lauk pilihan, dibungkus daun jati', 18196.00, 'porsi', 42, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/008833?text=food+nihil\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0044dd?text=food+alias\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(4, 1, 'Pigura Ukir', 'pigura-ukir-50', 'Pigura foto dengan ukiran khas Cirebon', 106072.00, 'pcs', 25, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff44?text=food+voluptatum\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ee66?text=food+eos\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(5, 1, 'Sate Kalong', 'sate-kalong-79', 'Sate kambing khas Cirebon dengan bumbu kacang spesial', 25733.00, 'porsi', 89, NULL, 1, 1, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(6, 1, 'Dodol Picnic', 'dodol-picnic-69', 'Dodol Cirebon dengan berbagai varian rasa', 57760.00, 'box', 21, NULL, 1, 1, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(7, 2, 'Mukena', 'mukena-87', 'Mukena dengan bahan lembut dan motif cantik', 122527.00, 'set', 55, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa77?text=food+voluptatem\"]', 1, 1, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(8, 2, 'Mukena', 'mukena-60', 'Mukena dengan bahan lembut dan motif cantik', 135744.00, 'set', 143, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(9, 2, 'Petis Udang', 'petis-udang-89', 'Petis udang kental untuk pelengkap masakan', 35676.00, 'botol', 21, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(10, 2, 'Sarung Batik', 'sarung-batik-96', 'Sarung batik dengan motif klasik Cirebon', 143539.00, 'pcs', 43, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(11, 3, 'Kue Apem', 'kue-apem-46', 'Kue apem tradisional khas Cirebon, lembut dan manis', 33193.00, 'box', 147, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/003322?text=food+sit\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0077dd?text=food+harum\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(12, 3, 'Mukena', 'mukena-54', 'Mukena dengan bahan lembut dan motif cantik', 104413.00, 'set', 112, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0099cc?text=food+ut\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa88?text=food+repellendus\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(13, 3, 'Kerupuk Melarat', 'kerupuk-melarat-87', 'Kerupuk khas Cirebon yang renyah dan gurih', 19612.00, 'pack', 7, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(14, 4, 'Tahu Gejrot', 'tahu-gejrot-99', 'Tahu gejrot dengan kuah kecap pedas manis yang segar', 9912.00, 'porsi', 145, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ccaa?text=food+vitae\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(15, 4, 'Kerupuk Melarat', 'kerupuk-melarat-21', 'Kerupuk khas Cirebon yang renyah dan gurih', 16555.00, 'pack', 42, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0022bb?text=food+rerum\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bb33?text=food+autem\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(16, 4, 'Tas Rajut', 'tas-rajut-1', 'Tas rajut handmade dengan berbagai ukuran dan warna', 66457.00, 'pcs', 97, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(17, 5, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-38', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 361570.00, 'pcs', 10, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bb88?text=food+alias\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ddaa?text=food+maxime\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(18, 5, 'Dodol Picnic', 'dodol-picnic-62', 'Dodol Cirebon dengan berbagai varian rasa', 39757.00, 'box', 69, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bb77?text=food+ullam\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0000ee?text=food+corrupti\"]', 0, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(19, 5, 'Dress Batik Wanita', 'dress-batik-wanita-63', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 233629.00, 'pcs', 127, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00eecc?text=food+non\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0044ee?text=food+excepturi\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(20, 5, 'Selendang Batik', 'selendang-batik-72', 'Selendang batik sutra halus dengan warna cerah', 92120.00, 'pcs', 111, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(21, 5, 'Nasi Jamblang', 'nasi-jamblang-89', 'Nasi jamblang dengan berbagai lauk pilihan, dibungkus daun jati', 19365.00, 'porsi', 142, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/007777?text=food+voluptas\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/003377?text=food+architecto\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(22, 5, 'Dress Batik Wanita', 'dress-batik-wanita-41', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 252161.00, 'pcs', 115, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(23, 5, 'Empal Gentong', 'empal-gentong-73', 'Empal gentong khas Cirebon dengan kuah santan kental dan daging sapi empuk', 33982.00, 'porsi', 96, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/003300?text=food+amet\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/006633?text=food+cum\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(24, 6, 'Tas Rajut', 'tas-rajut-23', 'Tas rajut handmade dengan berbagai ukuran dan warna', 94763.00, 'pcs', 129, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/007722?text=food+dolores\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(25, 6, 'Kain Batik Tulis Megamendung', 'kain-batik-tulis-megamendung-68', 'Kain batik tulis dengan motif megamendung khas Cirebon', 386848.00, 'pcs', 30, NULL, 0, 1, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(26, 6, 'Pigura Ukir', 'pigura-ukir-88', 'Pigura foto dengan ukiran khas Cirebon', 78335.00, 'pcs', 70, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/006666?text=food+labore\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004411?text=food+rerum\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(27, 6, 'Empal Asem', 'empal-asem-58', 'Daging sapi dengan kuah asem segar khas Cirebon', 30495.00, 'porsi', 40, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ee00?text=food+atque\"]', 1, 1, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(28, 6, 'Docang', 'docang-61', 'Lontong sayur khas Cirebon dengan kuah oncom yang gurih', 10092.00, 'porsi', 98, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(29, 6, 'Terasi Udang Cirebon', 'terasi-udang-cirebon-32', 'Terasi udang asli Cirebon dengan aroma khas dan rasa gurih', 26592.00, 'pack', 61, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/006666?text=food+beatae\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/003399?text=food+aut\"]', 1, 1, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(30, 7, 'Pigura Ukir', 'pigura-ukir-76', 'Pigura foto dengan ukiran khas Cirebon', 82159.00, 'pcs', 128, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(31, 7, 'Baju Koko', 'baju-koko-61', 'Baju koko muslim dengan bahan nyaman dan desain modern', 138075.00, 'pcs', 131, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa99?text=food+soluta\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(32, 7, 'Sarung Batik', 'sarung-batik-29', 'Sarung batik dengan motif klasik Cirebon', 128882.00, 'pcs', 54, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/009933?text=food+vitae\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(33, 8, 'Meja Rotan', 'meja-rotan-39', 'Meja rotan dengan desain minimalis modern', 588801.00, 'pcs', 29, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ddaa?text=food+repellat\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dd88?text=food+fugiat\"]', 0, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(34, 8, 'Gamis Syari', 'gamis-syari-17', 'Gamis syari dengan bahan adem dan model terkini', 205305.00, 'pcs', 148, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00cccc?text=food+id\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/000000?text=food+et\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(35, 8, 'Nasi Lengko', 'nasi-lengko-65', 'Nasi dengan tempe, tahu, tauge, dan kuah kacang', 16006.00, 'porsi', 76, NULL, 1, 1, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(36, 8, 'Kain Batik Tulis Megamendung', 'kain-batik-tulis-megamendung-53', 'Kain batik tulis dengan motif megamendung khas Cirebon', 297678.00, 'pcs', 72, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/005588?text=food+et\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/009900?text=food+est\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(37, 8, 'Mie Koclok', 'mie-koclok-68', 'Mie kuah kental dengan irisan daging dan taburan bawang goreng', 16310.00, 'porsi', 85, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(38, 9, 'Terasi Udang Cirebon', 'terasi-udang-cirebon-47', 'Terasi udang asli Cirebon dengan aroma khas dan rasa gurih', 38022.00, 'pack', 51, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(39, 9, 'Dress Batik Wanita', 'dress-batik-wanita-27', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 307895.00, 'pcs', 98, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ffdd?text=food+quo\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/002222?text=food+possimus\"]', 1, 1, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(40, 9, 'Terasi Udang Cirebon', 'terasi-udang-cirebon-7', 'Terasi udang asli Cirebon dengan aroma khas dan rasa gurih', 31904.00, 'pack', 97, NULL, 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(41, 9, 'Sarung Batik', 'sarung-batik-69', 'Sarung batik dengan motif klasik Cirebon', 220235.00, 'pcs', 68, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dd66?text=food+quia\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(42, 10, 'Empal Gentong', 'empal-gentong-7', 'Empal gentong khas Cirebon dengan kuah santan kental dan daging sapi empuk', 33987.00, 'porsi', 97, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/005566?text=food+expedita\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(43, 10, 'Baju Koko', 'baju-koko-86', 'Baju koko muslim dengan bahan nyaman dan desain modern', 157114.00, 'pcs', 23, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001111?text=food+non\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(44, 10, 'Kain Batik Cap Wadasan', 'kain-batik-cap-wadasan-57', 'Batik cap dengan motif wadasan, cocok untuk berbagai acara', 197359.00, 'pcs', 52, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/002255?text=food+ea\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004477?text=food+ab\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(45, 10, 'Dress Batik Wanita', 'dress-batik-wanita-13', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 267571.00, 'pcs', 146, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001144?text=food+vel\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(46, 10, 'Pigura Ukir', 'pigura-ukir-58', 'Pigura foto dengan ukiran khas Cirebon', 144573.00, 'pcs', 112, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/000000?text=food+molestiae\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(47, 10, 'Docang', 'docang-67', 'Lontong sayur khas Cirebon dengan kuah oncom yang gurih', 14490.00, 'porsi', 8, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001133?text=food+ut\"]', 1, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(48, 10, 'Kue Apem', 'kue-apem-31', 'Kue apem tradisional khas Cirebon, lembut dan manis', 24227.00, 'box', 18, NULL, 0, 0, '2025-12-20 09:44:15', '2025-12-20 09:44:15', NULL),
(49, 11, 'Sarung Batik', 'sarung-batik-49', 'Sarung batik dengan motif klasik Cirebon', 129793.00, 'pcs', 139, NULL, 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(50, 11, 'Tape Singkong', 'tape-singkong-73', 'Tape singkong manis legit khas Cirebon', 20705.00, 'pack', 71, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/003388?text=food+aut\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/006677?text=food+quia\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(51, 11, 'Empal Gentong', 'empal-gentong-45', 'Empal gentong khas Cirebon dengan kuah santan kental dan daging sapi empuk', 34792.00, 'porsi', 127, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004455?text=food+aut\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ffcc?text=food+dolores\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(52, 11, 'Gamis Syari', 'gamis-syari-2', 'Gamis syari dengan bahan adem dan model terkini', 188568.00, 'pcs', 118, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dddd?text=food+porro\"]', 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(53, 11, 'Docang', 'docang-47', 'Lontong sayur khas Cirebon dengan kuah oncom yang gurih', 14648.00, 'porsi', 72, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004477?text=food+id\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001100?text=food+error\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(54, 12, 'Petis Udang', 'petis-udang-79', 'Petis udang kental untuk pelengkap masakan', 20109.00, 'botol', 96, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff88?text=food+quia\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/003388?text=food+omnis\"]', 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(55, 12, 'Pigura Ukir', 'pigura-ukir-50', 'Pigura foto dengan ukiran khas Cirebon', 199144.00, 'pcs', 117, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(56, 12, 'Petis Udang', 'petis-udang-95', 'Petis udang kental untuk pelengkap masakan', 31406.00, 'botol', 43, NULL, 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(57, 12, 'Kemeja Batik Pria', 'kemeja-batik-pria-91', 'Kemeja batik pria dengan motif Cirebonan modern', 310594.00, 'pcs', 149, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001100?text=food+a\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(58, 12, 'Baju Koko', 'baju-koko-73', 'Baju koko muslim dengan bahan nyaman dan desain modern', 182376.00, 'pcs', 57, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ccff?text=food+dolor\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff88?text=food+delectus\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(59, 12, 'Kerupuk Melarat', 'kerupuk-melarat-89', 'Kerupuk khas Cirebon yang renyah dan gurih', 29097.00, 'pack', 141, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(60, 13, 'Nasi Lengko', 'nasi-lengko-14', 'Nasi dengan tempe, tahu, tauge, dan kuah kacang', 15585.00, 'porsi', 107, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00eeaa?text=food+expedita\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(61, 13, 'Tas Anyaman Bambu', 'tas-anyaman-bambu-34', 'Tas anyaman bambu handmade, cocok untuk sehari-hari', 88043.00, 'pcs', 91, NULL, 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(62, 13, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-40', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 295860.00, 'pcs', 5, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dddd?text=food+quia\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0000aa?text=food+quo\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(63, 13, 'Terasi Udang Cirebon', 'terasi-udang-cirebon-89', 'Terasi udang asli Cirebon dengan aroma khas dan rasa gurih', 38070.00, 'pack', 109, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dd66?text=food+voluptatibus\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(64, 13, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-60', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 268259.00, 'pcs', 119, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(65, 13, 'Dress Batik Wanita', 'dress-batik-wanita-21', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 324326.00, 'pcs', 34, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(66, 13, 'Kain Batik Cap Wadasan', 'kain-batik-cap-wadasan-75', 'Batik cap dengan motif wadasan, cocok untuk berbagai acara', 228329.00, 'pcs', 11, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/009944?text=food+voluptatum\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0055ee?text=food+asperiores\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(67, 14, 'Gamis Syari', 'gamis-syari-2', 'Gamis syari dengan bahan adem dan model terkini', 299999.00, 'pcs', 57, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(68, 14, 'Tas Rajut', 'tas-rajut-8', 'Tas rajut handmade dengan berbagai ukuran dan warna', 68825.00, 'pcs', 63, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004488?text=food+corporis\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dd44?text=food+molestiae\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(69, 14, 'Petis Udang', 'petis-udang-41', 'Petis udang kental untuk pelengkap masakan', 30610.00, 'botol', 88, NULL, 0, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(70, 14, 'Kerupuk Melarat', 'kerupuk-melarat-62', 'Kerupuk khas Cirebon yang renyah dan gurih', 21032.00, 'pack', 74, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(71, 14, 'Pigura Ukir', 'pigura-ukir-29', 'Pigura foto dengan ukiran khas Cirebon', 193616.00, 'pcs', 49, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(72, 14, 'Dodol Picnic', 'dodol-picnic-87', 'Dodol Cirebon dengan berbagai varian rasa', 56265.00, 'box', 149, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0000ff?text=food+eos\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(73, 14, 'Nasi Lengko', 'nasi-lengko-66', 'Nasi dengan tempe, tahu, tauge, dan kuah kacang', 12764.00, 'porsi', 7, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001111?text=food+molestiae\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(74, 14, 'Terasi Udang Cirebon', 'terasi-udang-cirebon-41', 'Terasi udang asli Cirebon dengan aroma khas dan rasa gurih', 34584.00, 'pack', 144, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001177?text=food+ducimus\"]', 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(75, 15, 'Mie Koclok', 'mie-koclok-4', 'Mie kuah kental dengan irisan daging dan taburan bawang goreng', 18554.00, 'porsi', 140, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0011dd?text=food+dolore\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(76, 15, 'Rengginang', 'rengginang-38', 'Rengginang ketan renyah gurih', 22672.00, 'pack', 14, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/000066?text=food+qui\"]', 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(77, 15, 'Tape Singkong', 'tape-singkong-2', 'Tape singkong manis legit khas Cirebon', 16638.00, 'pack', 126, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(78, 15, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-3', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 296973.00, 'pcs', 56, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/006633?text=food+omnis\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ee77?text=food+velit\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(79, 15, 'Rengginang', 'rengginang-78', 'Rengginang ketan renyah gurih', 20766.00, 'pack', 147, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/002299?text=food+molestiae\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(80, 15, 'Rengginang', 'rengginang-68', 'Rengginang ketan renyah gurih', 19983.00, 'pack', 130, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(81, 15, 'Empal Gentong', 'empal-gentong-29', 'Empal gentong khas Cirebon dengan kuah santan kental dan daging sapi empuk', 33320.00, 'porsi', 97, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff88?text=food+ipsum\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ddaa?text=food+expedita\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(82, 16, 'Empal Gentong', 'empal-gentong-95', 'Empal gentong khas Cirebon dengan kuah santan kental dan daging sapi empuk', 30216.00, 'porsi', 50, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(83, 16, 'Dress Batik Wanita', 'dress-batik-wanita-60', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 299416.00, 'pcs', 61, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/007755?text=food+quia\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(84, 16, 'Docang', 'docang-70', 'Lontong sayur khas Cirebon dengan kuah oncom yang gurih', 14752.00, 'porsi', 137, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/007722?text=food+voluptatum\"]', 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(85, 16, 'Kursi Rotan', 'kursi-rotan-38', 'Kursi rotan anyaman berkualitas tinggi, kuat dan awet', 515559.00, 'pcs', 89, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ccee?text=food+est\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(86, 16, 'Tas Anyaman Bambu', 'tas-anyaman-bambu-69', 'Tas anyaman bambu handmade, cocok untuk sehari-hari', 110424.00, 'pcs', 107, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/003300?text=food+nulla\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(87, 17, 'Kain Batik Tulis Megamendung', 'kain-batik-tulis-megamendung-96', 'Kain batik tulis dengan motif megamendung khas Cirebon', 396421.00, 'pcs', 104, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00cc11?text=food+suscipit\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(88, 17, 'Empal Gentong', 'empal-gentong-86', 'Empal gentong khas Cirebon dengan kuah santan kental dan daging sapi empuk', 25252.00, 'porsi', 99, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/006611?text=food+rerum\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(89, 17, 'Empal Asem', 'empal-asem-78', 'Daging sapi dengan kuah asem segar khas Cirebon', 31457.00, 'porsi', 70, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(90, 17, 'Mie Koclok', 'mie-koclok-4', 'Mie kuah kental dengan irisan daging dan taburan bawang goreng', 16392.00, 'porsi', 18, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa22?text=food+laborum\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00cc77?text=food+voluptatem\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(91, 17, 'Kain Batik Tulis Megamendung', 'kain-batik-tulis-megamendung-99', 'Kain batik tulis dengan motif megamendung khas Cirebon', 430303.00, 'pcs', 97, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bb77?text=food+expedita\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(92, 17, 'Dress Batik Wanita', 'dress-batik-wanita-25', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 209978.00, 'pcs', 82, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bb22?text=food+magnam\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004433?text=food+alias\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(93, 17, 'Kue Gapit', 'kue-gapit-91', 'Kue gapit renyah dengan berbagai rasa', 31378.00, 'box', 89, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0033ee?text=food+voluptatem\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa66?text=food+optio\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(94, 17, 'Dress Batik Wanita', 'dress-batik-wanita-58', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 315138.00, 'pcs', 20, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ffff?text=food+occaecati\"]', 0, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(95, 18, 'Kursi Rotan', 'kursi-rotan-36', 'Kursi rotan anyaman berkualitas tinggi, kuat dan awet', 494865.00, 'pcs', 92, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0088bb?text=food+odit\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bb33?text=food+corrupti\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(96, 18, 'Nasi Lengko', 'nasi-lengko-4', 'Nasi dengan tempe, tahu, tauge, dan kuah kacang', 13751.00, 'porsi', 95, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aaaa?text=food+sit\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(97, 18, 'Selendang Batik', 'selendang-batik-24', 'Selendang batik sutra halus dengan warna cerah', 130156.00, 'pcs', 94, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/008888?text=food+et\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(98, 18, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-76', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 310875.00, 'pcs', 43, NULL, 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(99, 18, 'Docang', 'docang-92', 'Lontong sayur khas Cirebon dengan kuah oncom yang gurih', 12170.00, 'porsi', 67, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ffdd?text=food+vel\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(100, 19, 'Gamis Syari', 'gamis-syari-90', 'Gamis syari dengan bahan adem dan model terkini', 270827.00, 'pcs', 65, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff22?text=food+quidem\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff44?text=food+excepturi\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(101, 19, 'Docang', 'docang-48', 'Lontong sayur khas Cirebon dengan kuah oncom yang gurih', 12551.00, 'porsi', 93, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004422?text=food+earum\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/004455?text=food+nulla\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(102, 19, 'Sate Kalong', 'sate-kalong-21', 'Sate kambing khas Cirebon dengan bumbu kacang spesial', 23908.00, 'porsi', 11, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00eeaa?text=food+repudiandae\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(103, 19, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-52', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 338718.00, 'pcs', 47, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa11?text=food+eum\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ffff?text=food+assumenda\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(104, 19, 'Kain Batik Cap Wadasan', 'kain-batik-cap-wadasan-54', 'Batik cap dengan motif wadasan, cocok untuk berbagai acara', 179892.00, 'pcs', 39, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(105, 19, 'Petis Udang', 'petis-udang-90', 'Petis udang kental untuk pelengkap masakan', 24758.00, 'botol', 76, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/009900?text=food+ea\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(106, 20, 'Petis Udang', 'petis-udang-72', 'Petis udang kental untuk pelengkap masakan', 36404.00, 'botol', 99, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa66?text=food+fuga\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(107, 20, 'Sate Kalong', 'sate-kalong-63', 'Sate kambing khas Cirebon dengan bumbu kacang spesial', 27706.00, 'porsi', 64, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(108, 20, 'Kain Batik Tulis Megamendung', 'kain-batik-tulis-megamendung-8', 'Kain batik tulis dengan motif megamendung khas Cirebon', 323410.00, 'pcs', 42, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ffbb?text=food+officiis\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0066ee?text=food+dolor\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(109, 21, 'Petis Udang', 'petis-udang-68', 'Petis udang kental untuk pelengkap masakan', 22219.00, 'botol', 144, NULL, 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(110, 21, 'Kue Apem', 'kue-apem-97', 'Kue apem tradisional khas Cirebon, lembut dan manis', 25954.00, 'box', 6, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/008888?text=food+est\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dd11?text=food+non\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(111, 21, 'Kue Gapit', 'kue-gapit-64', 'Kue gapit renyah dengan berbagai rasa', 25710.00, 'box', 38, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ee33?text=food+vel\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(112, 21, 'Dress Batik Wanita', 'dress-batik-wanita-14', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 272732.00, 'pcs', 99, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(113, 21, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-21', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 163401.00, 'pcs', 144, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa44?text=food+non\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/009955?text=food+enim\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(114, 21, 'Tape Singkong', 'tape-singkong-58', 'Tape singkong manis legit khas Cirebon', 23616.00, 'pack', 121, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aabb?text=food+ut\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(115, 22, 'Sate Kalong', 'sate-kalong-22', 'Sate kambing khas Cirebon dengan bumbu kacang spesial', 25607.00, 'porsi', 40, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00cc88?text=food+et\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(116, 22, 'Tas Rajut', 'tas-rajut-53', 'Tas rajut handmade dengan berbagai ukuran dan warna', 101082.00, 'pcs', 149, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0088dd?text=food+repellendus\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(117, 22, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-11', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 315499.00, 'pcs', 57, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bb55?text=food+suscipit\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(118, 23, 'Tahu Gejrot', 'tahu-gejrot-86', 'Tahu gejrot dengan kuah kecap pedas manis yang segar', 10132.00, 'porsi', 105, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0077dd?text=food+temporibus\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa11?text=food+accusantium\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(119, 23, 'Kain Batik Cap Wadasan', 'kain-batik-cap-wadasan-64', 'Batik cap dengan motif wadasan, cocok untuk berbagai acara', 176659.00, 'pcs', 97, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0088ee?text=food+dignissimos\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0055ee?text=food+et\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(120, 23, 'Docang', 'docang-93', 'Lontong sayur khas Cirebon dengan kuah oncom yang gurih', 14909.00, 'porsi', 12, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00cc33?text=food+explicabo\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(121, 23, 'Nasi Jamblang', 'nasi-jamblang-52', 'Nasi jamblang dengan berbagai lauk pilihan, dibungkus daun jati', 17564.00, 'porsi', 143, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0077dd?text=food+earum\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(122, 23, 'Tas Anyaman Bambu', 'tas-anyaman-bambu-48', 'Tas anyaman bambu handmade, cocok untuk sehari-hari', 64480.00, 'pcs', 18, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/007700?text=food+sint\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(123, 23, 'Kursi Rotan', 'kursi-rotan-50', 'Kursi rotan anyaman berkualitas tinggi, kuat dan awet', 435420.00, 'pcs', 105, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0088bb?text=food+dolorem\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aaee?text=food+voluptatem\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(124, 24, 'Tas Anyaman Bambu', 'tas-anyaman-bambu-91', 'Tas anyaman bambu handmade, cocok untuk sehari-hari', 118429.00, 'pcs', 89, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bbff?text=food+quos\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0055cc?text=food+dolor\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(125, 24, 'Rengginang', 'rengginang-68', 'Rengginang ketan renyah gurih', 19305.00, 'pack', 140, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0044dd?text=food+velit\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(126, 24, 'Selendang Batik', 'selendang-batik-65', 'Selendang batik sutra halus dengan warna cerah', 145090.00, 'pcs', 80, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(127, 24, 'Kemeja Batik Pria', 'kemeja-batik-pria-23', 'Kemeja batik pria dengan motif Cirebonan modern', 321161.00, 'pcs', 142, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(128, 24, 'Tas Rajut', 'tas-rajut-92', 'Tas rajut handmade dengan berbagai ukuran dan warna', 79375.00, 'pcs', 43, NULL, 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(129, 24, 'Tas Anyaman Bambu', 'tas-anyaman-bambu-95', 'Tas anyaman bambu handmade, cocok untuk sehari-hari', 114283.00, 'pcs', 131, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/009922?text=food+qui\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(130, 24, 'Tas Rajut', 'tas-rajut-54', 'Tas rajut handmade dengan berbagai ukuran dan warna', 61062.00, 'pcs', 50, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/005577?text=food+similique\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(131, 25, 'Kemeja Batik Pria', 'kemeja-batik-pria-16', 'Kemeja batik pria dengan motif Cirebonan modern', 224403.00, 'pcs', 128, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(132, 25, 'Selendang Batik', 'selendang-batik-24', 'Selendang batik sutra halus dengan warna cerah', 85826.00, 'pcs', 75, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ee22?text=food+necessitatibus\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(133, 25, 'Empal Asem', 'empal-asem-71', 'Daging sapi dengan kuah asem segar khas Cirebon', 29678.00, 'porsi', 136, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(134, 25, 'Nasi Lengko', 'nasi-lengko-2', 'Nasi dengan tempe, tahu, tauge, dan kuah kacang', 15505.00, 'porsi', 111, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/005588?text=food+fugit\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(135, 26, 'Selendang Batik', 'selendang-batik-53', 'Selendang batik sutra halus dengan warna cerah', 137140.00, 'pcs', 86, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001177?text=food+quo\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/007700?text=food+enim\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(136, 26, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-44', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 158350.00, 'pcs', 70, NULL, 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(137, 26, 'Pigura Ukir', 'pigura-ukir-45', 'Pigura foto dengan ukiran khas Cirebon', 78233.00, 'pcs', 43, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/002277?text=food+aut\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/008888?text=food+nostrum\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(138, 26, 'Sarung Batik', 'sarung-batik-74', 'Sarung batik dengan motif klasik Cirebon', 121308.00, 'pcs', 41, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/006644?text=food+laboriosam\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(139, 26, 'Tas Rajut', 'tas-rajut-73', 'Tas rajut handmade dengan berbagai ukuran dan warna', 115349.00, 'pcs', 132, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff66?text=food+ex\"]', 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(140, 26, 'Dodol Picnic', 'dodol-picnic-79', 'Dodol Cirebon dengan berbagai varian rasa', 35785.00, 'box', 112, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(141, 26, 'Kursi Rotan', 'kursi-rotan-23', 'Kursi rotan anyaman berkualitas tinggi, kuat dan awet', 510301.00, 'pcs', 106, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bb22?text=food+ipsum\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/005544?text=food+eum\"]', 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(142, 27, 'Terasi Udang Cirebon', 'terasi-udang-cirebon-88', 'Terasi udang asli Cirebon dengan aroma khas dan rasa gurih', 33158.00, 'pack', 114, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(143, 27, 'Terasi Udang Cirebon', 'terasi-udang-cirebon-38', 'Terasi udang asli Cirebon dengan aroma khas dan rasa gurih', 27355.00, 'pack', 137, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/008800?text=food+quia\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/002211?text=food+quia\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(144, 27, 'Rengginang', 'rengginang-8', 'Rengginang ketan renyah gurih', 27276.00, 'pack', 14, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/009933?text=food+illum\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(145, 28, 'Kursi Rotan', 'kursi-rotan-81', 'Kursi rotan anyaman berkualitas tinggi, kuat dan awet', 423564.00, 'pcs', 107, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0000ee?text=food+inventore\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(146, 28, 'Tahu Gejrot', 'tahu-gejrot-81', 'Tahu gejrot dengan kuah kecap pedas manis yang segar', 12761.00, 'porsi', 121, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/009955?text=food+beatae\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa99?text=food+aut\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(147, 28, 'Gamis Syari', 'gamis-syari-6', 'Gamis syari dengan bahan adem dan model terkini', 273288.00, 'pcs', 39, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(148, 29, 'Kerajinan Kayu Jati', 'kerajinan-kayu-jati-66', 'Berbagai kerajinan dari kayu jati pilihan dengan finishing halus', 495318.00, 'pcs', 87, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff11?text=food+soluta\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00bbaa?text=food+non\"]', 0, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(149, 29, 'Tas Anyaman Bambu', 'tas-anyaman-bambu-84', 'Tas anyaman bambu handmade, cocok untuk sehari-hari', 98544.00, 'pcs', 21, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/001111?text=food+sit\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(150, 29, 'Baju Koko', 'baju-koko-5', 'Baju koko muslim dengan bahan nyaman dan desain modern', 141899.00, 'pcs', 126, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/006688?text=food+repudiandae\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(151, 29, 'Kursi Rotan', 'kursi-rotan-31', 'Kursi rotan anyaman berkualitas tinggi, kuat dan awet', 621647.00, 'pcs', 100, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00ff66?text=food+et\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/000066?text=food+minus\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(152, 29, 'Petis Udang', 'petis-udang-47', 'Petis udang kental untuk pelengkap masakan', 32775.00, 'botol', 142, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00cc66?text=food+officiis\"]', 0, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(153, 29, 'Dress Batik Wanita', 'dress-batik-wanita-93', 'Dress batik wanita dengan desain elegan dan nyaman dipakai', 370664.00, 'pcs', 109, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(154, 29, 'Empal Asem', 'empal-asem-99', 'Daging sapi dengan kuah asem segar khas Cirebon', 33597.00, 'porsi', 19, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00aa99?text=food+quae\",\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dd11?text=food+in\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(155, 29, 'Rengginang', 'rengginang-90', 'Rengginang ketan renyah gurih', 23350.00, 'pack', 104, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(156, 30, 'Mie Koclok', 'mie-koclok-51', 'Mie kuah kental dengan irisan daging dan taburan bawang goreng', 18907.00, 'porsi', 32, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(157, 30, 'Kain Batik Cap Wadasan', 'kain-batik-cap-wadasan-48', 'Batik cap dengan motif wadasan, cocok untuk berbagai acara', 178399.00, 'pcs', 11, NULL, 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(158, 30, 'Kemeja Batik Pria', 'kemeja-batik-pria-0', 'Kemeja batik pria dengan motif Cirebonan modern', 294318.00, 'pcs', 64, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(159, 30, 'Dodol Picnic', 'dodol-picnic-90', 'Dodol Cirebon dengan berbagai varian rasa', 34153.00, 'box', 27, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/0044cc?text=food+excepturi\"]', 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(160, 30, 'Kemeja Batik Pria', 'kemeja-batik-pria-3', 'Kemeja batik pria dengan motif Cirebonan modern', 274434.00, 'pcs', 106, NULL, 1, 0, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(161, 30, 'Sarung Batik', 'sarung-batik-69', 'Sarung batik dengan motif klasik Cirebon', 220218.00, 'pcs', 148, '[\"https:\\/\\/via.placeholder.com\\/800x600.png\\/00dd11?text=food+doloremque\"]', 1, 1, '2025-12-20 09:44:16', '2025-12-20 09:44:16', NULL),
(162, 8, 'Muhammad Aga Hibatulloh', 'muhammad-aga-hibatulloh', 'jdjkfjkanfcjkfnakcnklackla', 800000.00, 'pcs', 4, '[\"products\\/01KDN92V6GP8MXHXACNX8C8H1R.jpg\"]', 1, 1, '2025-12-29 07:44:34', '2025-12-29 07:44:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super-admin', 'Has full access to all system features', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(2, 'Admin', 'admin', 'Can manage UMKM data and users', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(3, 'Mentor', 'mentor', 'Can manage mentoring programs and sessions', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(4, 'Staff', 'staff', 'Can view and assist with UMKM data entry', '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(5, 'UMKM Owner', 'umkm-owner', 'Can manage their own UMKM data', '2025-12-20 09:41:52', '2025-12-20 09:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(2, 2, 2, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(3, 4, 3, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(4, 3, 4, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(5, 5, 5, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(6, 5, 6, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(7, 5, 7, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(8, 5, 8, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(9, 5, 9, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(10, 5, 10, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(11, 5, 11, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(12, 5, 12, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(13, 5, 13, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(14, 5, 14, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(15, 5, 15, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(16, 5, 16, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(17, 5, 17, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(18, 5, 18, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(19, 5, 19, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(20, 5, 20, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(21, 3, 21, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(22, 3, 22, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(23, 3, 23, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(24, 3, 24, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(25, 3, 25, '2025-12-20 09:41:53', '2025-12-20 09:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1hfgTsnzhYvHVF1mkepeGcsQwpcHbudJHKMwE60C', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjFYY2JDU0huTWk5UTVnQ3hxVktkZmN3SUhiamhIM21GaVpjdEZPSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9mYzRlNjE3NWVmNDQubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767024683),
('4TiucAS9x738R3Ol0fVrIThKr4s9ybF0ZkkLZt1O', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnA2b2dHb0lJSWU2ZlgwbFdzV2lzM0oxeTZnOGNlUjU4OHpwcmtCUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9lZjEwZTg0MGFhZDYubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767025149),
('73drw24BIB0WCPbltC0FjRCObRtOGtYMJDH9xdMR', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVUzTTc2UGRFekdCcnU4NFlOektScnJCYmpCMDJMYTBPVVM3ZXZVRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly83NWQ2YzIzZDk4OGIzYTVkLTExNC04LTIyMi0yMDIuc2VydmVvdXNlcmNvbnRlbnQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767027240),
('AebbWj6xs9H4PQM8O0c2BnE6IEpxA4HdGMNCJHhG', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW5lU2xyR0FLMG5waWY5RExOeW94T0JPZ0hoNjZsNEFIcndOWmtSWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9kNzJhZDQ4ZjNlOTEubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767026579),
('ChliQYVU9cjDXGLXOauiZ4SpUoPFQbhqNsqgnp7A', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiek54ZG1hQVB3NnlBZU16MFRZNnJKRTJneXBmN211SVZOaUpwbDAydSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly82MTlkMDk1ZmMyNDgubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767025975),
('DL69AlEi2e3CyCJMSHG8frx50iJNgrJ7EkgjJCZA', NULL, '127.0.0.1', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3BxWFJsc3A4dWpNUzJqU1FKZmNuS1JRS3N0eDBhUk02MTdjdjRkOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9kNzJhZDQ4ZjNlOTEubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767026542),
('EbwKGqvHfA13A03NqfUMzpyPFgHDcXeHZLXXiBLY', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzlXVld1QnE0UjJaM2tNSGtLaXBXY1NqOWVLWDlwRDFDNk9SZFhwRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTM6Imh0dHA6Ly83NWQ2YzIzZDk4OGIzYTVkLTExNC04LTIyMi0yMDIuc2VydmVvdXNlcmNvbnRlbnQuY29tLz9zZXJ2ZW8tc2tpcC1icm93c2VyLXdhcm5pbmc9dHJ1ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767027286),
('fA648eJ3AjRlESO1H1vHDOAFgx6MWiTkiuTFdaih', NULL, '127.0.0.1', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibW45dnFlWDQ0UDFsb3dqeUh4V3dJMmM1M0NaMzRzeDlEOFNlQ0MyeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly83NWQ2YzIzZDk4OGIzYTVkLTExNC04LTIyMi0yMDIuc2VydmVvdXNlcmNvbnRlbnQuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767027249),
('jHNkajKwaDegTJ8q4PEQx4OczXJTNQbLTHYHg7ob', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0FXRlg5SEY2TXFhNmxac2t1Tm5Wc25WbWZ0S2huR1BkOG03SVBraSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly84ODdjZWIzODVhODEubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767024735),
('lLCvE5ZJxciQvJXyvRKoQKvOsdWsGPM6w51VYklW', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkhwYUdLdnNROE9udmhSRklRVDlEb1dJV2c3R2NSS2dqZHlZTzAyNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9kNzJhZDQ4ZjNlOTEubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767026529),
('Ma1XxVfrz0RG55a04xkbVr7OVYdQvCDrfSa3RWn7', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicER5dUhDTzl6ZVJWbmNkNFB1Z0t5TXN0ODNSSWhPbDNReTBTTlhCdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9kNzJhZDQ4ZjNlOTEubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767026552),
('oceOEI0oNOKa6Cw1Or2gLyd9ST2f5vF8nT7YiZDN', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWIzbkhmRFNFZ0daU2d4V1ZBRUdpR29NTk8yTTFhUlhhTDhvV2hhMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xNWNlZDMzMDU0MjUubmdyb2stZnJlZS5hcHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767026421),
('OELm8aOSZngyNH8PgucD1sU4YK4CyfLCrF03ZT82', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjduQ1hoeHF2amVTcDZhMG1VSkxLbURzZ2YwMHdEeUc1YjZFbGtoSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8wLjAuMC4wOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767025988),
('SDqRGEH0aVJwZlu21dDaEt52tVPa9h2oGPgAXpG8', 5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoic2h2dFBCRFRvUXBmTmZ6ZDlrTmdZOTI0V0FISUtwUW5URTF0eE5qMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRWYi9zSE1EenNqUUYzQ3k3NXMvWEVlZHZaRTFtL0FpdGNuYjIwNXNEMU9pRjVld1VRaHpydSI7czo2OiJ0YWJsZXMiO2E6NDp7czo0MDoiY2E0YTJmNjNhNTY3NDYzNjMzODk4ZDk3MWNlNzBmMmJfY29sdW1ucyI7YToyMDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJidXNpbmVzc19uYW1lIjtzOjU6ImxhYmVsIjtzOjEwOiJOYW1hIFVzYWhhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoib3duZXIubmFtZSI7czo1OiJsYWJlbCI7czo3OiJQZW1pbGlrIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToib3duZXIucGhvbmUiO3M6NToibGFiZWwiO3M6NzoiVGVsZXBvbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjA7fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJ2aWxsYWdlIjtzOjU6ImxhYmVsIjtzOjk6IktlbHVyYWhhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjA7fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo4OiJkaXN0cmljdCI7czo1OiJsYWJlbCI7czo5OiJLZWNhbWF0YW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjowO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoiY2l0eSI7czo1OiJsYWJlbCI7czo0OiJLb3RhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJjYXRlZ29yeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjg6IkthdGVnb3JpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoiYnVzaW5lc3NfdHlwZSI7czo1OiJsYWJlbCI7czoxMToiU2thbGEgVXNhaGEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo4O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE2OiJlc3RhYmxpc2hlZF95ZWFyIjtzOjU6ImxhYmVsIjtzOjEzOiJUYWh1biBCZXJkaXJpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aTo5O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE0OiJlbXBsb3llZV9jb3VudCI7czo1OiJsYWJlbCI7czo4OiJLYXJ5YXdhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTU6Im1vbnRobHlfcmV2ZW51ZSI7czo1OiJsYWJlbCI7czoxMzoiT216ZXQgQnVsYW5hbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjE6Imhhc19oYWxhbF9jZXJ0aWZpY2F0ZSI7czo1OiJsYWJlbCI7czo1OiJIYWxhbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoiaGFzX3BpcnQiO3M6NToibGFiZWwiO3M6NDoiUElSVCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Njoic3RhdHVzIjtzOjU6ImxhYmVsIjtzOjY6IlN0YXR1cyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJpc19wdWJsaXNoZWQiO3M6NToibGFiZWwiO3M6OToiUHVibGlzaGVkIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aToxNTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToidmVyaWZpZWRCeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjE3OiJEaXZlcmlmaWthc2kgT2xlaCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6InZlcmlmaWVkX2F0IjtzOjU6ImxhYmVsIjtzOjE4OiJUYW5nZ2FsIFZlcmlmaWthc2kiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjE3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aToxODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTk7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImRlbGV0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkRlbGV0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiOGZhYzZlYjFjZWMyNjgwM2IzZjdmYjQ0MGEyNzExMWJfY29sdW1ucyI7YToxMDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjY6ImltYWdlcyI7czo1OiJsYWJlbCI7czo0OiJGb3RvIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjExOiJOYW1hIFByb2R1ayI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTg6InVta20uYnVzaW5lc3NfbmFtZSI7czo1OiJsYWJlbCI7czo0OiJVTUtNIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6InByaWNlIjtzOjU6ImxhYmVsIjtzOjU6IkhhcmdhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJzdG9jayI7czo1OiJsYWJlbCI7czo0OiJTdG9rIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoiaXNfYXZhaWxhYmxlIjtzOjU6ImxhYmVsIjtzOjg6IlRlcnNlZGlhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJpc19mZWF0dXJlZCI7czo1OiJsYWJlbCI7czo4OiJVbmdndWxhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjA7fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiY3JlYXRlZF9hdCI7czo1OiJsYWJlbCI7czo2OiJEaWJ1YXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjg7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkRpcGVyYmFydWkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjk7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImRlbGV0ZWRfYXQiO3M6NToibGFiZWwiO3M6NzoiRGloYXB1cyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI4ZmIxYjExY2E4ZDg0NDk5NWZkYzAwOTcxNzc1ZDZhZl9jb2x1bW5zIjthOjk6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJ0aXRsZSI7czo1OiJsYWJlbCI7czoxMzoiSnVkdWwgRG9rdW1lbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoidHlwZSI7czo1OiJsYWJlbCI7czo1OiJKZW5pcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjY6ImRvY3VtZW50YWJsZS5idXNpbmVzc19uYW1lIjtzOjU6ImxhYmVsIjtzOjQ6IlVNS00iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjowO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToiZmlsZV9uYW1lIjtzOjU6ImxhYmVsIjtzOjk6Ik5hbWEgRmlsZSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToiZmlsZV90eXBlIjtzOjU6ImxhYmVsIjtzOjk6IlRpcGUgRmlsZSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjA7fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJmaWxlX3NpemUiO3M6NToibGFiZWwiO3M6NjoiVWt1cmFuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE1OiJ1cGxvYWRlZEJ5Lm5hbWUiO3M6NToibGFiZWwiO3M6MTM6IkRpdXBsb2FkIE9sZWgiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjowO31pOjc7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTQ6IlRhbmdnYWwgVXBsb2FkIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTo4O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJEaXBlcmJhcnVpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDA6IjY2NTNhYzYyY2VhNDg3MWIxMGMxMzY1OTY2NGRiNjllX2NvbHVtbnMiO2E6MTE6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoibWVudG9yaW5nLmlkIjtzOjU6ImxhYmVsIjtzOjk6Ik1lbnRvcmluZyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToidGl0bGUiO3M6NToibGFiZWwiO3M6NToiVGl0bGUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJzY2hlZHVsZWRfYXQiO3M6NToibGFiZWwiO3M6MTI6IlNjaGVkdWxlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTY6ImR1cmF0aW9uX21pbnV0ZXMiO3M6NToibGFiZWwiO3M6MTY6IkR1cmF0aW9uIG1pbnV0ZXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjg6ImxvY2F0aW9uIjtzOjU6ImxhYmVsIjtzOjg6IkxvY2F0aW9uIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoibWVldGluZ19saW5rIjtzOjU6ImxhYmVsIjtzOjEyOiJNZWV0aW5nIGxpbmsiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjY6InN0YXR1cyI7czo1OiJsYWJlbCI7czo2OiJTdGF0dXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJzdGFydGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJTdGFydGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMjoiY29tcGxldGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEyOiJDb21wbGV0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo5O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aToxMDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX19czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1767026424),
('XUsRqnsQW9i8x2sLC34pVmkRF5lQjqLmqZsNKqML', 11, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQXQ5ajVTUUFyS1ZWTk5YbnduTkdUSk94SEpVVTgyak1JSHVnTXd4UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91bWttLW93bmVyL3Byb2R1Y3RzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRhUzJ5SlZ4MHYxOEVMQ0IwZkVRdkxPb25tOGJBb01EVjIxZGowVG1oVmpGYjR1cE4yYWprcSI7czo2OiJ0YWJsZXMiO2E6NDp7czo0MDoiY2E0YTJmNjNhNTY3NDYzNjMzODk4ZDk3MWNlNzBmMmJfY29sdW1ucyI7YToyMDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJidXNpbmVzc19uYW1lIjtzOjU6ImxhYmVsIjtzOjEwOiJOYW1hIFVzYWhhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoib3duZXIubmFtZSI7czo1OiJsYWJlbCI7czo3OiJQZW1pbGlrIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToib3duZXIucGhvbmUiO3M6NToibGFiZWwiO3M6NzoiVGVsZXBvbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjA7fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJ2aWxsYWdlIjtzOjU6ImxhYmVsIjtzOjk6IktlbHVyYWhhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjA7fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo4OiJkaXN0cmljdCI7czo1OiJsYWJlbCI7czo5OiJLZWNhbWF0YW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjowO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoiY2l0eSI7czo1OiJsYWJlbCI7czo0OiJLb3RhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJjYXRlZ29yeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjg6IkthdGVnb3JpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoiYnVzaW5lc3NfdHlwZSI7czo1OiJsYWJlbCI7czoxMToiU2thbGEgVXNhaGEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo4O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE2OiJlc3RhYmxpc2hlZF95ZWFyIjtzOjU6ImxhYmVsIjtzOjEzOiJUYWh1biBCZXJkaXJpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aTo5O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE0OiJlbXBsb3llZV9jb3VudCI7czo1OiJsYWJlbCI7czo4OiJLYXJ5YXdhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTU6Im1vbnRobHlfcmV2ZW51ZSI7czo1OiJsYWJlbCI7czoxMzoiT216ZXQgQnVsYW5hbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjE6Imhhc19oYWxhbF9jZXJ0aWZpY2F0ZSI7czo1OiJsYWJlbCI7czo1OiJIYWxhbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoiaGFzX3BpcnQiO3M6NToibGFiZWwiO3M6NDoiUElSVCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Njoic3RhdHVzIjtzOjU6ImxhYmVsIjtzOjY6IlN0YXR1cyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJpc19wdWJsaXNoZWQiO3M6NToibGFiZWwiO3M6OToiUHVibGlzaGVkIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aToxNTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToidmVyaWZpZWRCeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjE3OiJEaXZlcmlmaWthc2kgT2xlaCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6InZlcmlmaWVkX2F0IjtzOjU6ImxhYmVsIjtzOjE4OiJUYW5nZ2FsIFZlcmlmaWthc2kiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO31pOjE3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjEwOiJDcmVhdGVkIGF0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9aToxODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiVXBkYXRlZCBhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6MTk7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImRlbGV0ZWRfYXQiO3M6NToibGFiZWwiO3M6MTA6IkRlbGV0ZWQgYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjowO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjoxO319czo0MDoiOGZiMWIxMWNhOGQ4NDQ5OTVmZGMwMDk3MTc3NWQ2YWZfY29sdW1ucyI7YTo5OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToidGl0bGUiO3M6NToibGFiZWwiO3M6MTM6Ikp1ZHVsIERva3VtZW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6InR5cGUiO3M6NToibGFiZWwiO3M6NToiSmVuaXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjI2OiJkb2N1bWVudGFibGUuYnVzaW5lc3NfbmFtZSI7czo1OiJsYWJlbCI7czo0OiJVTUtNIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6ImZpbGVfbmFtZSI7czo1OiJsYWJlbCI7czo5OiJOYW1hIEZpbGUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6ImZpbGVfdHlwZSI7czo1OiJsYWJlbCI7czo5OiJUaXBlIEZpbGUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjowO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToiZmlsZV9zaXplIjtzOjU6ImxhYmVsIjtzOjY6IlVrdXJhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjA7fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToidXBsb2FkZWRCeS5uYW1lIjtzOjU6ImxhYmVsIjtzOjEzOiJEaXVwbG9hZCBPbGVoIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aTo3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjE0OiJUYW5nZ2FsIFVwbG9hZCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiRGlwZXJiYXJ1aSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fX1zOjQwOiI4ZmFjNmViMWNlYzI2ODAzYjNmN2ZiNDQwYTI3MTExYl9jb2x1bW5zIjthOjEwOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NjoiaW1hZ2VzIjtzOjU6ImxhYmVsIjtzOjQ6IkZvdG8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTE6Ik5hbWEgUHJvZHVrIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxODoidW1rbS5idXNpbmVzc19uYW1lIjtzOjU6ImxhYmVsIjtzOjQ6IlVNS00iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjowO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToicHJpY2UiO3M6NToibGFiZWwiO3M6NToiSGFyZ2EiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6InN0b2NrIjtzOjU6ImxhYmVsIjtzOjQ6IlN0b2siO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJpc19hdmFpbGFibGUiO3M6NToibGFiZWwiO3M6ODoiVGVyc2VkaWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjoxO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7YjowO31pOjY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6ImlzX2ZlYXR1cmVkIjtzOjU6ImxhYmVsIjtzOjg6IlVuZ2d1bGFuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MDt9aTo3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjU6ImxhYmVsIjtzOjY6IkRpYnVhdCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6ODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidXBkYXRlZF9hdCI7czo1OiJsYWJlbCI7czoxMDoiRGlwZXJiYXJ1aSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjA7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjE7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtiOjE7fWk6OTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoiZGVsZXRlZF9hdCI7czo1OiJsYWJlbCI7czo3OiJEaWhhcHVzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MDtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MTtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO2I6MTt9fXM6NDE6IjhmYWM2ZWIxY2VjMjY4MDNiM2Y3ZmI0NDBhMjcxMTFiX3Blcl9wYWdlIjtzOjI6IjUwIjt9fQ==', 1767023316);

-- --------------------------------------------------------

--
-- Table structure for table `umkms`
--

CREATE TABLE `umkms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `village` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL DEFAULT 'Cirebon',
  `province` varchar(255) NOT NULL DEFAULT 'Jawa Barat',
  `postal_code` varchar(5) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `business_type` enum('mikro','kecil','menengah') NOT NULL DEFAULT 'mikro',
  `description` text DEFAULT NULL,
  `established_year` year(4) DEFAULT NULL,
  `employee_count` int(11) NOT NULL DEFAULT 0,
  `monthly_revenue` decimal(15,2) DEFAULT NULL,
  `capital` decimal(15,2) DEFAULT NULL,
  `nib` varchar(255) DEFAULT NULL COMMENT 'Nomor Induk Berusaha',
  `has_halal_certificate` tinyint(1) NOT NULL DEFAULT 0,
  `has_pirt` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Pangan Industri Rumah Tangga',
  `website` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `photos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`photos`)),
  `status` enum('draft','pending','active','inactive','rejected') NOT NULL DEFAULT 'draft',
  `rejection_reason` text DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `umkms`
--

INSERT INTO `umkms` (`id`, `business_name`, `slug`, `address`, `village`, `district`, `city`, `province`, `postal_code`, `category_id`, `business_type`, `description`, `established_year`, `employee_count`, `monthly_revenue`, `capital`, `nib`, `has_halal_certificate`, `has_pirt`, `website`, `facebook`, `instagram`, `tiktok`, `whatsapp`, `latitude`, `longitude`, `logo`, `photos`, `status`, `rejection_reason`, `verified_at`, `verified_by`, `created_by`, `owner_id`, `is_published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kerajinan Kayu Jati Ani', 'kerajinan-kayu-jati-ani-651', 'Jl. Sunan Gunung Jati No. 117', 'Pekalipan', 'Lemahwungkuk', 'Cirebon', 'Jawa Barat', '45182', 25, 'menengah', 'Memproduksi kerajinan tangan berkualitas tinggi dengan bahan pilihan. Setiap produk dikerjakan oleh pengrajin berpengalaman.', '2024', 23, 15486603.71, 43726124.58, NULL, 0, 0, 'http://www.heathcote.com/iste-quisquam-necessitatibus-sit-dolor-natus-quisquam-et', 'jaycee29', 'mann.ashley', NULL, '6288203936339', -6.73877900, 108.55242800, '/storage/umkms/1/logo.jpg', '[\"\\/storage\\/umkms\\/1\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 17, 25, 7, 1, '2025-12-20 09:41:53', '2025-12-20 09:41:58', NULL),
(2, 'Batik Trusmi Mang', 'batik-trusmi-mang-125', 'Jl. Siliwangi No. 100', 'Kesenden', 'Harjamukti', 'Cirebon', 'Jawa Barat', '45150', 14, 'menengah', 'Batik kami menggunakan pewarna alami dan kain berkualitas. Setiap kain batik dikerjakan dengan detail dan penuh ketelitian oleh tangan-tangan terampil.', '2017', 9, 21258852.94, 122042500.06, '99523485284730', 0, 0, 'http://www.leuschke.com/architecto-quas-facilis-facilis-ex', NULL, NULL, NULL, '6285431338715', -6.74217200, 108.56618500, '/storage/umkms/2/logo.jpg', '[\"\\/storage\\/umkms\\/2\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 23, 25, 25, 1, '2025-12-20 09:41:58', '2025-12-20 09:42:01', NULL),
(3, 'Kerupuk Melarat Pak Haji', 'kerupuk-melarat-pak-haji-591', 'Jl. Kalijaga No. 54', 'Pegambiran', 'Lemahwungkuk', 'Cirebon', 'Jawa Barat', '45117', 1, 'menengah', 'Usaha kuliner keluarga yang menyajikan menu khas Cirebon dengan cita rasa yang mantap. Tempat bersih dan nyaman untuk bersantap.', '2024', 22, 32919989.55, 33634633.08, '36933608119761', 1, 1, NULL, NULL, NULL, NULL, '6283325221293', -6.73290400, 108.54015000, '/storage/umkms/3/logo.jpg', '[\"\\/storage\\/umkms\\/3\\/photo0.jpg\",\"\\/storage\\/umkms\\/3\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 6, 21, 13, 1, '2025-12-20 09:42:01', '2025-12-20 09:42:11', NULL),
(4, 'Terasi Teh', 'terasi-teh-47', 'Jl. Ciremai No. 69', 'Sunyaragi', 'Kejaksan', 'Cirebon', 'Jawa Barat', '45190', 1, 'menengah', 'Produksi makanan dengan standar kebersihan yang tinggi. Semua produk halal dan aman dikonsumsi.', '2015', 14, 23358881.50, 41991652.20, NULL, 0, 1, NULL, 'hazel82', 'marianna.russel', NULL, '6288276014905', -6.72299600, 108.55637200, '/storage/umkms/4/logo.jpg', '[\"\\/storage\\/umkms\\/4\\/photo0.jpg\",\"\\/storage\\/umkms\\/4\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 8, 13, 13, 1, '2025-12-20 09:42:11', '2025-12-20 09:42:17', NULL),
(5, 'Batik Trusmi Dewi', 'batik-trusmi-dewi-954', 'Jl. Ciremai No. 92', 'Pekalipan', 'Kesambi', 'Cirebon', 'Jawa Barat', '45138', 10, 'kecil', 'Pusat batik Cirebon yang menyediakan berbagai jenis batik untuk keperluan busana dan interior. Melayani pembelian retail dan grosir.', '2023', 8, 36374090.39, 119474640.01, NULL, 1, 0, 'http://ankunding.com/modi-eum-et-aut-eos-commodi-ipsa-qui', NULL, 'aschroeder', 'pbotsford', '6283819114014', -6.73937900, 108.55434600, '/storage/umkms/5/logo.jpg', '[\"\\/storage\\/umkms\\/5\\/photo0.jpg\",\"\\/storage\\/umkms\\/5\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 17, 6, 20, 1, '2025-12-20 09:42:17', '2025-12-20 09:42:22', NULL),
(6, 'Konveksi Teh', 'konveksi-teh-236', 'Jl. Tuparev No. 140', 'Larangan', 'Kejaksan', 'Cirebon', 'Jawa Barat', '45125', 4, 'menengah', 'Produksi pakaian dan aksesoris fashion dengan desain modern dan trendy. Menggunakan bahan berkualitas dengan jahitan rapi.', '2008', 4, 49841548.54, 150345494.43, '83157905867348', 0, 0, 'http://ferry.com/eos-impedit-id-dolore-qui-velit-blanditiis-soluta-ex', 'fconsidine', NULL, 'cpacocha', NULL, -6.73858700, 108.56404600, '/storage/umkms/6/logo.jpg', '[\"\\/storage\\/umkms\\/6\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 10, 3, 23, 1, '2025-12-20 09:42:22', '2025-12-20 09:42:25', NULL),
(7, 'Tas Rajut Mang', 'tas-rajut-mang-62', 'Jl. Tuparev No. 2', 'Kejaksan', 'Kejaksan', 'Cirebon', 'Jawa Barat', '45191', 4, 'menengah', 'Menyediakan layanan jahit dan konveksi dengan hasil rapi dan berkualitas. Melayani pembuatan seragam, baju pesta, dan pakaian custom.', '2015', 13, 35027323.73, 26315925.54, '75664826560963', 0, 0, NULL, NULL, NULL, NULL, NULL, -6.74389200, 108.56136900, '/storage/umkms/7/logo.jpg', '[\"\\/storage\\/umkms\\/7\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 1, 8, 16, 1, '2025-12-20 09:42:25', '2025-12-20 09:42:28', NULL),
(8, 'Bordir Pak Haji', 'bordir-pak-haji-349', 'Jl. Siliwangi No. 13', 'Lemahwungkuk', 'Pekalipan', 'Cirebon', 'Jawa Barat', '45111', 1, 'menengah', 'Menyediakan layanan jahit dan konveksi dengan hasil rapi dan berkualitas. Melayani pembuatan seragam, baju pesta, dan pakaian custom.', '2006', 11, 34156174.78, 173449137.39, NULL, 0, 0, NULL, NULL, NULL, NULL, '6280608456358', -6.75181700, 108.55817700, '/storage/umkms/8/logo.jpg', '[\"\\/storage\\/umkms\\/8\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 17, 22, 5, 1, '2025-12-20 09:42:28', '2025-12-20 09:42:31', NULL),
(9, 'Empal Asem Rina', 'empal-asem-rina-34', 'Jl. Sunan Gunung Jati No. 105', 'Kesenden', 'Kesambi', 'Cirebon', 'Jawa Barat', '45134', 1, 'menengah', 'Menyediakan hidangan khas Cirebon dengan porsi yang pas dan harga terjangkau. Cocok untuk santap pagi, siang, maupun malam bersama keluarga.', '2015', 24, 20495548.99, 52383086.67, NULL, 1, 0, NULL, NULL, 'jamarcus08', NULL, NULL, -6.73559800, 108.55781900, '/storage/umkms/9/logo.jpg', '[\"\\/storage\\/umkms\\/9\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 1, 22, 11, 1, '2025-12-20 09:42:31', '2025-12-20 09:42:35', NULL),
(10, 'Petis Teh', 'petis-teh-488', 'Jl. Tuparev No. 22', 'Pekalipan', 'Pekalipan', 'Cirebon', 'Jawa Barat', '45187', 1, 'mikro', 'Memproduksi makanan olahan dengan bahan berkualitas dan proses yang higienis. Terdaftar PIRT dan memiliki izin usaha.', '2008', 3, 36219216.96, 174944904.16, NULL, 1, 1, NULL, NULL, NULL, NULL, '6282261516275', -6.74132600, 108.55555700, '/storage/umkms/10/logo.jpg', '[\"\\/storage\\/umkms\\/10\\/photo0.jpg\",\"\\/storage\\/umkms\\/10\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 4, 11, 18, 1, '2025-12-20 09:42:35', '2025-12-20 09:42:42', NULL),
(11, 'Kerajinan Kulit Teh', 'kerajinan-kulit-teh-515', 'Jl. Tuparev No. 74', 'Sunyaragi', 'Pekalipan', 'Cirebon', 'Jawa Barat', '45170', 14, 'mikro', 'Memproduksi kerajinan tangan berkualitas tinggi dengan bahan pilihan. Setiap produk dikerjakan oleh pengrajin berpengalaman.', '2017', 23, 31129156.31, 26200069.52, '25405495554194', 0, 0, NULL, NULL, 'cassie97', NULL, '6280168378520', -6.74490700, 108.54897900, '/storage/umkms/11/logo.jpg', '[\"\\/storage\\/umkms\\/11\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 1, 1, 7, 1, '2025-12-20 09:42:42', '2025-12-20 09:42:46', NULL),
(12, 'Batik Dewi', 'batik-dewi-942', 'Jl. Pemuda No. 26', 'Larangan', 'Pekalipan', 'Cirebon', 'Jawa Barat', '45169', 14, 'mikro', 'Memproduksi dan menjual batik khas Cirebon dengan motif megamendung dan wadasan. Dikerjakan oleh pengrajin berpengalaman dengan teknik tulis dan cap.', '2021', 6, 45451603.43, 21441281.87, NULL, 0, 0, 'https://www.bashirian.org/fuga-sapiente-sunt-qui-voluptatum-rerum', NULL, 'ahartmann', 'schulist.clare', '6286016208952', -6.75177300, 108.54437400, '/storage/umkms/12/logo.jpg', '[\"\\/storage\\/umkms\\/12\\/photo0.jpg\",\"\\/storage\\/umkms\\/12\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 24, 16, 3, 1, '2025-12-20 09:42:46', '2025-12-20 09:42:51', NULL),
(13, 'Batik Dewi', 'batik-dewi-130', 'Jl. Pemuda No. 70', 'Pulasaren', 'Lemahwungkuk', 'Cirebon', 'Jawa Barat', '45173', 13, 'menengah', 'Pusat batik Cirebon yang menyediakan berbagai jenis batik untuk keperluan busana dan interior. Melayani pembelian retail dan grosir.', '2024', 5, 46045002.46, 11613078.22, '57190232640638', 0, 0, NULL, NULL, 'phyllis38', NULL, '6285284413459', -6.72710800, 108.56912700, '/storage/umkms/13/logo.jpg', '[\"\\/storage\\/umkms\\/13\\/photo0.jpg\",\"\\/storage\\/umkms\\/13\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 22, 14, 19, 1, '2025-12-20 09:42:51', '2025-12-20 09:42:56', NULL),
(14, 'Tahu Gejrot Mas', 'tahu-gejrot-mas-156', 'Jl. Kalijaga No. 9', 'Kejaksan', 'Pekalipan', 'Cirebon', 'Jawa Barat', '45144', 1, 'mikro', 'Warung kami sudah berdiri sejak puluhan tahun lalu, melayani pelanggan dengan cita rasa khas Cirebon yang tidak berubah. Proses memasak masih menggunakan cara tradisional.', '2018', 12, 10469011.42, 196249566.17, NULL, 1, 1, NULL, NULL, 'cdooley', NULL, '6281034319755', -6.74302600, 108.55104900, '/storage/umkms/14/logo.jpg', '[\"\\/storage\\/umkms\\/14\\/photo0.jpg\",\"\\/storage\\/umkms\\/14\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 14, 6, 25, 1, '2025-12-20 09:42:56', '2025-12-20 09:43:03', NULL),
(15, 'Kerajinan Kayu Jati Teh', 'kerajinan-kayu-jati-teh-910', 'Jl. Siliwangi No. 8', 'Kesenden', 'Lemahwungkuk', 'Cirebon', 'Jawa Barat', '45124', 19, 'menengah', 'Kerajinan kami mengutamakan kualitas dan keindahan. Setiap produk melalui proses quality control yang ketat.', '2011', 13, 12047943.13, 106350045.75, NULL, 1, 0, 'https://sauer.com/dolore-iste-voluptatem-numquam-animi-ipsam.html', NULL, 'lora71', NULL, '6288668193235', -6.74774000, 108.55671000, '/storage/umkms/15/logo.jpg', '[\"\\/storage\\/umkms\\/15\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 2, 1, 25, 1, '2025-12-20 09:43:03', '2025-12-20 09:43:06', NULL),
(16, 'Kerupuk Melarat Ani', 'kerupuk-melarat-ani-844', 'Jl. Sunan Gunung Jati No. 5', 'Larangan', 'Harjamukti', 'Cirebon', 'Jawa Barat', '45178', 1, 'mikro', 'Usaha kuliner keluarga yang menyajikan menu khas Cirebon dengan cita rasa yang mantap. Tempat bersih dan nyaman untuk bersantap.', '2006', 19, 7409031.64, 134323981.24, NULL, 0, 1, NULL, NULL, 'merlin88', NULL, '6285383320853', -6.74432900, 108.54445600, '/storage/umkms/16/logo.jpg', '[\"\\/storage\\/umkms\\/16\\/photo0.jpg\",\"\\/storage\\/umkms\\/16\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 13, 18, 6, 1, '2025-12-20 09:43:06', '2025-12-20 09:43:12', NULL),
(17, 'Jajanan Pasar Sari', 'jajanan-pasar-sari-270', 'Jl. Pemuda No. 40', 'Pekalipan', 'Harjamukti', 'Cirebon', 'Jawa Barat', '45136', 1, 'kecil', 'Usaha makanan rumahan dengan cita rasa khas keluarga. Produk selalu fresh dan dikemas dengan baik.', '2019', 5, 40987158.93, 152807902.92, NULL, 0, 1, NULL, 'kub.sabina', 'pklocko', NULL, '6280614470631', -6.73512000, 108.55111800, '/storage/umkms/17/logo.jpg', '[\"\\/storage\\/umkms\\/17\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 6, 22, 19, 1, '2025-12-20 09:43:12', '2025-12-20 09:43:14', NULL),
(18, 'Petis Sari', 'petis-sari-908', 'Jl. Tuparev No. 83', 'Pegambiran', 'Harjamukti', 'Cirebon', 'Jawa Barat', '45118', 1, 'menengah', 'Menyediakan berbagai jenis makanan olahan siap saji dan siap masak. Cocok untuk oleh-oleh khas Cirebon.', '2019', 3, 37928942.29, 195151584.93, NULL, 0, 1, NULL, NULL, 'walton.herzog', 'myles.morar', '6280978041094', -6.72281600, 108.54338000, '/storage/umkms/18/logo.jpg', '[\"\\/storage\\/umkms\\/18\\/photo0.jpg\",\"\\/storage\\/umkms\\/18\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 3, 20, 20, 1, '2025-12-20 09:43:14', '2025-12-20 09:43:20', NULL),
(19, 'Kerajinan Kayu Jati Ani', 'kerajinan-kayu-jati-ani-7', 'Jl. Ciremai No. 23', 'Sunyaragi', 'Pekalipan', 'Cirebon', 'Jawa Barat', '45142', 18, 'kecil', 'Kerajinan kami mengutamakan kualitas dan keindahan. Setiap produk melalui proses quality control yang ketat.', '2018', 23, 25733889.25, 44160417.73, '42975398720176', 0, 0, NULL, 'wisoky.elian', 'ujones', NULL, '6289127476875', -6.73777200, 108.55073700, '/storage/umkms/19/logo.jpg', '[\"\\/storage\\/umkms\\/19\\/photo0.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 25, 2, 4, 1, '2025-12-20 09:43:20', '2025-12-20 09:43:23', NULL),
(20, 'Roti Mang', 'roti-mang-110', 'Jl. Pemuda No. 92', 'Pulasaren', 'Harjamukti', 'Cirebon', 'Jawa Barat', '45181', 1, 'menengah', 'Produksi makanan dengan standar kebersihan yang tinggi. Semua produk halal dan aman dikonsumsi.', '2008', 13, 36857559.38, 94065293.53, NULL, 0, 0, NULL, NULL, 'halvorson.cristian', NULL, '6286082616444', -6.73724100, 108.56508900, '/storage/umkms/20/logo.jpg', '[\"\\/storage\\/umkms\\/20\\/photo0.jpg\",\"\\/storage\\/umkms\\/20\\/photo1.jpg\"]', 'active', NULL, '2025-12-20 09:41:53', 1, 15, 12, 1, '2025-12-20 09:43:23', '2025-12-20 09:43:28', NULL),
(21, 'Kerupuk Melarat Mang', 'kerupuk-melarat-mang-152', 'Jl. Sunan Gunung Jati No. 120', 'Kesenden', 'Kesambi', 'Cirebon', 'Jawa Barat', '45111', 1, 'mikro', 'Warung kami sudah berdiri sejak puluhan tahun lalu, melayani pelanggan dengan cita rasa khas Cirebon yang tidak berubah. Proses memasak masih menggunakan cara tradisional.', '2011', 15, 49236126.66, 162684273.41, NULL, 0, 0, NULL, 'missouri.kub', 'feest.roxanne', 'rippin.milo', '6287379154550', -6.73093500, 108.55126400, '/storage/umkms/21/logo.jpg', '[\"\\/storage\\/umkms\\/21\\/photo0.jpg\"]', 'pending', NULL, NULL, 15, 1, 19, 0, '2025-12-20 09:43:28', '2025-12-20 09:43:31', NULL),
(22, 'Bordir Dewi', 'bordir-dewi-736', 'Jl. Sunan Gunung Jati No. 26', 'Pekalipan', 'Lemahwungkuk', 'Cirebon', 'Jawa Barat', '45166', 1, 'kecil', 'Usaha konveksi yang sudah berpengalaman melayani berbagai instansi dan perorangan. Harga bersaing dengan kualitas terjamin.', '2017', 19, 21978155.98, 117562777.15, NULL, 0, 0, NULL, 'ebert.sierra', NULL, NULL, '6280856905374', -6.75467500, 108.56824600, '/storage/umkms/22/logo.jpg', '[\"\\/storage\\/umkms\\/22\\/photo0.jpg\",\"\\/storage\\/umkms\\/22\\/photo1.jpg\"]', 'pending', NULL, NULL, 20, 22, 12, 0, '2025-12-20 09:43:31', '2025-12-20 09:43:37', NULL),
(23, 'Kerajinan Keramik Pak Haji', 'kerajinan-keramik-pak-haji-327', 'Jl. Sunan Gunung Jati No. 92', 'Sunyaragi', 'Kesambi', 'Cirebon', 'Jawa Barat', '45157', 25, 'kecil', 'Kerajinan kami mengutamakan kualitas dan keindahan. Setiap produk melalui proses quality control yang ketat.', '2013', 10, 44608655.81, 44119978.52, NULL, 0, 0, NULL, NULL, 'hokeefe', 'johnson.maurice', '6281189892800', -6.72088900, 108.55553600, '/storage/umkms/23/logo.jpg', '[\"\\/storage\\/umkms\\/23\\/photo0.jpg\",\"\\/storage\\/umkms\\/23\\/photo1.jpg\"]', 'pending', NULL, '2025-10-16 04:11:01', 5, 1, 7, 0, '2025-12-20 09:43:37', '2025-12-20 09:43:42', NULL),
(24, 'Batik Ibu Haji', 'batik-ibu-haji-635', 'Jl. Sunan Gunung Jati No. 94', 'Kesenden', 'Pekalipan', 'Cirebon', 'Jawa Barat', '45139', 16, 'kecil', 'Batik kami menggunakan pewarna alami dan kain berkualitas. Setiap kain batik dikerjakan dengan detail dan penuh ketelitian oleh tangan-tangan terampil.', '2009', 19, 34310329.95, 91855832.58, '87135678986818', 0, 0, NULL, NULL, NULL, NULL, '6284216460054', -6.72683800, 108.55966200, '/storage/umkms/24/logo.jpg', '[\"\\/storage\\/umkms\\/24\\/photo0.jpg\"]', 'pending', NULL, '2025-02-26 15:31:19', 12, 25, 1, 0, '2025-12-20 09:43:42', '2025-12-20 09:43:45', NULL),
(25, 'Anyaman Bambu Ibu Haji', 'anyaman-bambu-ibu-haji-731', 'Jl. Pemuda No. 59', 'Larangan', 'Kesambi', 'Cirebon', 'Jawa Barat', '45141', 10, 'kecil', 'Usaha kerajinan yang sudah melayani pelanggan dari berbagai daerah. Menerima pesanan custom sesuai kebutuhan dan keinginan pembeli.', '2010', 20, 19435697.22, 178035037.08, '37272379492489', 0, 0, NULL, NULL, 'bahringer.norene', 'jasmin.lowe', '6283223522444', -6.72338800, 108.54834200, '/storage/umkms/25/logo.jpg', '[\"\\/storage\\/umkms\\/25\\/photo0.jpg\",\"\\/storage\\/umkms\\/25\\/photo1.jpg\"]', 'pending', NULL, '2025-02-16 09:41:19', 16, 25, 6, 0, '2025-12-20 09:43:45', '2025-12-20 09:43:50', NULL),
(26, 'Petis Mbak', 'petis-mbak-751', 'Jl. Pemuda No. 55', 'Pulasaren', 'Kejaksan', 'Cirebon', 'Jawa Barat', '45152', 1, 'mikro', 'Produksi makanan dengan standar kebersihan yang tinggi. Semua produk halal dan aman dikonsumsi.', '2021', 18, 46523868.41, 92170320.67, '06302489589771', 1, 1, NULL, NULL, 'manderson', NULL, NULL, -6.72771700, 108.56482400, '/storage/umkms/26/logo.jpg', '[\"\\/storage\\/umkms\\/26\\/photo0.jpg\"]', 'draft', NULL, NULL, 9, 7, 3, 0, '2025-12-20 09:43:50', '2025-12-20 09:43:52', NULL),
(27, 'Warung Empal Gentong Bu Mang', 'warung-empal-gentong-bu-mang-134', 'Jl. Kartini No. 18', 'Kesenden', 'Harjamukti', 'Cirebon', 'Jawa Barat', '45137', 1, 'kecil', 'Menyediakan hidangan khas Cirebon dengan porsi yang pas dan harga terjangkau. Cocok untuk santap pagi, siang, maupun malam bersama keluarga.', '2011', 7, 23711143.55, 67839745.34, NULL, 0, 1, NULL, 'ahuel', 'greenholt.francisca', NULL, '6282637009926', -6.74235200, 108.55941900, '/storage/umkms/27/logo.jpg', '[\"\\/storage\\/umkms\\/27\\/photo0.jpg\",\"\\/storage\\/umkms\\/27\\/photo1.jpg\"]', 'draft', NULL, '2025-10-25 23:32:02', 3, 5, 10, 0, '2025-12-20 09:43:52', '2025-12-20 09:43:58', NULL),
(28, 'Anyaman Bambu Rina', 'anyaman-bambu-rina-549', 'Jl. Tuparev No. 148', 'Lemahwungkuk', 'Lemahwungkuk', 'Cirebon', 'Jawa Barat', '45173', 18, 'menengah', 'Menghasilkan produk kerajinan dengan sentuhan seni tradisional dan modern. Cocok untuk souvenir, hadiah, atau koleksi pribadi.', '2011', 4, 13994066.12, 73068725.92, NULL, 0, 0, 'https://www.ullrich.com/aut-delectus-ab-dolores-fuga-vel', 'murphy.bulah', NULL, NULL, NULL, -6.73583500, 108.54729000, '/storage/umkms/28/logo.jpg', '[\"\\/storage\\/umkms\\/28\\/photo0.jpg\",\"\\/storage\\/umkms\\/28\\/photo1.jpg\"]', 'draft', NULL, NULL, 23, 12, 24, 0, '2025-12-20 09:43:58', '2025-12-20 09:44:03', NULL),
(29, 'Jahit Yanti', 'jahit-yanti-494', 'Jl. Kartini No. 30', 'Pulasaren', 'Kesambi', 'Cirebon', 'Jawa Barat', '45186', 22, 'mikro', 'Produksi pakaian dan aksesoris fashion dengan desain modern dan trendy. Menggunakan bahan berkualitas dengan jahitan rapi.', '2005', 2, 19005658.93, 182814009.57, '91189554289797', 1, 0, NULL, 'uhill', NULL, 'chanel34', NULL, -6.72585800, 108.55303900, '/storage/umkms/29/logo.jpg', '[\"\\/storage\\/umkms\\/29\\/photo0.jpg\",\"\\/storage\\/umkms\\/29\\/photo1.jpg\"]', 'draft', NULL, '2025-03-30 19:19:08', 23, 23, 9, 0, '2025-12-20 09:44:03', '2025-12-20 09:44:10', NULL),
(30, 'Kerajinan Kulit Sari', 'kerajinan-kulit-sari-671', 'Jl. Kalijaga No. 11', 'Pegambiran', 'Pekalipan', 'Cirebon', 'Jawa Barat', '45123', 7, 'menengah', 'Memproduksi kerajinan tangan berkualitas tinggi dengan bahan pilihan. Setiap produk dikerjakan oleh pengrajin berpengalaman.', '2007', 9, 16342540.46, 137042254.12, NULL, 0, 0, NULL, NULL, 'ernser.kaley', NULL, '6288685991459', -6.74326500, 108.55703100, '/storage/umkms/30/logo.jpg', '[\"\\/storage\\/umkms\\/30\\/photo0.jpg\",\"\\/storage\\/umkms\\/30\\/photo1.jpg\"]', 'draft', NULL, NULL, 24, 6, 21, 0, '2025-12-20 09:44:10', '2025-12-20 09:44:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `nik`, `email`, `phone`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', NULL, 'admin@example.com', NULL, '2025-12-20 09:41:52', '$2y$12$74qGREk71SEZq43EGNMn9OlTIfMaFar5G8yLh5fqgB35VcX7ZAe.O', NULL, NULL, NULL, NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(2, 'Admin Panel', NULL, 'adminpanel@example.com', NULL, '2025-12-20 09:41:52', '$2y$12$vZnCS6GJky6fIfp8971mZeRrwhj2V3KCshW81ZfmpnxvN8TeW2ery', NULL, NULL, NULL, NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(3, 'Staff Panel', NULL, 'staff@example.com', NULL, '2025-12-20 09:41:52', '$2y$12$fZ4JIy8v9onImQETfmaBFe2VSBYyNy4pV20ehD6rJsNndKu8fizx6', NULL, NULL, NULL, NULL, '2025-12-20 09:41:52', '2025-12-20 09:41:52'),
(4, 'Mentor Panel', NULL, 'mentor@example.com', NULL, '2025-12-20 09:41:53', '$2y$12$mpGV1bxk0yiQXtBgiO/wkOmpco5RvV0uQFnfb66pfYkJjAhA4YEoW', NULL, NULL, NULL, NULL, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(5, 'UMKM Owner', NULL, 'umkm@example.com', NULL, '2025-12-20 09:41:53', '$2y$12$Vb/sHMDzsjQF3Cy75s/XEedvZE1m/Aitcnb205sD1OiF5ewUQhzru', NULL, NULL, NULL, NULL, '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(6, 'Constantin Toy', NULL, 'arch.marvin@example.com', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'znwh45tIDqLnIv1jxpHt37mQ99JWNBsIr9yCO4F81LJ5VmHgbbNgrT07dMVu', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(7, 'Dr. Domenica Volkman', NULL, 'shad07@example.org', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, '5rSeMilsKv', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(8, 'Eveline Blick', NULL, 'myrtie.treutel@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'AWW8bThzOx', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(9, 'Mr. Aron Tremblay', NULL, 'bridgette29@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'EYZY0poCta', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(10, 'Jett Hermann', NULL, 'antonette.rippin@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, '4gKF9UeuY5', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(11, 'Rosendo Tremblay IV', NULL, 'terry.cristian@example.com', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'ZQ5VpF78c6', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(12, 'Mr. Raphael O\'Keefe III', NULL, 'ubosco@example.com', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'L7yeuERCfO', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(13, 'Lyric VonRueden', NULL, 'alexa48@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, '0bvf2ztQMl', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(14, 'Price Wehner', NULL, 'nyasia50@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'eA3Xa3RXro', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(15, 'Leonel Wilderman', NULL, 'phyllis23@example.com', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, '7kK46nx8Sp', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(16, 'Dr. Vicente Rodriguez', NULL, 'raquel17@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'bvRlDhJYFk', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(17, 'Miles Miller', NULL, 'terrill.turcotte@example.org', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'Z9JBuNrB0Y', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(18, 'Bella Ebert', NULL, 'vrunolfsson@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'lixggX9CEa', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(19, 'Jameson Bogan', NULL, 'white.freddy@example.org', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, '8F7CBcH1kb', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(20, 'Mrs. Margarette Farrell', NULL, 'isabella.sauer@example.org', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'AaLM6KQ5zC', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(21, 'Lorenza Gutmann', NULL, 'kilback.kiera@example.com', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'cVhHz4YkE4', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(22, 'Dr. Louisa Haag DVM', NULL, 'ecartwright@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'A7q7vXnd4F', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(23, 'Rosendo Kiehn', NULL, 'gutmann.connie@example.net', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'nFoPMNtqyb', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(24, 'Mr. London Hand', NULL, 'leila.cole@example.com', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'gmmqxTfCv9', '2025-12-20 09:41:53', '2025-12-20 09:41:53'),
(25, 'Miss Reta Wolff', NULL, 'wolf.lucas@example.org', NULL, '2025-12-20 09:41:53', '$2y$12$aS2yJVx0v18ELCB0fEQvLOonm8bAoMDV21dj0TmhVjFb4upN2ajkq', NULL, NULL, NULL, 'VWQggcWiV6', '2025-12-20 09:41:53', '2025-12-20 09:41:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_documentable_type_documentable_id_index` (`documentable_type`,`documentable_id`),
  ADD KEY `documents_uploaded_by_foreign` (`uploaded_by`),
  ADD KEY `documents_documentable_type_documentable_id_type_index` (`documentable_type`,`documentable_id`,`type`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mentorings`
--
ALTER TABLE `mentorings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mentorings_umkm_id_status_index` (`umkm_id`,`status`),
  ADD KEY `mentorings_mentor_id_status_index` (`mentor_id`,`status`);

--
-- Indexes for table `mentoring_sessions`
--
ALTER TABLE `mentoring_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mentoring_sessions_mentoring_id_status_index` (`mentoring_id`,`status`),
  ADD KEY `mentoring_sessions_scheduled_at_index` (`scheduled_at`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_role_permission_id_role_id_unique` (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_umkm_id_slug_unique` (`umkm_id`,`slug`),
  ADD KEY `products_umkm_id_is_available_index` (`umkm_id`,`is_available`);
ALTER TABLE `products` ADD FULLTEXT KEY `products_name_description_fulltext` (`name`,`description`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_user_role_id_user_id_unique` (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `umkms`
--
ALTER TABLE `umkms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `umkms_slug_unique` (`slug`),
  ADD KEY `umkms_verified_by_foreign` (`verified_by`),
  ADD KEY `umkms_created_by_foreign` (`created_by`),
  ADD KEY `umkms_status_is_published_index` (`status`,`is_published`),
  ADD KEY `umkms_category_id_business_type_index` (`category_id`,`business_type`),
  ADD KEY `umkms_owner_id_index` (`owner_id`);
ALTER TABLE `umkms` ADD FULLTEXT KEY `umkms_business_name_owner_name_description_fulltext` (`business_name`,`description`);
ALTER TABLE `umkms` ADD FULLTEXT KEY `umkms_business_name_description_fulltext` (`business_name`,`description`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nik_unique` (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mentorings`
--
ALTER TABLE `mentorings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mentoring_sessions`
--
ALTER TABLE `mentoring_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `umkms`
--
ALTER TABLE `umkms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `mentorings`
--
ALTER TABLE `mentorings`
  ADD CONSTRAINT `mentorings_mentor_id_foreign` FOREIGN KEY (`mentor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mentorings_umkm_id_foreign` FOREIGN KEY (`umkm_id`) REFERENCES `umkms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mentoring_sessions`
--
ALTER TABLE `mentoring_sessions`
  ADD CONSTRAINT `mentoring_sessions_mentoring_id_foreign` FOREIGN KEY (`mentoring_id`) REFERENCES `mentorings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_umkm_id_foreign` FOREIGN KEY (`umkm_id`) REFERENCES `umkms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `umkms`
--
ALTER TABLE `umkms`
  ADD CONSTRAINT `umkms_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `umkms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `umkms_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `umkms_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
