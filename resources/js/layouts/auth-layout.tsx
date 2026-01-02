import { Store } from 'lucide-react';
import { PropsWithChildren } from 'react';

interface AuthLayoutProps extends PropsWithChildren {
    title: string;
    description: string;
}

export default function AuthLayout({ title, description, children }: AuthLayoutProps) {
    return (
        <div className="relative flex min-h-screen items-center justify-center overflow-hidden bg-gradient-to-br from-emerald-50 via-white to-teal-50 p-4 dark:from-gray-950 dark:via-gray-900 dark:to-gray-950">
            {/* Animated Background Elements */}
            <div className="pointer-events-none absolute inset-0 overflow-hidden">
                {/* Gradient Orbs */}
                <div className="absolute -left-40 -top-40 h-80 w-80 rounded-full bg-gradient-to-br from-emerald-400/30 to-teal-300/20 blur-3xl animate-pulse" />
                <div className="absolute -right-40 -bottom-40 h-96 w-96 rounded-full bg-gradient-to-br from-emerald-400/20 to-teal-300/10 blur-3xl animate-pulse [animation-delay:1s]" />
                <div className="absolute left-1/2 top-1/4 h-64 w-64 -translate-x-1/2 rounded-full bg-gradient-to-br from-emerald-300/10 to-teal-200/10 blur-3xl animate-pulse [animation-delay:2s]" />

                {/* Subtle Grid Pattern */}
                <div className="absolute inset-0 bg-[linear-gradient(rgba(0,0,0,0.02)_1px,transparent_1px),linear-gradient(90deg,rgba(0,0,0,0.02)_1px,transparent_1px)] bg-[size:64px_64px] dark:bg-[linear-gradient(rgba(255,255,255,0.02)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.02)_1px,transparent_1px)]" />
            </div>

            <div className="relative z-10 w-full max-w-md">
                {/* Logo & Header */}
                <div className="mb-8 text-center">
                    <div className="mb-6 flex justify-center">
                        <div className="group relative">
                            {/* Glow Effect */}
                            <div className="absolute -inset-2 rounded-3xl bg-gradient-to-br from-emerald-500 to-teal-500 opacity-20 blur-xl transition-opacity group-hover:opacity-30" />

                            {/* Logo Container */}
                            <div className="relative flex h-20 w-20 items-center justify-center rounded-2xl bg-gradient-to-br from-emerald-500 via-emerald-600 to-teal-600 shadow-2xl shadow-emerald-500/25 ring-1 ring-white/20 transition-transform hover:scale-105">
                                <Store className="h-10 w-10 text-white drop-shadow-md" />
                            </div>
                        </div>
                    </div>

                    {/* Brand Name */}
                    <div className="mb-4">
                        <span className="text-sm font-semibold uppercase tracking-widest text-emerald-600 dark:text-emerald-400">
                            SI UMKM Cirebon
                        </span>
                    </div>

                    <h1 className="text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
                        {title}
                    </h1>
                    <p className="mt-3 text-sm text-gray-600 dark:text-gray-400">
                        {description}
                    </p>
                </div>

                {/* Form Card with Glassmorphism */}
                <div className="relative">
                    {/* Card Glow */}
                    <div className="absolute -inset-1 rounded-3xl bg-gradient-to-br from-emerald-500/20 via-transparent to-teal-500/20 blur-xl" />

                    {/* Card */}
                    <div className="relative rounded-2xl border border-white/50 bg-white/80 p-8 shadow-2xl shadow-gray-200/50 backdrop-blur-xl dark:border-gray-800/50 dark:bg-gray-900/80 dark:shadow-none">
                        {children}
                    </div>
                </div>

                {/* Footer */}
                <div className="mt-8 flex flex-col items-center gap-4">
                    <div className="flex items-center gap-2 text-xs text-gray-500 dark:text-gray-500">
                        <div className="h-px w-12 bg-gradient-to-r from-transparent via-gray-300 to-transparent dark:via-gray-700" />
                        <span>Platform Resmi</span>
                        <div className="h-px w-12 bg-gradient-to-r from-transparent via-gray-300 to-transparent dark:via-gray-700" />
                    </div>
                    <p className="text-center text-xs text-gray-500 dark:text-gray-500">
                        © {new Date().getFullYear()} Dinas Koperasi Kota Cirebon.
                        <br />
                        Seluruh hak cipta dilindungi.
                    </p>
                </div>
            </div>
        </div>
    );
}
