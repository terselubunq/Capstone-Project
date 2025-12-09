import {
    Accordion,
    AccordionContent,
    AccordionItem,
    AccordionTrigger,
} from '@/components/ui/accordion';

const faqs = [
    {
        question: 'Apa itu SI UMKM Cirebon?',
        answer: 'SI UMKM Cirebon adalah platform digital yang dikembangkan oleh Dinas Koperasi Kota Cirebon untuk memfasilitasi pendaftaran, pembinaan, dan pengembangan UMKM di Kota Cirebon. Platform ini menyediakan katalog UMKM, program mentoring, dan berbagai layanan pendukung lainnya.',
    },
    {
        question: 'Bagaimana cara mendaftarkan UMKM saya?',
        answer: "Anda dapat mendaftarkan UMKM dengan mengklik tombol 'Daftar UMKM' di halaman utama. Isi formulir pendaftaran dengan lengkap, termasuk informasi usaha, dokumen legalitas, dan foto produk. Setelah pendaftaran diverifikasi oleh admin, UMKM Anda akan muncul di katalog.",
    },
    {
        question: 'Apakah ada biaya untuk mendaftar?',
        answer: 'Tidak, pendaftaran UMKM di platform SI UMKM Cirebon sepenuhnya gratis. Ini adalah layanan publik dari Dinas Koperasi Kota Cirebon untuk mendukung pertumbuhan UMKM lokal.',
    },
    {
        question: 'Apa saja persyaratan untuk mendaftar?',
        answer: 'Persyaratan dasar meliputi: memiliki usaha yang berdomisili di Kota Cirebon, memiliki NIB (Nomor Induk Berusaha), dan melengkapi dokumen legalitas usaha seperti KTP pemilik. Untuk jenis usaha tertentu, mungkin diperlukan sertifikasi tambahan seperti Halal atau PIRT.',
    },
    {
        question: 'Bagaimana cara mengikuti program mentoring?',
        answer: 'Setelah UMKM Anda terdaftar dan diverifikasi, Anda dapat mendaftar ke program mentoring yang tersedia melalui dashboard UMKM Anda. Pilih program yang sesuai dengan kebutuhan bisnis Anda, dan tim kami akan menghubungi Anda untuk proses selanjutnya.',
    },
    {
        question: 'Bagaimana cara memperbarui informasi UMKM saya?',
        answer: "Login ke akun UMKM Anda, masuk ke dashboard, dan pilih menu 'Profil UMKM'. Di sana Anda dapat memperbarui informasi usaha, menambah produk baru, atau mengubah foto dan deskripsi. Perubahan akan ditinjau oleh admin sebelum dipublikasikan.",
    },
    {
        question: 'Apa keuntungan terdaftar di SI UMKM Cirebon?',
        answer: 'Keuntungan meliputi: visibilitas produk di katalog online, akses ke program mentoring dan pelatihan gratis, bantuan proses sertifikasi, networking dengan UMKM lain, dan kesempatan untuk mengikuti event dan pameran yang diselenggarakan Dinas Koperasi.',
    },
    {
        question: 'Bagaimana jika saya lupa password?',
        answer: "Klik 'Lupa Password' di halaman login, masukkan email yang terdaftar, dan kami akan mengirimkan link reset password ke email Anda. Ikuti instruksi di email untuk membuat password baru.",
    },
];

export function FAQSection() {
    return (
        <section className="py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mb-12 text-center">
                    <h2 className="mb-4 text-3xl font-bold md:text-4xl">
                        Pertanyaan yang Sering Diajukan
                    </h2>
                    <p className="text-pretty text-muted-foreground">
                        Temukan jawaban untuk pertanyaan umum tentang platform
                        kami
                    </p>
                </div>

                <div className="mx-auto max-w-3xl">
                    <Accordion type="single" collapsible className="w-full">
                        {faqs.map((faq, index) => (
                            <AccordionItem key={index} value={`item-${index}`}>
                                <AccordionTrigger className="text-left">
                                    {faq.question}
                                </AccordionTrigger>
                                <AccordionContent className="leading-relaxed text-pretty text-muted-foreground">
                                    {faq.answer}
                                </AccordionContent>
                            </AccordionItem>
                        ))}
                    </Accordion>
                </div>
            </div>
        </section>
    );
}
