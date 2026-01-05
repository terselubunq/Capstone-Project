export interface Category {
    id: number;
    name: string;
    slug: string;
    description?: string | null;
    umkms_count?: number;
}

export interface Owner {
    id: number;
    name: string;
    email: string;
    phone: string | null;
    nik?: string | null;
}

export interface Product {
    id: number;
    name: string;
    slug: string;
    description: string | null;
    price: number;
    unit: string;
    stock: number | null;
    is_available: boolean;
    photos: string[] | null;
    first_image: string | null;
}

export interface Umkm {
    id: number;
    business_name: string;
    slug: string;
    description: string | null;
    business_type: string;
    established_year: string | null;
    category: Category | null;
    owner: Owner | null;
    address: string;
    village: string;
    district: string;
    city: string;
    province: string;
    postal_code: string | null;
    latitude: number | null;
    longitude: number | null;
    employee_count: number;
    monthly_revenue: number | null;
    capital: number | null;
    nib: string | null;
    has_pirt: boolean;
    has_halal_certificate: boolean;
    website: string | null;
    whatsapp: string | null;
    instagram: string | null;
    facebook: string | null;
    tiktok: string | null;
    logo: string | null;
    photos: string[] | null;
    first_image: string | null;
    status: string;
    is_published: boolean;
    products: Product[];
    products_count?: number;
}

export interface FeaturedUmkm {
    slug: string;
    name: string;
    category: string;
    description: string | null;
    logo: string | null;
    first_image: string | null;
    district: string;
    businessType: string;
    hasHalal: boolean;
    hasPirt: boolean;
}

export interface UmkmFilters {
    search?: string;
    categories?: string[];
    districts?: string[];
    business_types?: string[];
}

export interface PaginationLink {
    url: string | null;
    label: string;
    active: boolean;
}

export interface PaginatedUmkms {
    data: Umkm[];
    current_page: number;
    first_page_url: string;
    from: number;
    last_page: number;
    last_page_url: string;
    links: PaginationLink[];
    next_page_url: string | null;
    path: string;
    per_page: number;
    prev_page_url: string | null;
    to: number;
    total: number;
}