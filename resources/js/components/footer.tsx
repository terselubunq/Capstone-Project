import { Link } from '@inertiajs/react';
import { Facebook, Instagram, Mail, MapPin, Phone } from 'lucide-react';

export function Footer() {
    return (
        <footer className="bg-muted/30 border-t">
            <div className="container mx-auto px-4 py-12 md:py-16">
                <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-4">
                    <div>
                        <Link
                            href="/"
                            className="mb-4 flex items-center gap-2"
                            prefetch="hover"
                        >
                            <img
                                src="/logo.png"
                                alt="SI UMKM Cirebon"
                                className="h-10 w-auto"
                            />
                        </Link>
                        <p className="text-muted-foreground mb-4 text-sm">
                            Platform resmi Dinas Koperasi Cirebon untuk
                            mengelola dan mempromosikan UMKM lokal.
                        </p>
                        <div className="flex gap-3">
                            <a
                                href="https://facebook.com"
                                target="_blank"
                                rel="noopener noreferrer"
                                className="hover:bg-muted flex h-9 w-9 items-center justify-center rounded-lg border transition-colors"
                            >
                                <Facebook className="h-4 w-4" />
                            </a>
                            <a
                                href="https://instagram.com"
                                target="_blank"
                                rel="noopener noreferrer"
                                className="hover:bg-muted flex h-9 w-9 items-center justify-center rounded-lg border transition-colors"
                            >
                                <Instagram className="h-4 w-4" />
                            </a>
                        </div>
                    </div>

                    <div>
                        <h3 className="mb-4 font-semibold">Navigasi</h3>
                        <ul className="space-y-2 text-sm">
                            <li>
                                <Link
                                    href="/"
                                    className="text-muted-foreground hover:text-foreground transition-colors"
                                    prefetch="hover"
                                >
                                    Beranda
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/katalog"
                                    className="text-muted-foreground hover:text-foreground transition-colors"
                                    prefetch="hover"
                                >
                                    Katalog UMKM
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/tentang"
                                    className="text-muted-foreground hover:text-foreground transition-colors"
                                    prefetch="hover"
                                >
                                    Tentang Kami
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/kontak"
                                    className="text-muted-foreground hover:text-foreground transition-colors"
                                    prefetch="hover"
                                >
                                    Kontak
                                </Link>
                            </li>
                        </ul>
                    </div>

                    <div>
                        <h3 className="mb-4 font-semibold">Layanan</h3>
                        <ul className="space-y-2 text-sm">
                            <li>
                                <a
                                    href="/daftar"
                                    className="text-muted-foreground hover:text-foreground transition-colors"
                                >
                                    Daftar UMKM
                                </a>
                            </li>
                            <li>
                                <a
                                    href="/mentor"
                                    className="text-muted-foreground hover:text-foreground transition-colors"
                                >
                                    Program Mentoring
                                </a>
                            </li>
                            <li>
                                <Link
                                    href="/bantuan"
                                    className="text-muted-foreground hover:text-foreground transition-colors"
                                    prefetch="hover"
                                >
                                    Bantuan
                                </Link>
                            </li>
                            <li>
                                <a
                                    href="/umkm-owner/login"
                                    className="text-muted-foreground hover:text-foreground transition-colors"
                                >
                                    Login
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div>
                        <h3 className="mb-4 font-semibold">Kontak</h3>
                        <ul className="space-y-3 text-sm">
                            <li className="text-muted-foreground flex items-start gap-2">
                                <MapPin className="mt-0.5 h-4 w-4 shrink-0" />
                                <span>
                                    Jl. Kesambi No. 123, Kota Cirebon, Jawa
                                    Barat 45133
                                </span>
                            </li>
                            <li className="text-muted-foreground flex items-center gap-2">
                                <Phone className="h-4 w-4 shrink-0" />
                                <span>(0231) 123456</span>
                            </li>
                            <li className="text-muted-foreground flex items-center gap-2">
                                <Mail className="h-4 w-4 shrink-0" />
                                <span>info@umkmcirebon.go.id</span>
                            </li>
                        </ul>
                    </div>
                </div>

                <div className="text-muted-foreground mt-12 border-t pt-8 text-center text-sm">
                    <p>
                        © {new Date().getFullYear()} Dinas Koperasi Kota
                        Cirebon. Seluruh hak cipta dilindungi.
                    </p>
                </div>
            </div>
        </footer>
    );
}
