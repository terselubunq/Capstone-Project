import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import type { Umkm } from '@/types/umkm';

interface UmkmDetailInfoProps {
    umkm: Umkm;
}

export function UmkmDetailInfo({ umkm }: UmkmDetailInfoProps) {
    const latitude = Number(umkm.latitude);
    const longitude = Number(umkm.longitude);
    const hasValidCoords =
        typeof latitude === 'number' &&
        typeof longitude === 'number' &&
        !isNaN(latitude) &&
        !isNaN(longitude);

    return (
        <div className="space-y-6">
            {umkm.description && (
                <Card>
                    <CardHeader>
                        <CardTitle>Deskripsi</CardTitle>
                    </CardHeader>
                    <CardContent>
                        {umkm.description}
                    </CardContent>
                </Card>
            )}

            {hasValidCoords && (
                <Card>
                    <CardHeader>
                        <CardTitle>Lokasi</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="mb-2 text-sm text-muted-foreground">
                            {umkm.address}, {umkm.village}, {umkm.district}, {umkm.city}, {umkm.province}, {umkm.postal_code}
                        </div>
                        <iframe
                            title="Lokasi UMKM"
                            width="100%"
                            height="250"
                            style={{ border: 0, borderRadius: '0.5rem' }}
                            loading="lazy"
                            allowFullScreen
                            src={`https://www.openstreetmap.org/export/embed.html?bbox=${longitude - 0.01},${latitude - 0.01},${longitude + 0.01},${latitude + 0.01}&layer=mapnik&marker=${latitude},${longitude}`}
                        />
                        <div className="mt-2">
                            <a
                                href={`https://maps.google.com/?q=${latitude},${longitude}`}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-primary underline"
                            >
                                Lihat di Google Maps
                            </a>
                        </div>
                    </CardContent>
                </Card>
            )}
        </div>
    );
}
