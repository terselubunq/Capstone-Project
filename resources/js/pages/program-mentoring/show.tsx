import AuthenticatedLayout from '@/layouts/authenticated-layout';
import type { PageProps } from '@/types';
import { Head, Link } from '@inertiajs/react';

interface ProgramMentoring {
    id: number;
    title: string;
    description: string;
    mentor_name: string;
    duration: string;
    start_date: string;
    end_date: string;
    max_participants: number;
    current_participants: number;
    status: string;
    created_at: string;
}

interface ShowProps extends PageProps {
    program: ProgramMentoring;
}

export default function Show({ program }: ShowProps) {
    return (
        <AuthenticatedLayout>
            <Head title={program.title} />

            <div className="py-12">
                <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
                    <div className="overflow-hidden bg-white shadow-sm dark:bg-gray-800 sm:rounded-lg">
                        <div className="p-6">
                            <div className="mb-6 flex items-center justify-between">
                                <h1 className="text-3xl font-bold text-gray-900 dark:text-gray-100">
                                    {program.title}
                                </h1>
                                <Link
                                    href="/program-mentoring"
                                    className="rounded-md bg-gray-600 px-4 py-2 text-sm font-medium text-white hover:bg-gray-700"
                                >
                                    Back to List
                                </Link>
                            </div>

                            <div className="space-y-6">
                                <div>
                                    <h2 className="text-lg font-semibold text-gray-900 dark:text-gray-100">
                                        Description
                                    </h2>
                                    <p className="mt-2 text-gray-700 dark:text-gray-300">
                                        {program.description}
                                    </p>
                                </div>

                                <div className="grid gap-6 md:grid-cols-2">
                                    <div>
                                        <h3 className="font-semibold text-gray-900 dark:text-gray-100">
                                            Mentor
                                        </h3>
                                        <p className="text-gray-700 dark:text-gray-300">
                                            {program.mentor_name}
                                        </p>
                                    </div>

                                    <div>
                                        <h3 className="font-semibold text-gray-900 dark:text-gray-100">
                                            Duration
                                        </h3>
                                        <p className="text-gray-700 dark:text-gray-300">
                                            {program.duration}
                                        </p>
                                    </div>

                                    <div>
                                        <h3 className="font-semibold text-gray-900 dark:text-gray-100">
                                            Start Date
                                        </h3>
                                        <p className="text-gray-700 dark:text-gray-300">
                                            {new Date(program.start_date).toLocaleDateString()}
                                        </p>
                                    </div>

                                    <div>
                                        <h3 className="font-semibold text-gray-900 dark:text-gray-100">
                                            End Date
                                        </h3>
                                        <p className="text-gray-700 dark:text-gray-300">
                                            {new Date(program.end_date).toLocaleDateString()}
                                        </p>
                                    </div>

                                    <div>
                                        <h3 className="font-semibold text-gray-900 dark:text-gray-100">
                                            Participants
                                        </h3>
                                        <p className="text-gray-700 dark:text-gray-300">
                                            {program.current_participants} / {program.max_participants}
                                        </p>
                                    </div>

                                    <div>
                                        <h3 className="font-semibold text-gray-900 dark:text-gray-100">
                                            Status
                                        </h3>
                                        <span
                                            className={`inline-block rounded-full px-3 py-1 text-sm font-semibold ${
                                                program.status === 'active'
                                                    ? 'bg-green-200 text-green-800 dark:bg-green-600 dark:text-green-100'
                                                    : 'bg-red-200 text-red-800 dark:bg-red-600 dark:text-red-100'
                                            }`}
                                        >
                                            {program.status}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}