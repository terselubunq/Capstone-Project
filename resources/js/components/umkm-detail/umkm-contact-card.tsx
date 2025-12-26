import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Separator } from '@/components/ui/separator';
import type { Umkm } from '@/types/umkm';
import { Facebook, Globe, Instagram, Mail, MapPin, Phone } from 'lucide-react';

interface UmkmContactCardProps {
  umkm: Umkm;
}

// Placeholder icon Tokopedia
const TokopediaIcon = (props: React.SVGProps<SVGSVGElement>) => (
  <svg viewBox="0 0 24 24" {...props}>
    <rect x="3" y="7" width="18" height="14" rx="2" ry="2" />
    <path d="M8 10c0-2.5 1.5-4 4-4s4 1.5 4 4" />
    <path d="M9 14h6" />
  </svg>
);

// Placeholder icon Shopee
const ShopeeIcon = (props: React.SVGProps<SVGSVGElement>) => (
  <svg viewBox="0 0 24 24" {...props}>
    <rect x="4" y="7" width="16" height="13" rx="2" ry="2" />
    <path d="M9 7c0-1.7 1.3-3 3-3s3 1.3 3 3" />
    <path d="M10 15c.4.6 1.1 1 2 1 1.1 0 2-.7 2-1.7 0-1.7-2.4-1.6-2.4-2.7 0-.4.4-.7.9-.7.4 0 .8.2 1.1.5" />
  </svg>
);

export function UmkmContactCard({ umkm }: UmkmContactCardProps) {
  const formatPhoneForWhatsApp = (phone: string) => {
    const cleaned = phone.replace(/\D/g, '');
    if (cleaned.startsWith('0')) return '62' + cleaned.substring(1);
    if (!cleaned.startsWith('62')) return '62' + cleaned;
    return cleaned;
  };

  return (
    <Card>
      <CardHeader>
        <CardTitle>Hubungi UMKM</CardTitle>
      </CardHeader>

      <CardContent className="space-y-4">
        {/* Alamat */}
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

          {/* Telepon */}
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

        {/* WhatsApp + Email */}
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
            <Button variant="outline" className="w-full gap-2" asChild>
              <a href={`mailto:${umkm.email}`}>
                <Mail className="h-4 w-4" />
                Kirim Email
              </a>
            </Button>
          )}
        </div>

        {/* Marketplace */}
        <div className="space-y-2">
          <Separator />
          <p className="text-sm font-semibold">Marketplace</p>

          <div className="flex flex-wrap gap-2">
            <Button
              asChild
              variant="ghost"
              className="gap-2 bg-white text-black border border-black hover:bg-white/80"
            >
              <a
                href="https://www.tokopedia.com"
                target="_blank"
                rel="noopener noreferrer"
              >
                <TokopediaIcon className="h-4 w-4 text-black" />
                <span>Tokopedia</span>
              </a>
            </Button>

            <Button
              asChild
              variant="ghost"
              className="gap-2 bg-white text-black border border-black hover:bg-white/80"
            >
              <a
                href="https://shopee.co.id"
                target="_blank"
                rel="noopener noreferrer"
              >
                <ShopeeIcon className="h-4 w-4 text-black" />
                <span>Shopee</span>
              </a>
            </Button>
          </div>
        </div>

        {/* Media Sosial */}
        {(umkm.website || umkm.facebook || umkm.instagram || umkm.tiktok) && (
          <>
            <Separator />

            <div>
              <p className="mb-2 text-sm font-semibold">Media Sosial</p>

              <div className="flex flex-wrap gap-2">
                {umkm.website && (
                  <Button variant="outline" size="icon" asChild>
                    <a href={umkm.website} target="_blank" rel="noopener noreferrer">
                      <Globe className="h-4 w-4" />
                    </a>
                  </Button>
                )}

                {umkm.facebook && (
                  <Button variant="outline" size="icon" asChild>
                    <a href={umkm.facebook} target="_blank" rel="noopener noreferrer">
                      <Facebook className="h-4 w-4" />
                    </a>
                  </Button>
                )}

                {umkm.instagram && (
                  <Button variant="outline" size="icon" asChild>
                    <a href={umkm.instagram} target="_blank" rel="noopener noreferrer">
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