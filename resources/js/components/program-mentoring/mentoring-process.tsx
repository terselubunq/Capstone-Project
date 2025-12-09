import { CheckCircle2 } from 'lucide-react';

const steps = [
    {
        number: '01',
        title: 'Pendaftaran',
        description:
            'Daftar melalui dashboard UMKM Anda dan pilih program yang sesuai',
    },
    {
        number: '02',
        title: 'Seleksi',
        description: 'Tim kami akan meninjau pendaftaran dan menghubungi Anda',
    },
    {
        number: '03',
        title: 'Orientasi',
        description:
            'Ikuti sesi orientasi dan kenali mentor serta peserta lainnya',
    },
    {
        number: '04',
        title: 'Pembelajaran',
        description: 'Ikuti sesi mentoring sesuai jadwal yang telah ditentukan',
    },
    {
        number: '05',
        title: 'Praktik',
        description: 'Terapkan ilmu yang didapat langsung di bisnis Anda',
    },
    {
        number: '06',
        title: 'Sertifikasi',
        description: 'Dapatkan sertifikat setelah menyelesaikan program',
    },
];

export function MentoringProcess() {
    return (
        <section className="py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mb-12 text-center">
                    <h2 className="mb-4 text-3xl font-bold md:text-4xl">
                        Alur Program Mentoring
                    </h2>
                    <p className="text-pretty text-muted-foreground">
                        Proses sederhana untuk memulai perjalanan pengembangan
                        bisnis Anda
                    </p>
                </div>

                <div className="mx-auto max-w-4xl">
                    <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
                        {steps.map((step, index) => (
                            <div key={index} className="relative">
                                <div className="mb-4 flex items-center gap-4">
                                    <div className="flex h-12 w-12 items-center justify-center rounded-full bg-primary text-lg font-bold text-primary-foreground">
                                        {step.number}
                                    </div>
                                    <CheckCircle2 className="h-5 w-5 text-primary" />
                                </div>
                                <h3 className="mb-2 font-semibold">
                                    {step.title}
                                </h3>
                                <p className="text-sm leading-relaxed text-muted-foreground">
                                    {step.description}
                                </p>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </section>
    );
}
