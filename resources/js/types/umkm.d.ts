export interface Category {
    id: number;
    name: string;
    slug: string;
    description: string | null;
    parent_id: number | null;
    parent?: Category;
    children?: Category[];
    umkms_count?: number;
}

export interface Product {
    id: number;
    umkm_id: number;
    name: string;
    slug: string;
    description: string | null;
    price: number;
    unit: string;
    stock: number;
    image: string | null;
    is_available: boolean;
    is_featured: boolean;
    created_at: string;
    updated_at: string;
}

export interface Umkm {
    id: number;
    business_name: string;
    slug: string;
    owner_name: string;
    nik: string | null;
    email: string | null;
    phone: string;
    address: string;
    village: string;
    district: string;
    city: string;
    province: string;
    postal_code: string | null;
    category_id: number;
    category?: Category;
    business_type: 'mikro' | 'kecil' | 'menengah';
    description: string | null;
    established_year: number | null;
    employee_count: number;
    monthly_revenue: number | null;
    capital: number | null;
    nib: string | null;
    has_halal_certificate: boolean;
    has_pirt: boolean;
    website: string | null;
    facebook: string | null;
    instagram: string | null;
    tiktok: string | null;
    whatsapp: string | null;
    latitude: number | null;
    longitude: number | null;
    logo: string | null;
    photos: string[] | null;
    status: 'draft' | 'pending' | 'active' | 'inactive' | 'rejected';
    is_published: boolean;
    created_at: string;
    updated_at: string;
    products?: Product[];
    products_count?: number;
}

export interface PaginatedUmkms {
    data: Umkm[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
    from: number;
    to: number;
    links: {
        url: string | null;
        label: string;
        active: boolean;
    }[];
}

export interface UmkmFilters {
    search?: string;
    categories?: string[];
    districts?: string[];
    business_types?: string[];
}

export interface HomeStats {
    total_umkms: number;
    total_products: number;
    certified_umkms: number;
    active_mentorings: number;
}

export interface FeaturedUmkm {
    slug: string;
    name: string;
    category: string;
    district: string;
    description: string | null;
    logo: string | null;
    hasHalal: boolean;
    hasPirt: boolean;
    businessType: 'mikro' | 'kecil' | 'menengah';
}

export interface TopCategory {
    slug: string;
    name: string;
    count: number;
}
