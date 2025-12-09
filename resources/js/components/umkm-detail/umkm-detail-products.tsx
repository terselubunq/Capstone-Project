import { Badge } from '@/components/ui/badge';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import type { Umkm } from '@/types/umkm';
import { resolveImageUrl } from '@/utils/image';
import { Package } from 'lucide-react';

interface UmkmDetailProductsProps {
    umkm: Umkm;
}

export function UmkmDetailProducts({ umkm }: UmkmDetailProductsProps) {
    const products = (umkm.products as any[]) || [];

    const formatPrice = (price: number) => {
        return new Intl.NumberFormat('id-ID', {
            style: 'currency',
            currency: 'IDR',
            minimumFractionDigits: 0,
        }).format(price);
    };

    if (products.length === 0) {
        return (
            <Card>
                <CardHeader>
                    <CardTitle>Produk (0)</CardTitle>
                </CardHeader>
                <CardContent>
                    <div className="flex flex-col items-center justify-center py-8 text-center">
                        <Package className="text-muted-foreground mb-4 h-12 w-12" />
                        <p className="text-muted-foreground text-sm">
                            Belum ada produk yang ditambahkan
                        </p>
                    </div>
                </CardContent>
            </Card>
        );
    }

    return (
        <Card>
            <CardHeader>
                <CardTitle>Produk ({products.length})</CardTitle>
            </CardHeader>

            <CardContent>
                <div className="grid gap-4 sm:grid-cols-2">
                    {products.map((product: any) => {
                        // Normalize candidate image sources:
                        // - product.image -> single string
                        // - product.first_image -> single string (server-provided)
                        // - product.images -> array OR JSON-encoded string OR null
                        let candidateRaw: any =
                            product.image ??
                            product.first_image ??
                            product.images ??
                            null;

                        // If it's an object with `first_image` (edge case), prefer that
                        if (!candidateRaw && product?.first_image) {
                            candidateRaw = product.first_image;
                        }

                        // If images is JSON string accidentally, remove escaped slashes
                        if (typeof candidateRaw === 'string') {
                            // try to detect a JSON-encoded array string like '[".."]'
                            const s = candidateRaw.trim();
                            if (
                                (s.startsWith('["') || s.startsWith("['")) &&
                                (s.endsWith('"]') || s.endsWith("']"))
                            ) {
                                try {
                                    candidateRaw = JSON.parse(
                                        s.replace(/\\\//g, '/'),
                                    );
                                } catch (e) {
                                    // leave as string if parse fails
                                }
                            }
                        }

                        // If candidateRaw is array -> pick first element
                        let candidate: string | null = null;
                        if (
                            Array.isArray(candidateRaw) &&
                            candidateRaw.length > 0
                        ) {
                            candidate = candidateRaw[0];
                        } else if (
                            typeof candidateRaw === 'string' &&
                            candidateRaw.trim() !== ''
                        ) {
                            candidate = candidateRaw;
                        } else {
                            candidate = null;
                        }

                        const imgSrc = resolveImageUrl(candidate);

                        return (
                            <div
                                key={product.id}
                                className="group overflow-hidden rounded-lg border transition-shadow hover:shadow-md"
                            >
                                <div className="bg-muted relative aspect-square overflow-hidden">
                                    <img
                                        src={imgSrc}
                                        alt={product.name}
                                        className="h-full w-full object-cover transition-transform group-hover:scale-105"
                                    />

                                    {!product.is_available && (
                                        <div className="absolute inset-0 flex items-center justify-center bg-black/50">
                                            <Badge variant="secondary">
                                                Stok Habis
                                            </Badge>
                                        </div>
                                    )}

                                    {product.is_featured &&
                                        product.is_available && (
                                            <div className="absolute right-2 top-2">
                                                <Badge>Unggulan</Badge>
                                            </div>
                                        )}
                                </div>

                                <div className="p-4">
                                    <h3 className="mb-2 font-semibold leading-tight">
                                        {product.name}
                                    </h3>

                                    <div className="flex items-baseline gap-2">
                                        <span className="text-primary text-lg font-bold">
                                            {formatPrice(product.price)}
                                        </span>
                                        <span className="text-muted-foreground text-sm">
                                            / {product.unit}
                                        </span>
                                    </div>

                                    {product.stock > 0 && (
                                        <p className="text-muted-foreground mt-1 text-xs">
                                            Stok: {product.stock} {product.unit}
                                        </p>
                                    )}
                                </div>
                            </div>
                        );
                    })}
                </div>
            </CardContent>
        </Card>
    );
}

export default UmkmDetailProducts;
