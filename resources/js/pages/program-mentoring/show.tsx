import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Footer } from '@/components/footer';
import { Navigation } from '@/components/navigation';
import type { Mentoring } from '@/types/mentoring';
import { resolveImageUrl } from '@/utils/image';
import { Head, Link } from '@inertiajs/react';
import { format } from 'date-fns';
import { id } from 'date-fns/locale';
import {
    ArrowLeft,
    Award,
    BookOpen,
    Building2,
    Calendar,
    Clock,
    MapPin,
    Target,
    User,
} from 'lucide-react';

interface ShowProps {
    mentoring: Mentoring;
}

export default function Show({ mentoring }: ShowProps) {
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

    const statusBadge = getStatusBadge(mentoring.status);

    return (
        <div className="flex min-h-screen flex-col">
            <Head title={mentoring.program_name} />
            <Navigation />

            <main className="flex-1 bg-gradient-to-b from-emerald-50/50 to-white py-12 dark:from-gray-900 dark:to-gray-950">
                <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
                    {/* Back Button */}
                    <div className="mb-6">
                        <Button variant="ghost" asChild>
                            <Link href="/program-mentoring">
                                <ArrowLeft className="mr-2 h-4 w-4" />
                                Kembali ke Daftar Program
                            </Link>
                        </Button>
                    </div>

                    {/* Header Section */}
                    <Card className="mb-6">
                        <CardHeader>
                            <div className="flex flex-wrap items-center gap-3 mb-4">
                                <Badge variant={statusBadge.variant} className="text-sm">
                                    {statusBadge.label}
                                </Badge>
                                <Badge variant="outline">
                                    {getTypeBadge(mentoring.type)}
                                </Badge>
                            </div>
                            <CardTitle className="text-2xl md:text-3xl">
                                {mentoring.program_name}
                            </CardTitle>
                            <p className="mt-3 text-muted-foreground">
                                {mentoring.description}
                            </p>
                        </CardHeader>
                    </Card>

                    <div className="grid gap-6 md:grid-cols-3">
                        {/* Main Content */}
                        <div className="md:col-span-2 space-y-6">
                            {/* UMKM Info */}
                            {mentoring.umkm && (
                                <Card>
                                    <CardHeader>
                                        <CardTitle className="flex items-center gap-2 text-lg">
                                            <Building2 className="h-5 w-5 text-emerald-600" />
                                            UMKM Peserta
                                        </CardTitle>
                                    </CardHeader>
                                    <CardContent>
                                        <div className="flex items-start gap-4">
                                            {mentoring.umkm.logo && (
                                                <img
                                                    src={resolveImageUrl(mentoring.umkm.logo)}
                                                    alt={mentoring.umkm.business_name}
                                                    className="h-16 w-16 rounded-lg object-cover"
                                                />
                                            )}
                                            <div>
                                                <h3 className="font-semibold text-lg">
                                                    {mentoring.umkm.business_name}
                                                </h3>
                                                {mentoring.umkm.category && (
                                                    <Badge variant="secondary" className="mt-1">
                                                        {mentoring.umkm.category.name}
                                                    </Badge>
                                                )}
                                                {mentoring.umkm.owner && (
                                                    <p className="mt-2 text-sm text-muted-foreground flex items-center gap-1">
                                                        <User className="h-4 w-4" />
                                                        Pemilik: {mentoring.umkm.owner.name}
                                                    </p>
                                                )}
                                            </div>
                                        </div>
                                    </CardContent>
                                </Card>
                            )}

                            {/* Objectives */}
                            {mentoring.objectives && (
                                <Card>
                                    <CardHeader>
                                        <CardTitle className="flex items-center gap-2 text-lg">
                                            <Target className="h-5 w-5 text-emerald-600" />
                                            Tujuan Program
                                        </CardTitle>
                                    </CardHeader>
                                    <CardContent>
                                        <div className="prose prose-sm dark:prose-invert max-w-none">
                                            {mentoring.objectives.split('\n').map((obj, idx) => (
                                                <p key={idx} className="flex items-start gap-2 mb-2">
                                                    <Award className="h-4 w-4 mt-1 text-emerald-600 shrink-0" />
                                                    <span>{obj}</span>
                                                </p>
                                            ))}
                                        </div>
                                    </CardContent>
                                </Card>
                            )}

                            {/* Sessions */}
                            {mentoring.sessions && mentoring.sessions.length > 0 && (
                                <Card>
                                    <CardHeader>
                                        <CardTitle className="flex items-center gap-2 text-lg">
                                            <BookOpen className="h-5 w-5 text-emerald-600" />
                                            Sesi Mentoring ({mentoring.sessions.length})
                                        </CardTitle>
                                    </CardHeader>
                                    <CardContent>
                                        <div className="space-y-4">
                                            {mentoring.sessions.map((session, idx) => (
                                                <div
                                                    key={session.id}
                                                    className="flex items-start gap-4 p-4 rounded-lg bg-muted/50"
                                                >
                                                    <div className="flex h-8 w-8 items-center justify-center rounded-full bg-emerald-100 text-emerald-600 font-semibold text-sm dark:bg-emerald-900">
                                                        {idx + 1}
                                                    </div>
                                                    <div className="flex-1">
                                                        <h4 className="font-medium">
                                                            {session.title || `Sesi ${idx + 1}`}
                                                        </h4>
                                                        <div className="mt-1 flex flex-wrap gap-4 text-sm text-muted-foreground">
                                                            <span className="flex items-center gap-1">
                                                                <Calendar className="h-4 w-4" />
                                                                {format(
                                                                    new Date(session.scheduled_at),
                                                                    'dd MMM yyyy, HH:mm',
                                                                    { locale: id }
                                                                )}
                                                            </span>
                                                            {session.location && (
                                                                <span className="flex items-center gap-1">
                                                                    <MapPin className="h-4 w-4" />
                                                                    {session.location}
                                                                </span>
                                                            )}
                                                        </div>
                                                    </div>
                                                    <Badge
                                                        variant={
                                                            session.status === 'completed'
                                                                ? 'default'
                                                                : session.status === 'cancelled'
                                                                    ? 'destructive'
                                                                    : 'secondary'
                                                        }
                                                    >
                                                        {session.status === 'completed'
                                                            ? 'Selesai'
                                                            : session.status === 'cancelled'
                                                                ? 'Dibatalkan'
                                                                : 'Terjadwal'}
                                                    </Badge>
                                                </div>
                                            ))}
                                        </div>
                                    </CardContent>
                                </Card>
                            )}
                        </div>

                        {/* Sidebar */}
                        <div className="space-y-6">
                            {/* Mentor Info */}
                            <Card>
                                <CardHeader>
                                    <CardTitle className="flex items-center gap-2 text-lg">
                                        <User className="h-5 w-5 text-emerald-600" />
                                        Mentor
                                    </CardTitle>
                                </CardHeader>
                                <CardContent>
                                    {mentoring.mentor ? (
                                        <div className="flex items-center gap-3">
                                            <div className="flex h-12 w-12 items-center justify-center rounded-full bg-emerald-100 text-emerald-600 font-bold dark:bg-emerald-900">
                                                {mentoring.mentor.name?.charAt(0).toUpperCase()}
                                            </div>
                                            <div>
                                                <p className="font-medium">{mentoring.mentor.name}</p>
                                                <p className="text-sm text-muted-foreground">
                                                    {mentoring.mentor.email}
                                                </p>
                                            </div>
                                        </div>
                                    ) : (
                                        <p className="text-muted-foreground">Belum ditentukan</p>
                                    )}
                                </CardContent>
                            </Card>

                            {/* Program Duration */}
                            <Card>
                                <CardHeader>
                                    <CardTitle className="flex items-center gap-2 text-lg">
                                        <Clock className="h-5 w-5 text-emerald-600" />
                                        Durasi Program
                                    </CardTitle>
                                </CardHeader>
                                <CardContent className="space-y-3">
                                    <div className="flex items-center justify-between text-sm">
                                        <span className="text-muted-foreground">Mulai</span>
                                        <span className="font-medium">
                                            {format(new Date(mentoring.start_date), 'dd MMM yyyy', {
                                                locale: id,
                                            })}
                                        </span>
                                    </div>
                                    <div className="flex items-center justify-between text-sm">
                                        <span className="text-muted-foreground">Selesai</span>
                                        <span className="font-medium">
                                            {format(new Date(mentoring.end_date), 'dd MMM yyyy', {
                                                locale: id,
                                            })}
                                        </span>
                                    </div>
                                    <div className="border-t pt-3">
                                        <div className="flex items-center justify-between text-sm">
                                            <span className="text-muted-foreground">Total Durasi</span>
                                            <span className="font-medium">
                                                {(() => {
                                                    const diffMs = new Date(mentoring.end_date).getTime() - new Date(mentoring.start_date).getTime();
                                                    const diffDays = Math.ceil(diffMs / (1000 * 60 * 60 * 24));
                                                    if (diffDays < 7) {
                                                        return `${diffDays} Hari`;
                                                    } else if (diffDays < 30) {
                                                        const weeks = Math.round(diffDays / 7);
                                                        return `${weeks} Minggu`;
                                                    } else {
                                                        const months = Math.round(diffDays / 30);
                                                        return `${months} Bulan`;
                                                    }
                                                })()}
                                            </span>
                                        </div>
                                    </div>
                                </CardContent>
                            </Card>

                            {/* Notes */}
                            {mentoring.notes && (
                                <Card>
                                    <CardHeader>
                                        <CardTitle className="text-lg">Catatan</CardTitle>
                                    </CardHeader>
                                    <CardContent>
                                        <p className="text-sm text-muted-foreground whitespace-pre-wrap">
                                            {mentoring.notes}
                                        </p>
                                    </CardContent>
                                </Card>
                            )}
                        </div>
                    </div>
                </div>
            </main>
            <Footer />
        </div>
    );
}