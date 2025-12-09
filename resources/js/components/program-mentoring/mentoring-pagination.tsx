import { Button } from '@/components/ui/button';
import type { PaginatedMentorings } from '@/types/mentoring';
import { Link } from '@inertiajs/react';
import { ChevronLeft, ChevronRight } from 'lucide-react';

interface MentoringPaginationProps {
    paginator: PaginatedMentorings;
}

export function MentoringPagination({ paginator }: MentoringPaginationProps) {
    if (paginator.last_page <= 1) {
        return null;
    }

    return (
        <div className="flex flex-col items-center gap-4">
            {/* Info */}
            <p className="text-sm text-muted-foreground">
                Menampilkan {paginator.from} - {paginator.to} dari{' '}
                {paginator.total.toLocaleString('id-ID')} program
            </p>

            {/* Pagination Links */}
            <div className="flex flex-wrap items-center justify-center gap-2">
                {paginator.links.map((link, index) => {
                    const isFirst = index === 0;
                    const isLast = index === paginator.links.length - 1;
                    const isEllipsis = link.label === '...';

                    if (isEllipsis) {
                        return (
                            <span
                                key={`ellipsis-${index}`}
                                className="px-2 text-muted-foreground"
                            >
                                ...
                            </span>
                        );
                    }

                    if (isFirst || isLast) {
                        return (
                            <Link
                                key={index}
                                href={link.url || '#'}
                                preserveState
                                preserveScroll
                            >
                                <Button
                                    variant="outline"
                                    size="icon"
                                    disabled={!link.url}
                                >
                                    {isFirst ? (
                                        <ChevronLeft className="h-4 w-4" />
                                    ) : (
                                        <ChevronRight className="h-4 w-4" />
                                    )}
                                </Button>
                            </Link>
                        );
                    }

                    return (
                        <Link
                            key={index}
                            href={link.url || '#'}
                            preserveState
                            preserveScroll
                        >
                            <Button
                                variant={link.active ? 'default' : 'outline'}
                                size="icon"
                                className="h-10 w-10"
                            >
                                {link.label}
                            </Button>
                        </Link>
                    );
                })}
            </div>
        </div>
    );
}
