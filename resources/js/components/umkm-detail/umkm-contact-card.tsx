import * as React from 'react';

import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Separator } from '@/components/ui/separator';
import type { Umkm } from '@/types/umkm';
import {
    Facebook,
    Instagram,
    Mail,
    MapPin,
    Phone,
    Store,
    Smartphone,
} from 'lucide-react';

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

function ensureHttpUrl(url: string): string {
    const trimmed = url.trim();

    if (/^https?:\/\//i.test(trimmed)) {
        return trimmed;
    }

    return `https://${trimmed}`;
}

function getMarketplaceLabel(url: string): string {
    const lower = url.toLowerCase();

    if (lower.includes('tokopedia.')) {
        return 'Tokopedia';
    }

    if (lower.includes('shopee.')) {
        return 'Shopee';
    }

    if (lower.includes('tiktok.')) {
        return 'TikTok Shop';
    }

    if (lower.includes('instagram.')) {
        return 'Instagram';
    }

    return 'Marketplace / Website';
}

function formatIdr(amount: unknown): string {
    const value = Number(amount);
    if (Number.isNaN(value)) {
        return '-';
    }

    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
        minimumFractionDigits: 0,
    }).format(value);
}

function formatYear(value: unknown): string {
    if (value === null || value === undefined || value === '') {
        return '-';
    }

    return String(value);
}

function FieldRow({
    label,
    value,
}: {
    label: string;
    value: React.ReactNode;
}) {
    return (
        <div className="grid grid-cols-[140px_1fr] gap-3 text-sm">
            <div className="text-muted-foreground">{label}</div>
            <div className="min-w-0 break-words">{value}</div>
        </div>
    );
}

