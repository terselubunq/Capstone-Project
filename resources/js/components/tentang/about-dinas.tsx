import { Award, Building2, TrendingUp, Users } from 'lucide-react';

export function AboutDinas() {
    return (
        <section className="border-y bg-muted/30 py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mx-auto max-w-3xl text-center">
                    <h2 className="mb-4 text-3xl font-bold md:text-4xl">
                        Dinas Koperasi Kota Cirebon
                    </h2>
                    <p className="mb-12 text-lg text-pretty text-muted-foreground">
                        Lembaga pemerintah yang berkomitmen untuk memberdayakan
                        dan mengembangkan UMKM serta koperasi di Kota Cirebon
                    </p>
                </div>

                <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-4">
                    <div className="flex flex-col items-center text-center">
                        <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                            <Building2 className="h-8 w-8 text-primary" />
                        </div>
                        <h3 className="mb-2 font-semibold">Pembinaan</h3>
                        <p className="text-sm text-muted-foreground">
                            Memberikan pembinaan dan pendampingan kepada UMKM
                        </p>
                    </div>

                    <div className="flex flex-col items-center text-center">
                        <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                            <Users className="h-8 w-8 text-primary" />
                        </div>
                        <h3 className="mb-2 font-semibold">Pelatihan</h3>
                        <p className="text-sm text-muted-foreground">
                            Menyelenggarakan program pelatihan dan mentoring
                        </p>
                    </div>

                    <div className="flex flex-col items-center text-center">
                        <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                            <Award className="h-8 w-8 text-primary" />
                        </div>
                        <h3 className="mb-2 font-semibold">Sertifikasi</h3>
                        <p className="text-sm text-muted-foreground">
                            Memfasilitasi proses sertifikasi dan legalitas usaha
                        </p>
                    </div>

                    <div className="flex flex-col items-center text-center">
                        <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                            <TrendingUp className="h-8 w-8 text-primary" />
                        </div>
                        <h3 className="mb-2 font-semibold">Pengembangan</h3>
                        <p className="text-sm text-muted-foreground">
                            Mendorong pertumbuhan dan daya saing UMKM
                        </p>
                    </div>
                </div>
            </div>
        </section>
    );
}
