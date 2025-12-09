import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Checkbox } from '@/components/ui/checkbox';
import { Label } from '@/components/ui/label';
import { Separator } from '@/components/ui/separator';
import type { Category, UmkmFilters } from '@/types/umkm';
import { router } from '@inertiajs/react';
import { X } from 'lucide-react';

interface CatalogFiltersProps {
    categories: Category[];
    districts: string[];
    filters: UmkmFilters;
}

export function CatalogFilters({
    categories,
    districts,
    filters,
}: CatalogFiltersProps) {
    const toggleFilter = (
        key: 'categories' | 'districts' | 'business_types',
        value: string,
    ) => {
        const currentValues = filters[key] || [];
        const newValues = currentValues.includes(value)
            ? currentValues.filter((v) => v !== value)
            : [...currentValues, value];

        const newFilters = { ...filters };
        if (newValues.length > 0) {
            newFilters[key] = newValues;
        } else {
            delete newFilters[key];
        }

        router.get('/katalog', newFilters, {
            preserveState: true,
            preserveScroll: true,
        });
    };

    const resetFilters = () => {
        router.get(
            '/katalog',
            {},
            {
                preserveState: false,
                preserveScroll: true,
            },
        );
    };

    const hasActiveFilters =
        (filters.categories && filters.categories.length > 0) ||
        (filters.districts && filters.districts.length > 0) ||
        (filters.business_types && filters.business_types.length > 0);

    return (
        <Card>
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
                {/* Category Filter */}
                <div>
                    <Label className="mb-3 block text-sm font-semibold">
                        Kategori
                    </Label>
                    <div className="space-y-2">
                        {categories.map((category) => (
                            <div
                                key={category.id}
                                className="flex items-center space-x-2"
                            >
                                <Checkbox
                                    id={`category-${category.slug}`}
                                    checked={
                                        filters.categories?.includes(
                                            category.slug,
                                        ) || false
                                    }
                                    onCheckedChange={() =>
                                        toggleFilter(
                                            'categories',
                                            category.slug,
                                        )
                                    }
                                />
                                <Label
                                    htmlFor={`category-${category.slug}`}
                                    className="cursor-pointer text-sm leading-none font-normal peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                >
                                    {category.name}
                                    {category.umkms_count !== undefined &&
                                        ` (${category.umkms_count})`}
                                </Label>
                            </div>
                        ))}
                    </div>
                </div>

                <Separator />

                {/* District Filter */}
                <div>
                    <Label className="mb-3 block text-sm font-semibold">
                        Kecamatan
                    </Label>
                    <div className="space-y-2">
                        {districts.map((district) => (
                            <div
                                key={district}
                                className="flex items-center space-x-2"
                            >
                                <Checkbox
                                    id={`district-${district}`}
                                    checked={
                                        filters.districts?.includes(district) ||
                                        false
                                    }
                                    onCheckedChange={() =>
                                        toggleFilter('districts', district)
                                    }
                                />
                                <Label
                                    htmlFor={`district-${district}`}
                                    className="cursor-pointer text-sm leading-none font-normal peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                >
                                    {district}
                                </Label>
                            </div>
                        ))}
                    </div>
                </div>

                <Separator />

                {/* Business Type Filter */}
                <div>
                    <Label className="mb-3 block text-sm font-semibold">
                        Jenis Usaha
                    </Label>
                    <div className="space-y-2">
                        {[
                            { value: 'mikro', label: 'Mikro' },
                            { value: 'kecil', label: 'Kecil' },
                            { value: 'menengah', label: 'Menengah' },
                        ].map((type) => (
                            <div
                                key={type.value}
                                className="flex items-center space-x-2"
                            >
                                <Checkbox
                                    id={`business-type-${type.value}`}
                                    checked={
                                        filters.business_types?.includes(
                                            type.value,
                                        ) || false
                                    }
                                    onCheckedChange={() =>
                                        toggleFilter(
                                            'business_types',
                                            type.value,
                                        )
                                    }
                                />
                                <Label
                                    htmlFor={`business-type-${type.value}`}
                                    className="cursor-pointer text-sm leading-none font-normal peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                >
                                    {type.label}
                                </Label>
                            </div>
                        ))}
                    </div>
                </div>
            </CardContent>
        </Card>
    );
}