export function UmkmContactCard({ umkm }: UmkmContactCardProps) {
    const formatPhoneForWhatsApp = (phone: string) => {
        const cleaned = phone.replace(/\D/g, '');

        if (cleaned.startsWith('0')) {
            return `62${cleaned.substring(1)}`;
        }

        if (!cleaned.startsWith('62')) {
            return `62${cleaned}`;
        }

        return cleaned;
    };

    const ownerPhone = umkm.owner?.phone ?? null;
    const ownerEmail = umkm.owner?.email ?? null;

    const marketplaceUrl = umkm.website ? ensureHttpUrl(umkm.website) : null;
    const marketplaceLabel = marketplaceUrl
        ? getMarketplaceLabel(marketplaceUrl)
        : null;

    const socialLinks = [
        umkm.facebook
            ? {
                  key: 'facebook',
                  label: 'Facebook',
                  href: ensureHttpUrl(umkm.facebook),
                  Icon: Facebook,
              }
            : null,
        umkm.instagram
            ? {
                  key: 'instagram',
                  label: 'Instagram',
                  href: ensureHttpUrl(umkm.instagram),
                  Icon: Instagram,
              }
            : null,
        umkm.tiktok
            ? {
                  key: 'tiktok',
                  label: 'TikTok',
                  href: ensureHttpUrl(umkm.tiktok),
                  Icon: Smartphone,
              }
            : null,
    ].filter(Boolean) as Array<{
        key: string;
        label: string;
        href: string;
        Icon: React.ComponentType<React.SVGProps<SVGSVGElement>>;
    }>;

    const addressMain = [
        umkm.address,
        umkm.village,
        umkm.district,
        umkm.city,
        umkm.province,
        umkm.postal_code,
    ]
        .filter(Boolean)
        .join(', ');

    const statusLabelMap: Record<string, string> = {
        active: 'Active',
        inactive: 'Inactive',
        pending: 'Pending',
        rejected: 'Rejected',
        draft: 'Draft',
    };

    const statusLabel =
        (umkm.status && statusLabelMap[String(umkm.status)]) ?? String(umkm.status ?? '-');

    return (
        <Card>
            <CardHeader>
                <CardTitle>Informasi & Kontak</CardTitle>
            </CardHeader>

            <CardContent className="space-y-4">
                <div className="space-y-3">
                    <div className="flex items-start gap-3">
                        <MapPin className="mt-0.5 h-5 w-5 shrink-0 text-muted-foreground" />
                        <div className="min-w-0">
                            <p className="text-sm font-medium">Alamat</p>
                            <p className="text-sm text-muted-foreground">
                                {addressMain || '-'}
                            </p>
                        </div>
                    </div>

                    <Separator />

                    <FieldRow label="ID" value={umkm.id ?? '-'} />
                    <FieldRow
                        label="Slug"
                        value={umkm.slug ? <code className="text-xs">{umkm.slug}</code> : '-'}
                    />
                    <FieldRow label="Kategori" value={umkm.category?.name ?? '-'} />
                    <FieldRow
                        label="Tipe Usaha"
                        value={
                            umkm.business_type ? (
                                <code className="text-xs">{String(umkm.business_type)}</code>
                            ) : (
                                '-'
                            )
                        }
                    />
                    <FieldRow
                        label="Status"
                        value={
                            <div className="flex items-center gap-2">
                                <Badge variant="secondary">{statusLabel}</Badge>
                                {typeof umkm.is_published === 'boolean' && (
                                    <Badge
                                        variant={
                                            umkm.is_published ? 'default' : 'outline'
                                        }
                                    >
                                        {umkm.is_published ? 'Published' : 'Not Published'}
                                    </Badge>
                                )}
                            </div>
                        }
                    />

                    <Separator />

                    <FieldRow
                        label="Tahun Berdiri"
                        value={formatYear(umkm.established_year)}
                    />
                    <FieldRow
                        label="Jumlah Karyawan"
                        value={
                            umkm.employee_count !== null &&
                            umkm.employee_count !== undefined
                                ? String(umkm.employee_count)
                                : '-'
                        }
                    />
                    <FieldRow
                        label="Omzet/Bulan"
                        value={
                            umkm.monthly_revenue !== null &&
                            umkm.monthly_revenue !== undefined
                                ? formatIdr(umkm.monthly_revenue)
                                : '-'
                        }
                    />
                    <FieldRow
                        label="Modal"
                        value={
                            umkm.capital !== null && umkm.capital !== undefined
                                ? formatIdr(umkm.capital)
                                : '-'
                        }
                    />

                    <Separator />

                    <FieldRow label="NIB" value={umkm.nib ?? '-'} />
                    <FieldRow
                        label="PIRT"
                        value={
                            typeof umkm.has_pirt === 'boolean'
                                ? umkm.has_pirt
                                    ? 'Ya'
                                    : 'Tidak'
                                : '-'
                        }
                    />
                    <FieldRow
                        label="Sertifikat Halal"
                        value={
                            typeof umkm.has_halal_certificate === 'boolean'
                                ? umkm.has_halal_certificate
                                    ? 'Ya'
                                    : 'Tidak'
                                : '-'
                        }
                    />

                    {umkm.status === 'rejected' && umkm.rejection_reason && (
                        <>
                            <Separator />
                            <FieldRow
                                label="Alasan Ditolak"
                                value={umkm.rejection_reason}
                            />
                        </>
                    )}

                    {(umkm.latitude || umkm.longitude) && (
                        <>
                            <Separator />
                            <FieldRow
                                label="Koordinat"
                                value={
                                    <code className="text-xs">
                                        {String(umkm.latitude ?? '-')},{' '}
                                        {String(umkm.longitude ?? '-')}
                                    </code>
                                }
                            />
                        </>
                    )}
                </div>

                <div className="space-y-2">
                    {(ownerPhone || umkm.whatsapp) && (
                        <div className="flex items-start gap-3">
                            <Phone className="mt-0.5 h-5 w-5 shrink-0 text-muted-foreground" />
                            <div className="text-sm">
                                <p className="font-medium">Kontak</p>

                                {ownerPhone ? (
                                    <a
                                        className="text-primary underline-offset-4 hover:underline"
                                        href={`tel:${ownerPhone}`}
                                    >
                                        {ownerPhone}
                                    </a>
                                ) : (
                                    <p className="text-muted-foreground">-</p>
                                )}

                                {umkm.whatsapp ? (
                                    <p className="text-muted-foreground">
                                        WhatsApp: {umkm.whatsapp}
                                    </p>
                                ) : null}
                            </div>
                        </div>
                    )}

                    {umkm.whatsapp && (
                        <Button className="w-full gap-2" asChild>
                            <a
                                href={`https://wa.me/${formatPhoneForWhatsApp(umkm.whatsapp)}`}
                                target="_blank"
                                rel="noreferrer"
                            >
                                <Phone className="h-4 w-4" />
                                Chat WhatsApp
                            </a>
                        </Button>
                    )}

                    {ownerEmail && (
                        <Button
                            variant="outline"
                            className="w-full gap-2 bg-transparent"
                            asChild
                        >
                            <a href={`mailto:${ownerEmail}`}>
                                <Mail className="h-4 w-4" />
                                Kirim Email
                            </a>
                        </Button>
                    )}
                </div>

                <div className="space-y-2">
                    <Separator />
                    <p className="text-sm font-semibold">Marketplace</p>

                    {!marketplaceUrl ? (
                        <p className="text-sm text-muted-foreground">
                            Belum ada link marketplace
                        </p>
                    ) : (
                        <Button
                            asChild
                            variant="outline"
                            className="w-full justify-start gap-2 bg-transparent"
                        >
                            <a href={marketplaceUrl} target="_blank" rel="noreferrer">
                                <Store className="h-4 w-4" />
                                {marketplaceLabel}
                            </a>
                        </Button>
                    )}
                </div>

                {socialLinks.length > 0 && (
                    <>
                        <Separator />
                        <div className="space-y-2">
                            <p className="text-sm font-semibold">Sosial</p>
                            <div className="flex flex-wrap gap-2">
                                {socialLinks.map(({ key, label, href, Icon }) => (
                                    <Button
                                        key={key}
                                        asChild
                                        variant="outline"
                                        size="sm"
                                        className="gap-2 bg-transparent"
                                    >
                                        <a href={href} target="_blank" rel="noreferrer">
                                            <Icon className="h-4 w-4" />
                                            {label}
                                        </a>
                                    </Button>
                                ))}
                            </div>
                        </div>
                    </>
                )}
            </CardContent>
        </Card>
    );
}

export default UmkmContactCard;