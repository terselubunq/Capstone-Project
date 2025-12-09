export interface Mentor {
    id: number;
    name: string;
    email: string;
}

export interface MentoringSession {
    id: number;
    mentoring_id: number;
    title: string;
    agenda: string;
    scheduled_at: string;
    duration_minutes: number;
    location: string | null;
    meeting_link: string | null;
    materials: string | null;
    notes: string | null;
    attachments: string[] | null;
    status: 'scheduled' | 'ongoing' | 'completed' | 'cancelled' | 'rescheduled';
    started_at: string | null;
    completed_at: string | null;
    evaluation: string | null;
    created_at: string;
    updated_at: string;
}

export interface Mentoring {
    id: number;
    umkm_id: number;
    mentor_id: number;
    program_name: string;
    description: string;
    objectives: string;
    type:
        | 'financial'
        | 'marketing'
        | 'production'
        | 'management'
        | 'technology'
        | 'legal'
        | 'other';
    start_date: string;
    end_date: string;
    status: 'scheduled' | 'ongoing' | 'completed' | 'cancelled';
    notes: string | null;
    created_at: string;
    updated_at: string;
    deleted_at: string | null;
    umkm?: {
        id: number;
        business_name: string;
        slug: string;
        logo: string | null;
        category?: {
            id: number;
            name: string;
            slug: string;
        };
    };
    mentor?: Mentor;
    sessions?: MentoringSession[];
    sessions_count?: number;
}

export interface PaginatedMentorings {
    data: Mentoring[];
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

export interface MentoringStats {
    total_programs: number;
    active_programs: number;
    completed_programs: number;
    total_umkms_participated: number;
}

export interface MentoringType {
    value: string;
    label: string;
}

export interface MentoringFilters {
    search?: string;
    status?: string;
    type?: string;
}

export interface MentoringPageProps {
    mentorings: PaginatedMentorings;
    stats: MentoringStats;
    types: MentoringType[];
    filters: MentoringFilters;
}
