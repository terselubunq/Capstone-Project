import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import type { UmkmFilters } from '@/types/umkm';
import { router } from '@inertiajs/react';
import { Search, X } from 'lucide-react';
import { FormEvent, useState } from 'react';

interface CatalogHeaderProps {
    total: number;
    filters: UmkmFilters;
}

export function CatalogHeader({ total, filters }: CatalogHeaderProps) {
    const [searchQuery, setSearchQuery] = useState(filters.search || '');

    const handleSearch = (e: FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        router.get(
            '/katalog',
            { search: searchQuery },
            {
                preserveState: true,
                preserveScroll: false,
            },
        );
    };

    const clearSearch = () => {
        setSearchQuery('');
        router.get(
            '/katalog',
            {},
            {
                preserveState: true,
                preserveScroll: false,
            },
        );
    };

    return (
        <section className="border-b bg-muted/30 py-12">
            <div className="container mx-auto px-4">
                <h1 className="mb-4 text-3xl font-bold md:text-4xl">
                    Katalog UMKM
                </h1>
                <p className="mb-6 text-lg text-muted-foreground">
                    Jelajahi{' '}
                    <span className="font-semibold text-foreground">
                        {total.toLocaleString('id-ID')} UMKM
                    </span>{' '}
                    yang telah terverifikasi di Kota Cirebon
                </p>

                <form className="flex gap-2" onSubmit={handleSearch}>
                    <div className="relative max-w-2xl flex-1">
                        <Search className="absolute top-1/2 left-3 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                        <Input
                            type="search"
                            name="search"
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            placeholder="Cari nama UMKM, produk, atau pemilik..."
                            className="h-11 pr-10 pl-10"
                        />
                        {searchQuery && (
                            <button
                                type="button"
                                onClick={clearSearch}
                                className="absolute top-1/2 right-3 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                            >
                                <X className="h-4 w-4" />
                            </button>
                        )}
                    </div>
                    <Button type="submit">Cari</Button>
                </form>
            </div>
        </section>
    );
}
