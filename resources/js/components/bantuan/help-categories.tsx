import { Card, CardContent } from '@/components/ui/card';
import { Link } from '@inertiajs/react';
import {
    Award,
    FileText,
    MessageCircle,
    Settings,
    Store,
    Users,
} from 'lucide-react';

const categories = [
    {
        icon: Store,
        title: 'Pendaftaran UMKM',
        description: 'Panduan lengkap mendaftarkan usaha Anda',
        href: '#',
    },
    {
        icon: Users,
        title: 'Program Mentoring',
        description: 'Informasi tentang program pembinaan',
        href: '#',
    },
    {
        icon: FileText,
        title: 'Dokumen & Legalitas',
        description: 'Persyaratan dokumen dan sertifikasi',
        href: '#',
    },
    {
        icon: Award,
        title: 'Sertifikasi',
        description: 'Proses sertifikasi Halal, PIRT, dan lainnya',
        href: '#',
    },
    {
        icon: Settings,
        title: 'Pengaturan Akun',
        description: 'Kelola profil dan pengaturan UMKM',
        href: '#',
    },
    {
        icon: MessageCircle,
        title: 'Hubungi Kami',
        description: 'Butuh bantuan lebih lanjut?',
        href: '/kontak',
    },
];

export function HelpCategories() {
    return (
        <section className="border-t bg-muted/30 py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mb-12 text-center">
                    <h2 className="mb-4 text-3xl font-bold md:text-4xl">
                        Kategori Bantuan
                    </h2>
                    <p className="text-pretty text-muted-foreground">
                        Pilih kategori untuk menemukan informasi yang Anda
                        butuhkan
                    </p>
                </div>

                <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                    {categories.map((category, index) => (
                        <Link key={index} href={category.href}>
                            <Card className="transition-all hover:border-primary hover:shadow-md">
                                <CardContent className="p-6">
                                    <div className="mb-4 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                                        <category.icon className="h-6 w-6 text-primary" />
                                    </div>
                                    <h3 className="mb-2 font-semibold">
                                        {category.title}
                                    </h3>
                                    <p className="text-sm text-muted-foreground">
                                        {category.description}
                                    </p>
                                </CardContent>
                            </Card>
                        </Link>
                    ))}
                </div>
            </div>
        </section>
    );
}
