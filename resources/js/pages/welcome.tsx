import { CategoriesSection } from '@/components/categories-section';
import { CtaSection } from '@/components/cta-section';
import { FeaturedUmkmSection } from '@/components/featured-umkm-section';
import { Footer } from '@/components/footer';
import { HeroSection } from '@/components/hero-section';
import { Navigation } from '@/components/navigation';
import { StatsSection } from '@/components/stats-section';
import type { FeaturedUmkm, HomeStats, TopCategory } from '@/types/umkm';
import { Head } from '@inertiajs/react';

interface HomePageProps {
    stats: HomeStats;
    featured_umkms: FeaturedUmkm[];
    top_categories: TopCategory[];
}

export default function HomePage({
    stats,
    featured_umkms,
    top_categories,
}: HomePageProps) {
    return (
        <>
            <Head title="SI UMKM Cirebon - Sistem Informasi UMKM Kota Cirebon" />

            <div className="min-h-screen">
                <Navigation />
                <main>
                    <HeroSection />
                    <StatsSection stats={stats} />
                    <FeaturedUmkmSection umkms={featured_umkms} />
                    <CategoriesSection categories={top_categories} />
                    <CtaSection />
                </main>
                <Footer />
            </div>
        </>
    );
}
