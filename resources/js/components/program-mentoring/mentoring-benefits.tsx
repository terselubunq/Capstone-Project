import { Award, Target, TrendingUp, Users } from 'lucide-react';

export function MentoringBenefits() {
    return (
        <section className="py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mb-12 text-center">
                    <h2 className="mb-4 text-3xl font-bold md:text-4xl">
                        Manfaat Program Mentoring
                    </h2>
                    <p className="text-pretty text-muted-foreground">
                        Dapatkan bimbingan langsung dari mentor berpengalaman
                    </p>
                </div>

                <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-4">
                    <div className="flex flex-col items-center text-center">
                        <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                            <TrendingUp className="h-8 w-8 text-primary" />
                        </div>
                        <h3 className="mb-2 font-semibold">
                            Pertumbuhan Bisnis
                        </h3>
                        <p className="text-sm text-muted-foreground">
                            Strategi untuk meningkatkan omzet dan mengembangkan
                            usaha
                        </p>
                    </div>

                    <div className="flex flex-col items-center text-center">
                        <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                            <Users className="h-8 w-8 text-primary" />
                        </div>
                        <h3 className="mb-2 font-semibold">Networking</h3>
                        <p className="text-sm text-muted-foreground">
                            Bangun jaringan dengan pelaku UMKM dan mentor
                            lainnya
                        </p>
                    </div>

                    <div className="flex flex-col items-center text-center">
                        <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                            <Award className="h-8 w-8 text-primary" />
                        </div>
                        <h3 className="mb-2 font-semibold">Sertifikasi</h3>
                        <p className="text-sm text-muted-foreground">
                            Dapatkan sertifikat setelah menyelesaikan program
                        </p>
                    </div>

                    <div className="flex flex-col items-center text-center">
                        <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
                            <Target className="h-8 w-8 text-primary" />
                        </div>
                        <h3 className="mb-2 font-semibold">Fokus Praktis</h3>
                        <p className="text-sm text-muted-foreground">
                            Materi yang langsung dapat diterapkan di bisnis Anda
                        </p>
                    </div>
                </div>
            </div>
        </section>
    );
}
