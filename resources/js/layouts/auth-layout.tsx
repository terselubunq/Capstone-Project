import { PropsWithChildren } from 'react';

interface AuthLayoutProps extends PropsWithChildren {
    title: string;
    description: string;
}


export default function AuthLayout({ title, description, children }: AuthLayoutProps) {
    return (
        <div className="flex min-h-screen items-center justify-center bg-gradient-to-br from-gray-100 via-gray-300 to-gray-100 p-4 dark:from-black dark:via-gray-900 dark:to-black">
            <div className="w-full max-w-md">
                <div className="mb-8 text-center">
                    <div className="mb-6 flex justify-center">
                        <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-gradient-to-br from-gray-200 via-gray-300 to-gray-200 shadow-lg">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                strokeWidth="2"
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                className="h-8 w-8 text-white"
                            >
                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
                                <polyline points="9 22 9 12 15 12 15 22" />
                            </svg>
                        </div>
                    </div>
                    <h1 className="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                        {title}
                    </h1>
                    <p className="mt-2 text-sm text-muted-foreground">
                        {description}
                    </p>
                </div>

                <div className="rounded-2xl border bg-card p-8 shadow-xl dark:border-gray-800">
                    {children}
                </div>

                <p className="mt-6 text-center text-xs text-muted-foreground">
                    © {new Date().getFullYear()} SI UMKM Cirebon. All rights reserved.
                </p>
            </div>
        </div>
    );
}

