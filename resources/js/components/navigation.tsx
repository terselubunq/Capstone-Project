'use client';

import { ThemeToggle } from '@/components/theme-toggle';
import { Button } from '@/components/ui/button';
import {
    Sheet,
    SheetContent,
    SheetHeader,
    SheetTitle,
    SheetTrigger,
} from '@/components/ui/sheet';
import { Link } from '@inertiajs/react';
import { Menu, Store } from 'lucide-react';
import { useState } from 'react';

export function Navigation() {
    const [open, setOpen] = useState(false);

    return (
        <header className="border-border/40 bg-background/95 supports-[backdrop-filter]:bg-background/60 sticky top-0 z-50 w-full border-b backdrop-blur">
            <div className="container mx-auto flex h-16 items-center justify-between px-4">
                {/* === LOGO === */}
                <Link href="/" className="flex items-center gap-2">
                    <div className="bg-primary flex h-10 w-10 items-center justify-center rounded-lg">
                        <Store className="text-primary-foreground h-6 w-6" />
                    </div>
                    <div className="flex flex-col">
                        <span className="text-lg font-bold leading-tight">
                            SI UMKM
                        </span>
                        <span className="text-muted-foreground text-xs">
                            Cirebon
                        </span>
                    </div>
                </Link>

                {/* === NAV MENU (Desktop) === */}
                <nav className="hidden items-center gap-6 md:flex">
                    <Link
                        href="/"
                        className="hover:text-primary text-sm font-medium transition-colors"
                        prefetch="hover"
                    >
                        Beranda
                    </Link>
                    <Link
                        href="/katalog"
                        className="hover:text-primary text-sm font-medium transition-colors"
                        prefetch="hover"
                    >
                        Katalog UMKM
                    </Link>
                    <Link
                        href="/program-mentoring"
                        className="hover:text-primary text-sm font-medium transition-colors"
                        prefetch="hover"
                    >
                        Program Mentoring
                    </Link>
                    <Link
                        href="/tentang"
                        className="hover:text-primary text-sm font-medium transition-colors"
                        prefetch="hover"
                    >
                        Tentang
                    </Link>
                    <Link
                        href="/bantuan"
                        className="hover:text-primary text-sm font-medium transition-colors"
                        prefetch="hover"
                    >
                        Bantuan
                    </Link>
                    <Link
                        href="/kontak"
                        className="hover:text-primary text-sm font-medium transition-colors"
                        prefetch="hover"
                    >
                        Kontak
                    </Link>
                </nav>

                {/* === ACTION BUTTONS + TOGGLE + MENU === */}
                <div className="flex items-center gap-3">
                    {/* Tombol Masuk (Desktop) */}
                    <Button
                        variant="ghost"
                        size="sm"
                        className="hidden md:inline-flex"
                        asChild
                    >
                        <Link href="/login" prefetch="hover">
                            Masuk
                        </Link>
                    </Button>

                    {/* Tombol Daftar (Desktop) -> target /daftar-umkm */}
                    <Button size="sm" asChild>
                        <Link href="/daftar-umkm" prefetch="hover">
                            Daftar UMKM
                        </Link>
                    </Button>

                    {/* 🌗 Theme Toggle */}
                    <ThemeToggle />

                    {/* === MOBILE MENU === */}
                    <Sheet open={open} onOpenChange={setOpen}>
                        <SheetTrigger asChild>
                            <Button
                                variant="ghost"
                                size="icon"
                                className="md:hidden"
                            >
                                <Menu className="h-5 w-5" />
                            </Button>
                        </SheetTrigger>

                        <SheetContent
                            side="right"
                            className="w-[300px] sm:w-[400px]"
                        >
                            <SheetHeader>
                                <SheetTitle className="flex items-center gap-2">
                                    <div className="bg-primary flex h-8 w-8 items-center justify-center rounded-lg">
                                        <Store className="text-primary-foreground h-5 w-5" />
                                    </div>
                                    <span>SI UMKM Cirebon</span>
                                </SheetTitle>
                            </SheetHeader>

                            {/* === MOBILE NAV === */}
                            <nav className="mt-8 flex flex-col gap-4">
                                {[
                                    ['/', 'Beranda'],
                                    ['/katalog', 'Katalog UMKM'],
                                    ['/program-mentoring', 'Program Mentoring'],
                                    ['/tentang', 'Tentang'],
                                    ['/bantuan', 'Bantuan'],
                                    ['/kontak', 'Kontak'],
                                ].map(([href, label]) => (
                                    <Link
                                        key={href}
                                        href={href}
                                        className="hover:text-primary text-base font-medium transition-colors"
                                        onClick={() => setOpen(false)}
                                        prefetch="hover"
                                    >
                                        {label}
                                    </Link>
                                ))}

                                {/* === ACTION BUTTONS (Mobile) === */}
                                <div className="mt-4 flex flex-col gap-3 border-t pt-4">
                                    <Button
                                        variant="outline"
                                        asChild
                                        onClick={() => setOpen(false)}
                                    >
                                        <Link href="/login" prefetch="hover">
                                            Masuk
                                        </Link>
                                    </Button>
                                    <Button
                                        asChild
                                        onClick={() => setOpen(false)}
                                    >
                                        {/* Mobile Daftar -> juga ke /daftar-umkm */}
                                        <Link
                                            href="/daftar-umkm"
                                            prefetch="hover"
                                        >
                                            Daftar UMKM
                                        </Link>
                                    </Button>
                                </div>

                                {/* 🌗 Theme toggle di mobile */}
                                <div className="mt-6 flex items-center justify-center">
                                    <ThemeToggle />
                                </div>
                            </nav>
                        </SheetContent>
                    </Sheet>
                </div>
            </div>
        </header>
    );
}
