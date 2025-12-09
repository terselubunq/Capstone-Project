import { Button } from '@/components/ui/button';
import { Moon, Sun } from 'lucide-react';
import { useEffect, useState } from 'react';

export function ThemeToggle() {
    const [theme, setTheme] = useState(() => {
        if (typeof window !== 'undefined') {
            return localStorage.getItem('theme') || 'system';
        }
        return 'system';
    });

    useEffect(() => {
        const root = document.documentElement;

        const applyTheme = (t: string) => {
            if (t === 'dark') {
                root.classList.add('dark');
            } else if (t === 'light') {
                root.classList.remove('dark');
            } else {
                // System
                const prefersDark = window.matchMedia(
                    '(prefers-color-scheme: dark)',
                ).matches;
                if (prefersDark) root.classList.add('dark');
                else root.classList.remove('dark');
            }
        };

        applyTheme(theme);
        localStorage.setItem('theme', theme);
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
