import { Button } from '@/components/ui/button';
import { Moon, Sun } from 'lucide-react';
import { useEffect, useState } from 'react';

export function ThemeToggle() {
    const [theme, setTheme] = useState(() => {
        if (typeof window !== 'undefined') {
            return localStorage.getItem('appearance') || 'system';
        }
        return 'system';
    });

    useEffect(() => {
        const root = document.documentElement;

        const applyTheme = (t: string) => {
            if (t === 'dark') {
                root.classList.add('dark');
                root.style.colorScheme = 'dark';
            } else if (t === 'light') {
                root.classList.remove('dark');
                root.style.colorScheme = 'light';
            } else {
                // System
                const prefersDark = window.matchMedia(
                    '(prefers-color-scheme: dark)',
                ).matches;
                if (prefersDark) {
                    root.classList.add('dark');
                    root.style.colorScheme = 'dark';
                } else {
                    root.classList.remove('dark');
                    root.style.colorScheme = 'light';
                }
            }
        };

        applyTheme(theme);
        localStorage.setItem('appearance', theme);

        // Also set cookie for SSR consistency
        const maxAge = 365 * 24 * 60 * 60;
        document.cookie = `appearance=${theme};path=/;max-age=${maxAge};SameSite=Lax`;
    }, [theme]);

    const toggleTheme = () => {
        setTheme((prev) => (prev === 'light' ? 'dark' : 'light'));
    };

    return (
        <Button
            variant="ghost"
            size="icon"
            onClick={toggleTheme}
            title="Toggle theme"
        >
            {theme === 'dark' ? (
                <Sun className="h-[1.2rem] w-[1.2rem]" />
            ) : (
                <Moon className="h-[1.2rem] w-[1.2rem]" />
            )}
        </Button>
    );
}
