import { Card, CardContent } from '@/components/ui/card';
import { Eye, Target } from 'lucide-react';

export function MissionVision() {
    return (
        <section className="py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="grid gap-8 md:grid-cols-2">
                    <Card className="border-2">
                        <CardContent className="p-8">
                            <div className="mb-4 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                                <Eye className="h-6 w-6 text-primary" />
                            </div>
                            <h2 className="mb-4 text-2xl font-bold">Visi</h2>
                            <p className="leading-relaxed text-pretty text-muted-foreground">
                                Menjadi platform terdepan dalam pemberdayaan dan
                                pengembangan UMKM di Kota Cirebon, mendorong
                                pertumbuhan ekonomi lokal yang berkelanjutan dan
                                inklusif.
                            </p>
                        </CardContent>
                    </Card>

                    <Card className="border-2">
                        <CardContent className="p-8">
                            <div className="mb-4 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                                <Target className="h-6 w-6 text-primary" />
                            </div>
                            <h2 className="mb-4 text-2xl font-bold">Misi</h2>
                            <ul className="space-y-3 leading-relaxed text-pretty text-muted-foreground">
                                <li className="flex gap-2">
                                    <span className="text-primary">•</span>
                                    <span>
                                        Memfasilitasi digitalisasi dan
                                        modernisasi UMKM Cirebon
                                    </span>
                                </li>
                                <li className="flex gap-2">
                                    <span className="text-primary">•</span>
                                    <span>
                                        Menyediakan akses ke program mentoring
                                        dan pelatihan berkualitas
                                    </span>
                                </li>
                                <li className="flex gap-2">
                                    <span className="text-primary">•</span>
                                    <span>
                                        Menghubungkan UMKM dengan pasar yang
                                        lebih luas
                                    </span>
                                </li>
                                <li className="flex gap-2">
                                    <span className="text-primary">•</span>
                                    <span>
                                        Mendukung sertifikasi dan legalitas
                                        usaha
                                    </span>
                                </li>
                            </ul>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </section>
    );
}
