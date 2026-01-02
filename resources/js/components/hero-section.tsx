import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Link } from '@inertiajs/react';
import { ArrowRight, Search } from 'lucide-react';

export function HeroSection() {
    return (
        <section className="relative overflow-hidden border-b bg-gradient-to-b from-muted/50 to-background py-20 md:py-32">
            <div className="container mx-auto px-4">
                <div className="mx-auto max-w-4xl text-center">
                    <div className="mb-6 inline-flex items-center gap-2 rounded-full border bg-card px-4 py-1.5 text-sm">
                        <span className="relative flex h-2 w-2">
                            <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-primary opacity-75"></span>
                            <span className="relative inline-flex h-2 w-2 rounded-full bg-primary"></span>
                        </span>
                        <span className="text-muted-foreground">
                            Platform Resmi Dinas Koperasi Cirebon
                        </span>
                    </div>

                    <h1 className="mb-6 text-4xl font-bold tracking-tight text-balance md:text-6xl">
                        Temukan UMKM Lokal Terbaik di Cirebon
                    </h1>

                    <p className="mb-10 text-lg text-balance text-muted-foreground md:text-xl">
                        Jelajahi ribuan usaha mikro, kecil, dan menengah yang
                        telah terverifikasi. Dukung ekonomi lokal dengan produk
                        berkualitas dari UMKM Cirebon.
                    </p>

                    <div className="mb-8 flex flex-col gap-3 sm:flex-row sm:justify-center">
                        <Button size="lg" className="gap-2" asChild>
                            <Link href="/katalog">
                                Jelajahi Katalog
                                <ArrowRight className="h-4 w-4" />
                            </Link>
                        </Button>
                        <Button size="lg" variant="outline" asChild>
                            <a href="/daftar">Daftarkan UMKM Anda</a>
                        </Button>
                    </div>

                    <div className="mx-auto max-w-2xl">
                        <form
                            className="flex gap-2"
                            onSubmit={(e) => {
                                e.preventDefault();
                                const formData = new FormData(e.currentTarget);
                                const search = formData.get('search') as string;
                                window.location.href = `/katalog?search=${encodeURIComponent(search)}`;
                            }}
                        >
                            <div className="relative flex-1">
                                <Search className="absolute top-1/2 left-3 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                                <Input
                                    type="search"
                                    name="search"
                                    placeholder="Cari UMKM, produk, atau kategori..."
                                    className="h-12 pl-10"
                                />
                            </div>
                            <Button type="submit" size="lg">
                                Cari
                            </Button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    );
}
