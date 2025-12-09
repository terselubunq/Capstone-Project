// resources/js/components/umkm-detail/umkm-detail-gallery.tsx
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import type { Umkm } from '@/types/umkm';
import { resolveImageUrl } from '@/utils/image';

interface UmkmDetailGalleryProps {
    umkm: Umkm;
}

export function UmkmDetailGallery({ umkm }: UmkmDetailGalleryProps) {
    const photos = (umkm.photos as any) || [];

    if (!photos || photos.length === 0) return null;

    return (
        <Card>
            <CardHeader>
                <CardTitle>Galeri Foto</CardTitle>
            </CardHeader>

            <CardContent>
                <div className="grid gap-4 sm:grid-cols-2">
                    {photos.map((photo: string | any, index: number) => {
                        const photoSrc = resolveImageUrl(photo);
                        return (
                            <div
                                key={index}
                                className="bg-muted group relative aspect-video overflow-hidden rounded-lg border"
                            >
                                <img
                                    src={photoSrc}
                                    alt={`${umkm.business_name} - Foto ${index + 1}`}
                                    className="h-full w-full object-cover transition-transform group-hover:scale-105"
                                />
                                <div className="absolute inset-0 bg-black/0 transition-colors group-hover:bg-black/10" />
                            </div>
                        );
                    })}
                </div>
            </CardContent>
        </Card>
    );
}

export default UmkmDetailGallery;
