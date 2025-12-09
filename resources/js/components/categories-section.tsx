import { Card, CardContent } from '@/components/ui/card';
import type { TopCategory } from '@/types/umkm';
import { Link } from '@inertiajs/react';
import type { LucideIcon } from 'lucide-react';
import {
    Hammer,
    MoreHorizontal,
    Palette,
    Shirt,
    Sparkles,
    UtensilsCrossed,
} from 'lucide-react';

interface CategoriesSectionProps {
    categories: TopCategory[];
}

// Map category names/slugs to icons
const getCategoryIcon = (slug: string): LucideIcon => {
    const iconMap: Record<string, LucideIcon> = {
        kuliner: UtensilsCrossed,
        'makanan-ringan': UtensilsCrossed,
        'makanan-berat': UtensilsCrossed,
        minuman: UtensilsCrossed,
        kerajinan: Palette,
        'kerajinan-rotan': Hammer,
        'kerajinan-kayu': Hammer,
        batik: Palette,
        fashion: Shirt,
        pakaian: Shirt,
        aksesoris: Sparkles,
        furniture: Hammer,
        kecantikan: Sparkles,
    };

    // Try exact match, fallback to checking if slug contains key
    if (iconMap[slug]) return iconMap[slug];

    for (const [key, icon] of Object.entries(iconMap)) {
        if (slug.includes(key)) return icon;
    }

    return MoreHorizontal;
};

// Map category to colors
const getCategoryColor = (index: number): string => {
    const colors = [
        'bg-orange-500/10 text-orange-600',
        'bg-purple-500/10 text-purple-600',
        'bg-pink-500/10 text-pink-600',
        'bg-blue-500/10 text-blue-600',
        'bg-teal-500/10 text-teal-600',
        'bg-gray-500/10 text-gray-600',
    ];

    return colors[index % colors.length];
};

export function CategoriesSection({ categories }: CategoriesSectionProps) {
    const categoriesDisplay = categories.map((cat, index) => ({
        ...cat,
        icon: getCategoryIcon(cat.slug),
        color: getCategoryColor(index),
    }));

    return (
        <section className="border-y bg-muted/30 py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mb-12 text-center">
                    <h2 className="mb-4 text-3xl font-bold text-balance md:text-4xl">
                        Jelajahi Berdasarkan Kategori
                    </h2>
                    <p className="text-lg text-balance text-muted-foreground">
                        Temukan UMKM sesuai dengan kebutuhan Anda
                    </p>
                </div>

                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                    {categoriesDisplay.map((category) => (
                        <Link
                            key={category.slug}
                            href={`/katalog?categories[]=${category.slug}`}
                        >
                            <Card className="group transition-all hover:shadow-md">
                                <CardContent className="flex items-center gap-4 p-6">
                                    <div
                                        className={`flex h-14 w-14 shrink-0 items-center justify-center rounded-xl ${category.color} transition-transform group-hover:scale-110`}
                                    >
                                        <category.icon className="h-7 w-7" />
                                    </div>
                                    <div className="flex-1">
                                        <h3 className="mb-1 font-semibold group-hover:text-primary">
                                            {category.name}
                                        </h3>
                                        <p className="text-sm text-muted-foreground">
                                            {category.count} UMKM
                                        </p>
                                    </div>
                                </CardContent>
                            </Card>
                        </Link>
                    ))}
                </div>
            </div>
        </section>
    );
}
