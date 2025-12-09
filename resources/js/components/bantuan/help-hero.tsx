import { HelpCircle } from 'lucide-react';

export function HelpHero() {
    return (
        <section className="relative overflow-hidden border-b bg-gradient-to-b from-primary/5 to-background py-20 md:py-32">
            <div className="container mx-auto px-4">
                <div className="mx-auto max-w-3xl text-center">
                    <div className="mb-6 inline-flex items-center justify-center rounded-full bg-primary/10 p-3">
                        <HelpCircle className="h-8 w-8 text-primary" />
                    </div>
                    <h1 className="mb-6 text-4xl font-bold tracking-tight text-balance md:text-5xl lg:text-6xl">
                        Pusat Bantuan
                    </h1>
                    <p className="text-lg text-pretty text-muted-foreground md:text-xl">
                        Temukan jawaban atas pertanyaan Anda tentang SI UMKM
                        Cirebon
                    </p>
                </div>
            </div>
        </section>
    );
}
