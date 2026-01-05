import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import type { FeaturedUmkm } from '@/types/umkm';
import { resolveImageUrl } from '@/utils/image';
import { Link } from '@inertiajs/react';
import { ArrowRight, CheckCircle2, MapPin } from 'lucide-react';

interface FeaturedUmkmSectionProps {
    umkms: FeaturedUmkm[];
}

export function FeaturedUmkmSection({ umkms }: FeaturedUmkmSectionProps) {
    const businessTypeLabels = {
        mikro: 'Mikro',
        kecil: 'Kecil',
        menengah: 'Menengah',
    };

    return (
        <section className="py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mb-12 text-center">
                    <h2 className="mb-4 text-3xl font-bold text-balance md:text-4xl">
                        UMKM Unggulan
                    </h2>
                    <p className="text-lg text-balance text-muted-foreground">
                        Temukan usaha lokal terbaik yang telah terverifikasi dan
                        dipercaya
                    </p>
                </div>

                <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
                    {umkms.map((umkm) => {
                        const imageSrc = resolveImageUrl(
                            umkm.first_image ?? umkm.logo,
                        );
                        return (
                            <Card
                                key={umkm.slug}
                                className="group overflow-hidden transition-shadow hover:shadow-lg"
                            >
                                <CardContent className="p-0">
                                    <Link href={`/katalog/${umkm.slug}`}>
                                        <div className="aspect-square overflow-hidden bg-muted">
                                            <img
                                                src={imageSrc}
                                                alt={umkm.name}
                                                className="h-full w-full object-cover transition-transform group-hover:scale-105"
                                            />
                                        </div>
                                        <div className="p-5">
                                            <div className="mb-3 flex items-start justify-between gap-2">
                                                <div>
                                                    <Badge
                                                        variant="secondary"
                                                        className="mb-2 text-xs"
                                                    >
                                                        {umkm.category}
                                                    </Badge>
                                                    <h3 className="leading-tight font-semibold text-balance group-hover:text-primary">
                                                        {umkm.name}
                                                    </h3>
                                                </div>
                                            </div>

                                            <p className="mb-3 line-clamp-2 text-sm text-muted-foreground">
                                                {umkm.description}
                                            </p>

                                            <div className="mb-3 flex items-center gap-1 text-xs text-muted-foreground">
                                                <MapPin className="h-3 w-3" />
                                                <span>{umkm.district}</span>
                                                <span className="mx-1">•</span>
                                                <span>
                                                    {
                                                        businessTypeLabels[
                                                        umkm.businessType
                                                        ]
                                                    }
                                                </span>
                                            </div>

                                            {(umkm.hasHalal || umkm.hasPirt) && (
                                                <div className="flex flex-wrap gap-1.5">
                                                    {umkm.hasHalal && (
                                                        <Badge
                                                            variant="outline"
                                                            className="gap-1 text-xs"
                                                        >
                                                            <CheckCircle2 className="h-3 w-3 text-primary" />
                                                            Halal
                                                        </Badge>
                                                    )}
                                                    {umkm.hasPirt && (
                                                        <Badge
                                                            variant="outline"
                                                            className="gap-1 text-xs"
                                                        >
                                                            <CheckCircle2 className="h-3 w-3 text-primary" />
                                                            PIRT
                                                        </Badge>
                                                    )}
                                                </div>
                                            )}
                                        </div>
                                    </Link>
                                </CardContent>
                            </Card>
                        );
                    })}
                </div>

                <div className="mt-10 text-center">
                    <Button
                        size="lg"
                        variant="outline"
                        className="gap-2 bg-transparent"
                        asChild
                    >
                        <Link href="/katalog">
                            Lihat Semua UMKM
                            <ArrowRight className="h-4 w-4" />
                        </Link>
                    </Button>
                </div>
            </div>
        </section>
    );
}
