import { CatalogFilters } from '@/components/catalog/catalog-filters';
import { CatalogGrid } from '@/components/catalog/catalog-grid';
import { CatalogHeader } from '@/components/catalog/catalog-header';
import { CatalogPagination } from '@/components/catalog/catalog-pagination';
import { Footer } from '@/components/footer';
import { Navigation } from '@/components/navigation';
import type { Category, PaginatedUmkms, UmkmFilters } from '@/types/umkm';
import { Head } from '@inertiajs/react';

interface CatalogPageProps {
    umkms: PaginatedUmkms;
    categories: Category[];
    districts: string[];
    filters: UmkmFilters;
}

export default function CatalogPage({
    umkms,
    categories,
    districts,
    filters,
}: CatalogPageProps) {
    return (
        <>
            <Head title="Katalog UMKM - SI UMKM Cirebon" />

            <div className="min-h-screen">
                <Navigation />
                <main>
                    <CatalogHeader total={umkms.total} filters={filters} />
                    <div className="container mx-auto px-4 py-8">
                        <div className="grid gap-8 lg:grid-cols-[280px_1fr]">
                            <aside className="lg:sticky lg:top-24 lg:h-fit">
                                <CatalogFilters
                                    categories={categories}
                                    districts={districts}
                                    filters={filters}
                                />
                            </aside>
                            <div className="space-y-6">
                                <CatalogGrid umkms={umkms.data} />
                                <CatalogPagination paginator={umkms} />
                            </div>
                        </div>
                    </div>
                </main>
                <Footer />
            </div>
        </>
    );
}
