import { Building2 } from 'lucide-react';

export function AboutHero() {
    return (
        <section className="relative overflow-hidden border-b bg-gradient-to-b from-primary/5 to-background py-20 md:py-32">
            <div className="container mx-auto px-4">
                <div className="mx-auto max-w-3xl text-center">
                    <div className="mb-6 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                        <Building2 className="h-8 w-8 text-primary" />
                    </div>
                    <h1 className="mb-6 text-4xl font-bold tracking-tight text-balance md:text-5xl lg:text-6xl">
                        Tentang SI UMKM Cirebon
                    </h1>
                    <p className="text-lg text-pretty text-muted-foreground md:text-xl">
                        Platform digital yang menghubungkan UMKM Cirebon dengan
                        peluang pertumbuhan dan pemberdayaan ekonomi lokal
                    </p>
                </div>
            </div>
        </section>
    );
}
