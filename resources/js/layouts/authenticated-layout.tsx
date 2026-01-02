// filepath: /Users/aga/Documents/AILSYA2/Untitled/resources/js/layouts/authenticated-layout.tsx
import { PropsWithChildren } from 'react';

interface AuthenticatedLayoutProps extends PropsWithChildren {
    title?: string;
    description?: string;
}

export default function AuthenticatedLayout({ title, description, children }: AuthenticatedLayoutProps) {
    return (
        <div className="min-h-screen bg-gray-100 dark:bg-gray-900">
            {/* Header/Navbar bisa ditambahkan di sini */}
            <header className="bg-white dark:bg-gray-800 shadow">
                <div className="mx-auto max-w-7xl px-4 py-4">
                    <h1 className="text-xl font-bold text-gray-900 dark:text-white">{title}</h1>
                    {description && (
                        <p className="text-sm text-gray-500 dark:text-gray-300">{description}</p>
                    )}
                </div>
            </header>
            <main className="mx-auto max-w-7xl px-4 py-8">{children}</main>
        </div>
    );
}