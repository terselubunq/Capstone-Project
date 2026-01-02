// resources/js/components/catalog/catalog-grid.tsx
import { Badge } from '@/components/ui/badge';
import { Card, CardContent } from '@/components/ui/card';
import type { Umkm } from '@/types/umkm';
import { resolveImageUrl } from '@/utils/image';
import { Link } from '@inertiajs/react';
import { CheckCircle2, MapPin, Package } from 'lucide-react';

interface CatalogGridProps {
    umkms: Umkm[];
}

function pickFirstPhoto(photos: unknown): string | null {
    if (Array.isArray(photos) && photos.length > 0) {
        const first = photos[0];
        return typeof first === 'string' && first.trim() !== '' ? first : null;
    }

    return null;
}

export function CatalogGrid({ umkms }: CatalogGridProps) {
    if (umkms.length === 0) {
        return (
            <div className="flex min-h-[400px] flex-col items-center justify-center rounded-lg border border-dashed p-8 text-center">
                <Package className="text-muted-foreground mb-4 h-12 w-12" />
                <h3 className="mb-2 text-lg font-semibold">
                    Tidak ada UMKM ditemukan
                </h3>
                <p className="text-muted-foreground text-sm">
                    Coba sesuaikan filter atau kata kunci pencarian Anda
                </p>
            </div>
        );
    }

    const businessTypeLabels: Record<string, string> = {
        mikro: 'Mikro',
        kecil: 'Kecil',
        menengah: 'Menengah',
    };

    return (
        <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {umkms.map((umkm) => {
                const firstPhoto = pickFirstPhoto(umkm.photos);
                const rawImage =
                    umkm.first_image ?? umkm.logo ?? firstPhoto ?? null;

                const imageSrc = resolveImageUrl(rawImage);

                return (
                    <Card
                        key={umkm.slug}
                        className="group overflow-hidden transition-shadow hover:shadow-lg"
                    >
                        <CardContent className="p-0">
                            <Link
                                href={`/katalog/${umkm.slug}`}
                                className="block"
                            >
                                <div className="bg-muted aspect-square overflow-hidden">
                                    <img
                                        src={imageSrc}
                                        alt={umkm.business_name}
                                        className="h-full w-full object-cover transition-transform group-hover:scale-105"
                                    />
                                </div>

                                <div className="p-5">
                                    <div className="mb-3">
                                        <Badge
                                            variant="secondary"
                                            className="mb-2 text-xs"
                                        >
                                            {umkm.category?.name || 'Umum'}
                                        </Badge>

                                        <h3 className="group-hover:text-primary text-balance font-semibold leading-tight">
                                            {umkm.business_name}
                                        </h3>
                                    </div>

                                    <p className="text-muted-foreground mb-3 line-clamp-2 text-sm">
                                        {umkm.description ||
                                            'Tidak ada deskripsi'}
                                    </p>

                                    <div className="text-muted-foreground mb-3 space-y-1.5 text-xs">
                                        <div className="flex items-center gap-1">
                                            <MapPin className="h-3 w-3 shrink-0" />
                                            <span>{umkm.district}</span>
                                            <span className="mx-1">•</span>
                                            <span>
                                                {
                                                    businessTypeLabels[
                                                        umkm.business_type
                                                    ]
                                                }
                                            </span>
                                        </div>

                                        {typeof (umkm as any).products_count !==
                                            'undefined' && (
                                            <div className="flex items-center gap-1">
                                                <Package className="h-3 w-3 shrink-0" />
                                                <span>
                                                    {
                                                        (umkm as any)
                                                            .products_count
                                                    }{' '}
                                                    Produk
                                                </span>
                                            </div>
                                        )}
                                    </div>

                                    {(umkm.has_halal_certificate ||
                                        umkm.has_pirt) && (
                                        <div className="flex flex-wrap gap-1.5">
                                            {umkm.has_halal_certificate && (
                                                <Badge
                                                    variant="outline"
                                                    className="gap-1 text-xs"
                                                >
                                                    <CheckCircle2 className="text-primary h-3 w-3" />
                                                    Halal
                                                </Badge>
                                            )}

                                            {umkm.has_pirt && (
                                                <Badge
                                                    variant="outline"
                                                    className="gap-1 text-xs"
                                                >
                                                    <CheckCircle2 className="text-primary h-3 w-3" />
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
    );
}

export default CatalogGrid;
