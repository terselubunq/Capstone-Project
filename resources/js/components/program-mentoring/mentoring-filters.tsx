import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import { Separator } from '@/components/ui/separator';
import type {
    MentoringFilters as Filters,
    MentoringType,
} from '@/types/mentoring';
import { router } from '@inertiajs/react';
import { Search, X } from 'lucide-react';
import { useState } from 'react';

interface MentoringFiltersProps {
    types: MentoringType[];
    filters: Filters;
}

export function MentoringFilters({ types, filters }: MentoringFiltersProps) {
    const [searchQuery, setSearchQuery] = useState(filters.search || '');

    const handleSearch = (e: React.FormEvent) => {
        e.preventDefault();
        router.get(
            '/program-mentoring',
            { ...filters, search: searchQuery },
            {
                preserveState: true,
                preserveScroll: true,
            },
        );
    };

    const clearSearch = () => {
        setSearchQuery('');
        const newFilters = { ...filters };
        delete newFilters.search;
        router.get('/program-mentoring', newFilters, {
            preserveState: true,
            preserveScroll: true,
        });
    };

    const updateFilter = (key: keyof Filters, value: string | undefined) => {
        const newFilters = { ...filters };

        if (value && value !== 'all') {
            newFilters[key] = value;
        } else {
            delete newFilters[key];
        }

        router.get('/program-mentoring', newFilters, {
            preserveState: true,
            preserveScroll: true,
        });
    };

    const resetFilters = () => {
        setSearchQuery('');
        router.get(
            '/program-mentoring',
            {},
            {
                preserveState: false,
                preserveScroll: true,
            },
        );
    };

    const hasActiveFilters = filters.search || filters.status || filters.type;

    return (
        <Card className="sticky top-4">
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-4">
                <CardTitle className="text-lg">Filter</CardTitle>
                {hasActiveFilters && (
                    <Button
                        variant="ghost"
                        size="sm"
                        className="h-8 gap-1 text-xs"
                        onClick={resetFilters}
                    >
                        <X className="h-3 w-3" />
                        Reset
                    </Button>
                )}
            </CardHeader>
            <CardContent className="space-y-6">
                {/* Search */}
                <form onSubmit={handleSearch}>
                    <Label className="mb-2 block text-sm font-semibold">
                        Cari Program
                    </Label>
                    <div className="relative">
                        <Search className="absolute top-1/2 left-3 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                        <Input
                            type="text"
                            placeholder="Nama program atau UMKM..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="pr-9 pl-9"
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
                </form>

                <Separator />

                {/* Status Filter */}
                <div>
                    <Label className="mb-3 block text-sm font-semibold">
                        Status Program
                    </Label>
                    <RadioGroup
                        value={filters.status || 'all'}
                        onValueChange={(value) =>
                            updateFilter(
                                'status',
                                value === 'all' ? undefined : value,
                            )
                        }
                    >
                        <div className="flex items-center space-x-2">
                            <RadioGroupItem value="all" id="status-all" />
                            <Label
                                htmlFor="status-all"
                                className="cursor-pointer text-sm font-normal"
                            >
                                Semua Status
                            </Label>
                        </div>
                        <div className="flex items-center space-x-2">
                            <RadioGroupItem value="active" id="status-active" />
                            <Label
                                htmlFor="status-active"
                                className="cursor-pointer text-sm font-normal"
                            >
                                Aktif
                            </Label>
                        </div>
                        <div className="flex items-center space-x-2">
                            <RadioGroupItem
                                value="completed"
                                id="status-completed"
                            />
                            <Label
                                htmlFor="status-completed"
                                className="cursor-pointer text-sm font-normal"
                            >
                                Selesai
                            </Label>
                        </div>
                        <div className="flex items-center space-x-2">
                            <RadioGroupItem
                                value="scheduled"
                                id="status-scheduled"
                            />
                            <Label
                                htmlFor="status-scheduled"
                                className="cursor-pointer text-sm font-normal"
                            >
                                Terjadwal
                            </Label>
                        </div>
                    </RadioGroup>
                </div>

                <Separator />

                {/* Type Filter */}
                <div>
                    <Label className="mb-3 block text-sm font-semibold">
                        Jenis Program
                    </Label>
                    <Select
                        value={filters.type || 'all'}
                        onValueChange={(value) =>
                            updateFilter(
                                'type',
                                value === 'all' ? undefined : value,
                            )
                        }
                    >
                        <SelectTrigger>
                            <SelectValue placeholder="Semua Jenis" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="all">Semua Jenis</SelectItem>
                            {types.map((type) => (
                                <SelectItem key={type.value} value={type.value}>
                                    {type.label}
                                </SelectItem>
                            ))}
                        </SelectContent>
                    </Select>
                </div>
            </CardContent>
        </Card>
    );
}
