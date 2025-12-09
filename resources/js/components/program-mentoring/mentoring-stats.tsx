import { Card, CardContent } from '@/components/ui/card';
import type { MentoringStats as Stats } from '@/types/mentoring';
import { Award, BookOpen, CheckCircle, Users } from 'lucide-react';

interface MentoringStatsProps {
    stats: Stats;
}

export function MentoringStats({ stats }: MentoringStatsProps) {
    const statItems = [
        {
            label: 'Total Program',
            value: stats.total_programs,
            icon: BookOpen,
            color: 'text-blue-600',
            bgColor: 'bg-blue-100',
        },
        {
            label: 'Program Aktif',
            value: stats.active_programs,
            icon: Award,
            color: 'text-green-600',
            bgColor: 'bg-green-100',
        },
        {
            label: 'Program Selesai',
            value: stats.completed_programs,
            icon: CheckCircle,
            color: 'text-purple-600',
            bgColor: 'bg-purple-100',
        },
        {
            label: 'UMKM Terlibat',
            value: stats.total_umkms_participated,
            icon: Users,
            color: 'text-orange-600',
            bgColor: 'bg-orange-100',
        },
    ];

    return (
        <section className="border-t bg-muted/30 py-12">
            <div className="container mx-auto px-4">
                <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
                    {statItems.map((item, index) => {
                        const Icon = item.icon;
                        return (
                            <Card key={index}>
                                <CardContent className="flex items-center gap-4 p-6">
                                    <div
                                        className={`rounded-full ${item.bgColor} p-3`}
                                    >
                                        <Icon
                                            className={`h-6 w-6 ${item.color}`}
                                        />
                                    </div>
                                    <div>
                                        <p className="text-sm text-muted-foreground">
                                            {item.label}
                                        </p>
                                        <p className="text-2xl font-bold">
                                            {item.value.toLocaleString('id-ID')}
                                        </p>
                                    </div>
                                </CardContent>
                            </Card>
                        );
                    })}
                </div>
            </div>
        </section>
    );
}
