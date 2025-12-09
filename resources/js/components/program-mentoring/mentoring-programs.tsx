import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import { Calendar, Clock, Users } from 'lucide-react';

const programs = [
    {
        title: 'Dasar-Dasar Kewirausahaan',
        description:
            'Program untuk pemula yang baru memulai usaha. Pelajari fundamental bisnis, manajemen keuangan dasar, dan strategi pemasaran.',
        duration: '4 Minggu',
        participants: 'Maks. 20 peserta',
        schedule: 'Setiap Senin & Rabu',
        level: 'Pemula',
        status: 'Pendaftaran Dibuka',
    },
    {
        title: 'Digital Marketing untuk UMKM',
        description:
            'Kuasai strategi pemasaran digital, media sosial, dan e-commerce untuk meningkatkan jangkauan pasar Anda.',
        duration: '6 Minggu',
        participants: 'Maks. 15 peserta',
        schedule: 'Setiap Selasa & Kamis',
        level: 'Menengah',
        status: 'Pendaftaran Dibuka',
    },
    {
        title: 'Manajemen Keuangan Bisnis',
        description:
            'Pelajari pembukuan, analisis laporan keuangan, dan perencanaan keuangan untuk keberlanjutan usaha.',
        duration: '5 Minggu',
        participants: 'Maks. 20 peserta',
        schedule: 'Setiap Rabu & Jumat',
        level: 'Menengah',
        status: 'Segera Dibuka',
    },
    {
        title: 'Ekspor & Sertifikasi Produk',
        description:
            'Persiapan ekspor, proses sertifikasi Halal, PIRT, SNI, dan standar internasional lainnya.',
        duration: '8 Minggu',
        participants: 'Maks. 12 peserta',
        schedule: 'Setiap Kamis',
        level: 'Lanjutan',
        status: 'Segera Dibuka',
    },
];

export function MentoringPrograms() {
    return (
        <section className="border-t bg-muted/30 py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mb-12 text-center">
                    <h2 className="mb-4 text-3xl font-bold md:text-4xl">
                        Program yang Tersedia
                    </h2>
                    <p className="text-pretty text-muted-foreground">
                        Pilih program yang sesuai dengan kebutuhan dan tingkat
                        bisnis Anda
                    </p>
                </div>

                <div className="grid gap-6 md:grid-cols-2">
                    {programs.map((program, index) => (
                        <Card key={index} className="flex flex-col">
                            <CardHeader>
                                <div className="mb-2 flex items-center justify-between">
                                    <Badge
                                        variant={
                                            program.status ===
                                            'Pendaftaran Dibuka'
                                                ? 'default'
                                                : 'secondary'
                                        }
                                    >
                                        {program.status}
                                    </Badge>
                                    <Badge variant="outline">
                                        {program.level}
                                    </Badge>
                                </div>
                                <CardTitle>{program.title}</CardTitle>
                                <CardDescription className="text-pretty">
                                    {program.description}
                                </CardDescription>
                            </CardHeader>
                            <CardContent className="flex-1">
                                <div className="space-y-3 text-sm">
                                    <div className="flex items-center gap-2 text-muted-foreground">
                                        <Clock className="h-4 w-4" />
                                        <span>{program.duration}</span>
                                    </div>
                                    <div className="flex items-center gap-2 text-muted-foreground">
                                        <Users className="h-4 w-4" />
                                        <span>{program.participants}</span>
                                    </div>
                                    <div className="flex items-center gap-2 text-muted-foreground">
                                        <Calendar className="h-4 w-4" />
                                        <span>{program.schedule}</span>
                                    </div>
                                </div>
                                <Button
                                    className="mt-6 w-full"
                                    disabled={
                                        program.status !== 'Pendaftaran Dibuka'
                                    }
                                >
                                    {program.status === 'Pendaftaran Dibuka'
                                        ? 'Daftar Sekarang'
                                        : 'Segera Hadir'}
                                </Button>
                            </CardContent>
                        </Card>
                    ))}
                </div>
            </div>
        </section>
    );
}
