import { Footer } from '@/components/footer';
import { Navigation } from '@/components/navigation';
import { MentoringBenefits } from '@/components/program-mentoring/mentoring-benefits';
import { MentoringFilters } from '@/components/program-mentoring/mentoring-filters';
import { MentoringGrid } from '@/components/program-mentoring/mentoring-grid';
import { MentoringHero } from '@/components/program-mentoring/mentoring-hero';
import { MentoringPagination } from '@/components/program-mentoring/mentoring-pagination';
import { MentoringProcess } from '@/components/program-mentoring/mentoring-process';
import { MentoringStats } from '@/components/program-mentoring/mentoring-stats';
import type { MentoringPageProps } from '@/types/mentoring';
import { Head } from '@inertiajs/react';

export default function ProgramMentoringPage({
    mentorings,
    stats,
    types,
    filters,
}: MentoringPageProps) {
    return (
        <div className="flex min-h-screen flex-col">
            <Head title="Program Mentoring - SI UMKM Cirebon" />
            <Navigation />
            <main className="flex-1">
                <MentoringHero />
                <MentoringStats stats={stats} />
                <MentoringBenefits />

                {/* Active Programs Section */}
                <section className="border-t bg-background py-16 md:py-24">
                    <div className="container mx-auto px-4">
                        <div className="mb-12 text-center">
                            <h2 className="mb-4 text-3xl font-bold md:text-4xl">
                                Program yang Sedang Berjalan
                            </h2>
                            <p className="text-pretty text-muted-foreground">
                                Lihat program mentoring yang tersedia dan sedang
                                berlangsung
                            </p>
                        </div>

                        <div className="grid gap-8 lg:grid-cols-[300px_1fr]">
                            <aside>
                                <MentoringFilters
                                    types={types}
                                    filters={filters}
                                />
                            </aside>

                            <div className="space-y-6">
                                <MentoringGrid mentorings={mentorings.data} />
                                <MentoringPagination paginator={mentorings} />
                            </div>
                        </div>
                    </div>
                </section>

                <MentoringProcess />
            </main>
            <Footer />
        </div>
    );
}
