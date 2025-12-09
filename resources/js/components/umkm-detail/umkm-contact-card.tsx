import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Separator } from '@/components/ui/separator';
import type { Umkm } from '@/types/umkm';
import { Facebook, Globe, Instagram, Mail, MapPin, Phone } from 'lucide-react';

interface UmkmContactCardProps {
    umkm: Umkm;
}

export function UmkmContactCard({ umkm }: UmkmContactCardProps) {
    const formatPhoneForWhatsApp = (phone: string) => {
        // Remove non-numeric characters
        const cleaned = phone.replace(/\D/g, '');
        // If starts with 0, replace with 62
        if (cleaned.startsWith('0')) {
            return '62' + cleaned.substring(1);
        }
        // If doesn't start with 62, add it
        if (!cleaned.startsWith('62')) {
            return '62' + cleaned;
        }
        return cleaned;
    };

    return (
        <Card>
            <CardHeader>
                <CardTitle>Hubungi UMKM</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
                <div className="space-y-3">
                    <div className="flex items-start gap-3">
                        <MapPin className="mt-0.5 h-5 w-5 shrink-0 text-muted-foreground" />
                        <div className="text-sm">
                            <p className="font-medium">{umkm.address}</p>
                            <p className="text-muted-foreground">
                                {umkm.village}, {umkm.district}
                            </p>
                            <p className="text-muted-foreground">
                                {umkm.city}, {umkm.province} {umkm.postal_code}
                            </p>
                        </div>
                    </div>

                    <Separator />

                    <div className="flex items-center gap-3">
                        <Phone className="h-5 w-5 shrink-0 text-muted-foreground" />
                        <div>
                            <p className="text-sm font-medium">{umkm.phone}</p>
                            {umkm.email && (
                                <p className="text-xs text-muted-foreground">
                                    {umkm.email}
                                </p>
                            )}
                        </div>
                    </div>
                </div>

                <div className="space-y-2">
                    {umkm.whatsapp && (
                        <Button className="w-full gap-2" asChild>
                            <a
                                href={`https://wa.me/${formatPhoneForWhatsApp(umkm.whatsapp)}`}
                                target="_blank"
                                rel="noopener noreferrer"
                            >
                                <Phone className="h-4 w-4" />
                                Chat WhatsApp
                            </a>
                        </Button>
                    )}

                    {umkm.email && (
                        <Button
                            variant="outline"
                            className="w-full gap-2"
                            asChild
                        >
                            <a href={`mailto:${umkm.email}`}>
                                <Mail className="h-4 w-4" />
                                Kirim Email
                            </a>
                        </Button>
                    )}
                </div>

                {(umkm.website ||
                    umkm.facebook ||
                    umkm.instagram ||
                    umkm.tiktok) && (
                    <>
                        <Separator />

                        <div>
                            <p className="mb-2 text-sm font-semibold">
                                Media Sosial
                            </p>
                            <div className="flex flex-wrap gap-2">
                                {umkm.website && (
                                    <Button
                                        variant="outline"
                                        size="icon"
                                        asChild
                                    >
                                        <a
                                            href={umkm.website}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            title="Website"
                                        >
                                            <Globe className="h-4 w-4" />
                                        </a>
                                    </Button>
                                )}
                                {umkm.facebook && (
                                    <Button
                                        variant="outline"
                                        size="icon"
                                        asChild
                                    >
                                        <a
                                            href={umkm.facebook}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            title="Facebook"
                                        >
                                            <Facebook className="h-4 w-4" />
                                        </a>
                                    </Button>
                                )}
                                {umkm.instagram && (
                                    <Button
                                        variant="outline"
                                        size="icon"
                                        asChild
                                    >
                                        <a
                                            href={umkm.instagram}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            title="Instagram"
                                        >
                                            <Instagram className="h-4 w-4" />
                                        </a>
                                    </Button>
                                )}
                            </div>
                        </div>
                    </>
                )}
            </CardContent>
        </Card>
    );
}
