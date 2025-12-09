import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Link } from '@inertiajs/react';
import { ArrowRight, Store, Users } from 'lucide-react';

export function CtaSection() {
    return (
        <section className="py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="grid gap-6 lg:grid-cols-2">
                    <Card className="overflow-hidden border-2 border-primary/20 bg-gradient-to-br from-primary/5 to-primary/10">
                        <CardContent className="p-8 md:p-10">
                            <div className="mb-6 flex h-14 w-14 items-center justify-center rounded-xl bg-primary">
                                <Store className="h-7 w-7 text-primary-foreground" />
                            </div>
                            <h3 className="mb-3 text-2xl font-bold">
                                Daftarkan UMKM Anda
                            </h3>
                            <p className="mb-6 text-balance text-muted-foreground">
                                Bergabunglah dengan ribuan UMKM lainnya dan
                                dapatkan akses ke program pendampingan,
                                pelatihan, dan promosi gratis dari Dinas
                                Koperasi Cirebon.
                            </p>
                            <ul className="mb-6 space-y-2 text-sm">
                                <li className="flex items-center gap-2">
                                    <div className="h-1.5 w-1.5 rounded-full bg-primary" />
                                    <span>
                                        Verifikasi resmi dari pemerintah
                                    </span>
                                </li>
                                <li className="flex items-center gap-2">
                                    <div className="h-1.5 w-1.5 rounded-full bg-primary" />
                                    <span>
                                        Promosi gratis di platform digital
                                    </span>
                                </li>
                                <li className="flex items-center gap-2">
                                    <div className="h-1.5 w-1.5 rounded-full bg-primary" />
                                    <span>
                                        Akses program mentoring dan pelatihan
                                    </span>
                                </li>
                            </ul>
                            <Button size="lg" className="gap-2" asChild>
                                <Link href="/daftar">
                                    Daftar Sekarang
                                    <ArrowRight className="h-4 w-4" />
                                </Link>
                            </Button>
                        </CardContent>
                    </Card>

                    <Card className="overflow-hidden border-2 border-secondary/20 bg-gradient-to-br from-secondary/5 to-secondary/10">
                        <CardContent className="p-8 md:p-10">
                            <div className="mb-6 flex h-14 w-14 items-center justify-center rounded-xl bg-secondary">
                                <Users className="h-7 w-7 text-secondary-foreground" />
                            </div>
                            <h3 className="mb-3 text-2xl font-bold">
                                Jadi Mentor UMKM
                            </h3>
                            <p className="mb-6 text-balance text-muted-foreground">
                                Bagikan pengalaman dan keahlian Anda untuk
                                membantu UMKM lokal berkembang. Jadilah bagian
                                dari gerakan pemberdayaan ekonomi Cirebon.
                            </p>
                            <ul className="mb-6 space-y-2 text-sm">
                                <li className="flex items-center gap-2">
                                    <div className="h-1.5 w-1.5 rounded-full bg-secondary" />
                                    <span>
                                        Dampingi UMKM sesuai keahlian Anda
                                    </span>
                                </li>
                                <li className="flex items-center gap-2">
                                    <div className="h-1.5 w-1.5 rounded-full bg-secondary" />
                                    <span>Jadwal fleksibel dan hybrid</span>
                                </li>
                                <li className="flex items-center gap-2">
                                    <div className="h-1.5 w-1.5 rounded-full bg-secondary" />
                                    <span>Sertifikat dan apresiasi resmi</span>
                                </li>
                            </ul>
                            <Button
                                size="lg"
                                variant="secondary"
                                className="gap-2"
                                asChild
                            >
                                <Link href="/mentor">
                                    Pelajari Lebih Lanjut
                                    <ArrowRight className="h-4 w-4" />
                                </Link>
                            </Button>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </section>
    );
}
