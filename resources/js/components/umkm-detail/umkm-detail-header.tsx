import { Badge } from '@/components/ui/badge';
import type { Umkm } from '@/types/umkm';
import { resolveImageUrl } from '@/utils/image';
import { Calendar, CheckCircle2, MapPin, Users } from 'lucide-react';

interface UmkmDetailHeaderProps {
    umkm: Umkm;
}

export function UmkmDetailHeader({ umkm }: UmkmDetailHeaderProps) {
    const businessTypeLabels = {
        mikro: 'Usaha Mikro',
        kecil: 'Usaha Kecil',
        menengah: 'Usaha Menengah',
    };

    const logoSrc = resolveImageUrl(umkm.logo);

    return (
        <section className="border-b bg-muted/30">
            <div className="container mx-auto px-4 py-8">
                <div className="flex flex-col gap-6 md:flex-row md:items-start">
                    <div className="h-32 w-32 shrink-0 overflow-hidden rounded-xl border bg-card">
                        <img
                            src={logoSrc}
                            alt={umkm.business_name}
                            className="h-full w-full object-cover"
                        />
                    </div>

                    <div className="flex-1">
                        <div className="mb-3 flex flex-wrap items-center gap-2">
                            <Badge variant="secondary">
                                {umkm.category?.name || 'Umum'}
                            </Badge>
                            <Badge variant="outline">
                                {businessTypeLabels[umkm.business_type]}
                            </Badge>
                            {umkm.status === 'active' && (
                                <Badge variant="outline" className="gap-1">
                                    <CheckCircle2 className="h-3 w-3 text-primary" />
                                    Terverifikasi
                                </Badge>
                            )}
                            {umkm.has_halal_certificate && (
                                <Badge variant="outline" className="gap-1">
                                    <CheckCircle2 className="h-3 w-3 text-primary" />
                                    Halal
                                </Badge>
                            )}
                            {umkm.has_pirt && (
                                <Badge variant="outline" className="gap-1">
                                    <CheckCircle2 className="h-3 w-3 text-primary" />
                                    PIRT
                                </Badge>
                            )}
                        </div>

                        <h1 className="mb-3 text-3xl font-bold md:text-4xl">
                            {umkm.business_name}
                        </h1>

                        <div className="flex flex-wrap gap-4 text-sm text-muted-foreground">
                            <div className="flex items-center gap-1.5">
                                <MapPin className="h-4 w-4" />
                                <span>
                                    {umkm.district}, {umkm.city}
                                </span>
                            </div>
                            {umkm.established_year && (
                                <div className="flex items-center gap-1.5">
                                    <Calendar className="h-4 w-4" />
                                    <span>
                                        Berdiri sejak {umkm.established_year}
                                    </span>
                                </div>
                            )}
                            {umkm.employee_count > 0 && (
                                <div className="flex items-center gap-1.5">
                                    <Users className="h-4 w-4" />
                                    <span>{umkm.employee_count} Karyawan</span>
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}
