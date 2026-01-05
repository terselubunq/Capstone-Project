'use client';

import { Button } from '@/components/ui/button';
import {
    Avatar,
    AvatarFallback,
    AvatarImage,
} from '@/components/ui/avatar';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import {
    Sheet,
    SheetContent,
    SheetHeader,
    SheetTitle,
    SheetTrigger,
} from '@/components/ui/sheet';
import { Link, usePage } from '@inertiajs/react';
import type { PageProps } from '@/types';
import { Menu, Store } from 'lucide-react';
import { useState } from 'react';

export function Navigation() {
    const { auth } = usePage<PageProps>().props;
    const [open, setOpen] = useState(false);

    return (
        <header className="border-border/40 bg-background/95 supports-[backdrop-filter]:bg-background/60 sticky top-0 z-50 w-full border-b backdrop-blur">
            <div className="container mx-auto flex h-16 items-center justify-between px-4">
                {/* === LOGO === */}
                <Link href="/" className="flex items-center gap-2">
                    <img
                        src="/logo.png"
                        alt="SI UMKM Cirebon"
                        className="h-10 w-auto"
                    />
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
                    {/* Desktop Auth Actions */}
                    {auth.user ? (
                        <UserMenu user={auth.user} />
                    ) : (
                        <>
                            <Button
                                variant="ghost"
                                size="sm"
                                className="hidden md:inline-flex"
                                asChild
                            >
                                <a href="/login">
                                    Masuk
                                </a>
                            </Button>
                            <Button size="sm" asChild className="hidden md:inline-flex">
                                <a href="/umkm-owner/register">Daftar UMKM</a>
                            </Button>
                        </>
                    )}

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
                                    <img
                                        src="/logo.png"
                                        alt="SI UMKM Cirebon"
                                        className="h-8 w-auto"
                                    />
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
                                    {auth.user ? (
                                        <div className="flex flex-col gap-3">
                                            <div className="flex items-center gap-3 rounded-lg bg-muted p-3">
                                                <Avatar className="size-10">
                                                    <AvatarImage
                                                        src={auth.user.avatar ?? undefined}
                                                        alt={auth.user.name}
                                                    />
                                                    <AvatarFallback>
                                                        {getInitials(auth.user.name)}
                                                    </AvatarFallback>
                                                </Avatar>
                                                <div className="flex flex-col">
                                                    <p className="text-sm font-medium">
                                                        {auth.user.name}
                                                    </p>
                                                    <p className="text-xs text-muted-foreground">
                                                        {auth.user.email}
                                                    </p>
                                                </div>
                                            </div>
                                            <Button
                                                variant="outline"
                                                asChild
                                                onClick={() => setOpen(false)}
                                            >
                                                <a href={getDashboardUrl(auth.user.role)}>
                                                    Dashboard
                                                </a>
                                            </Button>
                                            <Button
                                                variant="ghost"
                                                asChild
                                                onClick={() => setOpen(false)}
                                            >
                                                <Link href="/logout" method="post" as="button">
                                                    Logout
                                                </Link>
                                            </Button>
                                        </div>
                                    ) : (
                                        <>
                                            <Button
                                                variant="outline"
                                                asChild
                                                onClick={() => setOpen(false)}
                                            >
                                                <a href="/login">
                                                    Masuk
                                                </a>
                                            </Button>
                                            <Button
                                                asChild
                                                onClick={() => setOpen(false)}
                                            >
                                                <a href="/umkm-owner/register">
                                                    Daftar UMKM
                                                </a>
                                            </Button>
                                        </>
                                    )}
                                </div>
                            </nav>
                        </SheetContent>
                    </Sheet>
                </div>
            </div>
        </header>
    );
}

function UserMenu({ user }: { user: NonNullable<PageProps['auth']['user']> }) {
    const getRoleBadgeColor = (role?: string): string => {
        const colors: Record<string, string> = {
            'super-admin': 'bg-purple-500',
            admin: 'bg-blue-500',
            mentor: 'bg-green-500',
            staff: 'bg-yellow-500',
            'umkm-owner': 'bg-orange-500',
        };
        return colors[role ?? ''] ?? 'bg-gray-500';
    };

    const getRoleDisplayName = (role?: string): string => {
        const names: Record<string, string> = {
            'super-admin': 'Super Admin',
            admin: 'Admin',
            mentor: 'Mentor',
            staff: 'Staff',
            'umkm-owner': 'UMKM Owner',
        };
        return names[role ?? ''] ?? role ?? '';
    };

    return (
        <DropdownMenu>
            <DropdownMenuTrigger asChild>
                <Button variant="ghost" className="relative h-10 gap-2 rounded-full">
                    <Avatar className="size-8">
                        <AvatarImage
                            src={user.avatar ?? undefined}
                            alt={user.name}
                        />
                        <AvatarFallback>{getInitials(user.name)}</AvatarFallback>
                    </Avatar>
                    <span className="hidden md:inline-block">{user.name}</span>
                </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent className="w-56" align="end" forceMount>
                <DropdownMenuLabel className="font-normal">
                    <div className="flex flex-col gap-1">
                        <p className="text-sm font-medium leading-none">
                            {user.name}
                        </p>
                        <p className="text-xs leading-none text-muted-foreground">
                            {user.email}
                        </p>
                        {user.role && (
                            <span
                                className={`mt-1 inline-flex w-fit items-center rounded-full px-2 py-1 text-xs font-medium text-white ${getRoleBadgeColor(user.role)}`}
                            >
                                {getRoleDisplayName(user.role)}
                            </span>
                        )}
                    </div>
                </DropdownMenuLabel>
                <DropdownMenuSeparator />
                <DropdownMenuItem asChild>
                    <a href={getDashboardUrl(user.role)} className="cursor-pointer">
                        Dashboard
                    </a>
                </DropdownMenuItem>
                <DropdownMenuSeparator />
                <DropdownMenuItem asChild>
                    <Link href="/logout" method="post" as="button" className="w-full cursor-pointer">
                        Logout
                    </Link>
                </DropdownMenuItem>
            </DropdownMenuContent>
        </DropdownMenu>
    );
}

function getInitials(name: string): string {
    return name
        .split(' ')
        .map((n) => n[0])
        .join('')
        .toUpperCase()
        .slice(0, 2);
}

function getDashboardUrl(role?: string): string {
    if (!role) {
        return '/';
    }

    return `/${role}`;
}
