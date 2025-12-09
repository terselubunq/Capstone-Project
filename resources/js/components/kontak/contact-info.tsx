import { Card, CardContent } from '@/components/ui/card';
import { Clock, Mail, MapPin, Phone } from 'lucide-react';

export function ContactInfo() {
    return (
        <section className="py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mb-12 text-center">
                    <h2 className="mb-4 text-3xl font-bold md:text-4xl">
                        Informasi Kontak
                    </h2>
                    <p className="text-pretty text-muted-foreground">
                        Dinas Koperasi Kota Cirebon
                    </p>
                </div>

                <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-4">
                    <Card>
                        <CardContent className="p-6">
                            <div className="mb-4 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                                <MapPin className="h-6 w-6 text-primary" />
                            </div>
                            <h3 className="mb-2 font-semibold">Alamat</h3>
                            <p className="text-sm leading-relaxed text-muted-foreground">
                                Jl. Kesambi No. 123
                                <br />
                                Kota Cirebon, Jawa Barat
                                <br />
                                45131
                            </p>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardContent className="p-6">
                            <div className="mb-4 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                                <Phone className="h-6 w-6 text-primary" />
                            </div>
                            <h3 className="mb-2 font-semibold">Telepon</h3>
                            <p className="text-sm leading-relaxed text-muted-foreground">
                                (0231) 123456
                                <br />
                                (0231) 123457
                                <br />
                                +62 812-3456-7890
                            </p>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardContent className="p-6">
                            <div className="mb-4 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                                <Mail className="h-6 w-6 text-primary" />
                            </div>
                            <h3 className="mb-2 font-semibold">Email</h3>
                            <p className="text-sm leading-relaxed text-muted-foreground">
                                info@diskop.cirebonkota.go.id
                                <br />
                                umkm@diskop.cirebonkota.go.id
                            </p>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardContent className="p-6">
                            <div className="mb-4 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                                <Clock className="h-6 w-6 text-primary" />
                            </div>
                            <h3 className="mb-2 font-semibold">
                                Jam Operasional
                            </h3>
                            <p className="text-sm leading-relaxed text-muted-foreground">
                                Senin - Jumat
                                <br />
                                08:00 - 16:00 WIB
                                <br />
                                (Tutup hari libur nasional)
                            </p>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </section>
    );
}
