import { Footer } from '@/components/footer';
import { Navigation } from '@/components/navigation';
import { UmkmContactCard } from '@/components/umkm-detail/umkm-contact-card';
import { UmkmDetailGallery } from '@/components/umkm-detail/umkm-detail-gallery';
import { UmkmDetailHeader } from '@/components/umkm-detail/umkm-detail-header';
import { UmkmDetailInfo } from '@/components/umkm-detail/umkm-detail-info';
import { UmkmDetailProducts } from '@/components/umkm-detail/umkm-detail-products';
import type { Umkm } from '@/types/umkm';
import { Head } from '@inertiajs/react';

interface UmkmDetailPageProps {
    umkm: Umkm;
}

export default function UmkmDetailPage({ umkm }: UmkmDetailPageProps) {
    return (
        <>
            <Head title={`${umkm.business_name} - SI UMKM Cirebon`} />

            <div className="min-h-screen">
                <Navigation />
                <main>
                    <UmkmDetailHeader umkm={umkm} />
                    <div className="container mx-auto px-4 py-8">
                        <div className="grid gap-8 lg:grid-cols-[1fr_380px]">
                            <div className="space-y-8">
                                <UmkmDetailInfo umkm={umkm} />
                                <UmkmDetailProducts umkm={umkm} />
                                <UmkmDetailGallery umkm={umkm} />
                            </div>
                            <aside className="lg:sticky lg:top-24 lg:h-fit">
                                <UmkmContactCard umkm={umkm} />
                            </aside>
                        </div>
                    </div>
                </main>
                <Footer />
            </div>
        </>
    );
}
