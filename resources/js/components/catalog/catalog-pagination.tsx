import { Button } from '@/components/ui/button';
import type { PaginatedUmkms } from '@/types/umkm';
import { Link } from '@inertiajs/react';
import { ChevronLeft, ChevronRight } from 'lucide-react';

interface CatalogPaginationProps {
    paginator: PaginatedUmkms;
}

export function CatalogPagination({ paginator }: CatalogPaginationProps) {
    if (paginator.last_page <= 1) {
        return null;
    }

    return (
        <div className="flex flex-col items-center gap-4">
            <p className="text-sm text-muted-foreground">
                Menampilkan{' '}
                <span className="font-semibold text-foreground">
                    {paginator.from}
                </span>{' '}
                -{' '}
                <span className="font-semibold text-foreground">
                    {paginator.to}
                </span>{' '}
                dari{' '}
                <span className="font-semibold text-foreground">
                    {paginator.total.toLocaleString('id-ID')}
                </span>{' '}
                UMKM
            </p>

            <div className="flex items-center gap-2">
                {paginator.links.map((link, index) => {
                    if (index === 0) {
                        // Previous button
                        return (
                            <Button
                                key="prev"
                                variant="outline"
                                size="sm"
                                disabled={!link.url}
                                asChild={!!link.url}
                            >
                                {link.url ? (
                                    <Link
                                        href={link.url}
                                        preserveState
                                        preserveScroll
                                    >
                                        <ChevronLeft className="h-4 w-4" />
                                        Sebelumnya
                                    </Link>
                                ) : (
                                    <>
                                        <ChevronLeft className="h-4 w-4" />
                                        Sebelumnya
                                    </>
                                )}
                            </Button>
                        );
                    }

                    if (index === paginator.links.length - 1) {
                        // Next button
                        return (
                            <Button
                                key="next"
                                variant="outline"
                                size="sm"
                                disabled={!link.url}
                                asChild={!!link.url}
                            >
                                {link.url ? (
                                    <Link
                                        href={link.url}
                                        preserveState
                                        preserveScroll
                                    >
                                        Selanjutnya
                                        <ChevronRight className="h-4 w-4" />
                                    </Link>
                                ) : (
                                    <>
                                        Selanjutnya
                                        <ChevronRight className="h-4 w-4" />
                                    </>
                                )}
                            </Button>
                        );
                    }

                    // Page number buttons
                    if (link.label === '...') {
                        return (
                            <Button
                                key={`ellipsis-${index}`}
                                variant="ghost"
                                size="sm"
                                className="w-9"
                                disabled
                            >
                                ...
                            </Button>
                        );
                    }

                    return (
                        <Button
                            key={index}
                            variant={link.active ? 'default' : 'outline'}
                            size="sm"
                            className={`w-9 ${!link.active ? 'bg-transparent' : ''}`}
                            disabled={link.active || !link.url}
                            asChild={!!link.url && !link.active}
                        >
                            {link.url && !link.active ? (
                                <Link
                                    href={link.url}
                                    preserveState
                                    preserveScroll
                                >
                                    {link.label}
                                </Link>
                            ) : (
                                <span>{link.label}</span>
                            )}
                        </Button>
                    );
                })}
            </div>
        </div>
    );
}
