import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardFooter,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import type { Mentoring } from '@/types/mentoring';
import { Link } from '@inertiajs/react';
import { format } from 'date-fns';
import { id } from 'date-fns/locale';
import {
    Award,
    BookOpen,
    Building2,
    Calendar,
    Clock,
    Eye,
    Package,
    User,
} from 'lucide-react';

interface MentoringGridProps {
    mentorings: Mentoring[];
}

export function MentoringGrid({ mentorings }: MentoringGridProps) {
    if (mentorings.length === 0) {
        return (
            <Card>
                <CardContent className="flex flex-col items-center justify-center py-16">
                    <Package className="mb-4 h-16 w-16 text-muted-foreground" />
                    <h3 className="mb-2 text-lg font-semibold">
                        Tidak Ada Program
                    </h3>
                    <p className="text-sm text-muted-foreground">
                        Tidak ada program mentoring yang sesuai dengan filter
                        Anda.
                    </p>
                </CardContent>
            </Card>
        );
    }

    const getStatusBadge = (status: Mentoring['status']) => {
        const badges = {
            scheduled: { label: 'Terjadwal', variant: 'secondary' as const },
            ongoing: { label: 'Berlangsung', variant: 'default' as const },
            completed: { label: 'Selesai', variant: 'outline' as const },
            cancelled: { label: 'Dibatalkan', variant: 'destructive' as const },
        };
        return badges[status];
    };

    const getTypeBadge = (type: Mentoring['type']) => {
        const types: Record<string, string> = {
            financial: 'Keuangan',
            marketing: 'Pemasaran',
            production: 'Produksi',
            management: 'Manajemen',
            technology: 'Teknologi',
            legal: 'Legal & Perizinan',
            other: 'Lainnya',
        };
        return types[type] || type;
    };

    return (
        <div className="grid gap-6 md:grid-cols-2">
            {mentorings.map((mentoring) => {
                const statusBadge = getStatusBadge(mentoring.status);

                return (
                    <Card key={mentoring.id} className="flex flex-col">
                        <CardHeader>
                            <div className="mb-2 flex items-start justify-between gap-2">
                                <Badge variant={statusBadge.variant}>
                                    {statusBadge.label}
                                </Badge>
                                <Badge variant="outline">
                                    {getTypeBadge(mentoring.type)}
                                </Badge>
                            </div>
                            <CardTitle className="line-clamp-2">
                                {mentoring.program_name}
                            </CardTitle>
                            <CardDescription className="line-clamp-2">
                                {mentoring.description}
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="flex-1 space-y-4">
                            {/* UMKM Info */}
                            {mentoring.umkm && (
                                <div className="flex items-center gap-2 text-sm">
                                    <Building2 className="h-4 w-4 text-muted-foreground" />
                                    <span className="font-medium">
                                        {mentoring.umkm.business_name}
                                    </span>
                                    {mentoring.umkm.category && (
                                        <Badge
                                            variant="secondary"
                                            className="text-xs"
                                        >
                                            {mentoring.umkm.category.name}
                                        </Badge>
                                    )}
                                </div>
                            )}

                            {/* Mentor Info */}
                            {mentoring.mentor && (
                                <div className="flex items-center gap-2 text-sm text-muted-foreground">
                                    <User className="h-4 w-4" />
                                    <span>Mentor: {mentoring.mentor.name}</span>
                                </div>
                            )}

                            {/* Date Range */}
                            <div className="flex items-center gap-2 text-sm text-muted-foreground">
                                <Calendar className="h-4 w-4" />
                                <span>
                                    {format(
                                        new Date(mentoring.start_date),
                                        'dd MMM yyyy',
                                        { locale: id },
                                    )}
                                    {' - '}
                                    {format(
                                        new Date(mentoring.end_date),
                                        'dd MMM yyyy',
                                        { locale: id },
                                    )}
                                </span>
                            </div>

                            {/* Sessions Count */}
                            <div className="flex items-center gap-4 border-t pt-4 text-sm">
                                <div className="flex items-center gap-2">
                                    <BookOpen className="h-4 w-4 text-muted-foreground" />
                                    <span>
                                        {mentoring.sessions_count || 0} Sesi
                                    </span>
                                </div>
                                <div className="flex items-center gap-2">
                                    <Clock className="h-4 w-4 text-muted-foreground" />
                                    <span>
                                        {Math.ceil(
                                            (new Date(
                                                mentoring.end_date,
                                            ).getTime() -
                                                new Date(
                                                    mentoring.start_date,
                                                ).getTime()) /
                                                (1000 * 60 * 60 * 24 * 7),
                                        )}{' '}
                                        Minggu
                                    </span>
                                </div>
                            </div>

                            {/* Objectives Preview */}
                            {mentoring.objectives && (
                                <div className="rounded-lg bg-muted/50 p-3">
                                    <div className="mb-1 flex items-center gap-2">
                                        <Award className="h-4 w-4 text-muted-foreground" />
                                        <span className="text-xs font-semibold text-muted-foreground">
                                            Tujuan Program
                                        </span>
                                    </div>
                                    <p className="line-clamp-3 text-xs text-muted-foreground">
                                        {mentoring.objectives
                                            .split('\n')
                                            .slice(0, 2)
                                            .join(' ')}
                                    </p>
                                </div>
                            )}
                        </CardContent>
                        <CardFooter>
                            <Button asChild className="w-full" variant="outline">
                                <Link href={`/program-mentoring/${mentoring.id}`}>
                                    <Eye className="mr-2 h-4 w-4" />
                                    Lihat Detail
                                </Link>
                            </Button>
                        </CardFooter>
                    </Card>
                );
            })}
        </div>
    );
}
