import type { HomeStats } from '@/types/umkm';
import { Award, Package, Store, Users } from 'lucide-react';

interface StatsSectionProps {
    stats: HomeStats;
}

export function StatsSection({ stats }: StatsSectionProps) {
    const statsDisplay = [
        {
            icon: Store,
            value: stats.total_umkms.toLocaleString('id-ID'),
            label: 'UMKM Terdaftar',
            description: 'Usaha terverifikasi',
        },
        {
            icon: Package,
            value: stats.total_products.toLocaleString('id-ID'),
            label: 'Produk Tersedia',
            description: 'Produk lokal berkualitas',
        },
        {
            icon: Award,
            value: stats.certified_umkms.toLocaleString('id-ID'),
            label: 'Bersertifikat',
            description: 'Halal & PIRT',
        },
        {
            icon: Users,
            value: stats.active_mentorings.toLocaleString('id-ID'),
            label: 'Program Mentoring',
            description: 'Pendampingan aktif',
        },
    ];

    return (
        <section className="border-b py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="grid gap-8 sm:grid-cols-2 lg:grid-cols-4">
                    {statsDisplay.map((stat, index) => (
                        <div
                            key={index}
                            className="flex flex-col items-center text-center"
                        >
                            <div className="mb-4 flex h-14 w-14 items-center justify-center rounded-xl bg-primary/10">
                                <stat.icon className="h-7 w-7 text-primary" />
                            </div>
                            <div className="mb-1 text-4xl font-bold">
                                {stat.value}
                            </div>
                            <div className="mb-1 text-sm font-semibold">
                                {stat.label}
                            </div>
                            <div className="text-sm text-muted-foreground">
                                {stat.description}
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
}
