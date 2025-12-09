import * as React from 'react';

interface AppContentProps extends React.ComponentProps<'main'> {
    variant?: 'header' | 'sidebar';
}

export function AppContent({
    variant = 'header',
    children,
    className = '',
    ...props
}: AppContentProps) {
    // FIX FULLSCREEN: jangan pernah gunakan SidebarInset lagi
    if (variant === 'sidebar') {
        return (
            <main
                className={`bg-background flex min-h-screen w-full flex-1 flex-col overflow-y-auto p-6 ${className}`}
                {...props}
            >
                {children}
            </main>
        );
    }

    return (
        <main
            className="mx-auto flex h-full w-full max-w-7xl flex-1 flex-col gap-4 rounded-xl"
            {...props}
        >
            {children}
        </main>
    );
}
