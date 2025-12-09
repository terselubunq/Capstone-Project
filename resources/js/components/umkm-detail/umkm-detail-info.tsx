import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import type { Umkm } from '@/types/umkm';
import { MapPin } from 'lucide-react';

interface UmkmDetailInfoProps {
    umkm: Umkm;
}

export function UmkmDetailInfo({ umkm }: UmkmDetailInfoProps) {
    return (
        <div className="space-y-6">
            {umkm.description && (
                <Card>
                    <CardHeader>
                        <CardTitle>Tentang Usaha</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <p className="leading-relaxed text-muted-foreground">
                            {umkm.description}
                        </p>
                    </CardContent>
                </Card>
            )}

            {umkm.latitude && umkm.longitude && (
                <Card>
                    <CardHeader>
                        <CardTitle>Lokasi</CardTitle>
                    </CardHeader>
                    <CardContent className="space-y-3">
                        <div className="flex items-start gap-3">
                            <MapPin className="mt-0.5 h-5 w-5 shrink-0 text-muted-foreground" />
                            <div className="text-sm">
                                <p className="font-medium">{umkm.address}</p>
                                <p className="text-muted-foreground">
                                    {umkm.village}, {umkm.district}
                                </p>
                                <p className="text-muted-foreground">
                                    {umkm.city}, {umkm.province}{' '}
                                    {umkm.postal_code}
                                </p>
                            </div>
                        </div>

                        <div className="aspect-video overflow-hidden rounded-lg border bg-muted">
                            <iframe
                                src={`https://www.openstreetmap.org/export/embed.html?bbox=${umkm.longitude - 0.01}%2C${umkm.latitude - 0.01}%2C${umkm.longitude + 0.01}%2C${umkm.latitude + 0.01}&marker=${umkm.latitude}%2C${umkm.longitude}`}
                                className="h-full w-full"
                                title={`Lokasi ${umkm.business_name}`}
                            />
                        </div>
                        <a
                            href={`https://www.google.com/maps/search/?api=1&query=${umkm.latitude},${umkm.longitude}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="block text-center text-sm text-primary hover:underline"
                        >
                            Buka di Google Maps →
                        </a>
                    </CardContent>
                </Card>
            )}
        </div>
    );
}
