import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm } from '@inertiajs/react';

type Umkm = {
    id: number;
    business_name: string;
};

type Mentor = {
    id: number;
    name: string;
};

interface CreateProps {
    umkms: Umkm[];
    mentors: Mentor[];
}

export default function Create({ umkms, mentors }: CreateProps) {
    const { data, setData, post, processing, errors } = useForm({
        umkm_id: '',
        mentor_id: '',
        program_name: '',
        description: '',
        type: 'financial',
        start_date: '',
        end_date: '',
        status: 'scheduled',
    });

    const submit = (e: React.FormEvent) => {
        e.preventDefault();
        post(route('mentoring.store'));
    };

    return (
        <AuthenticatedLayout>
            <Head title="Tambah Mentoring" />

            <div className="py-12">
                <div className="mx-auto max-w-3xl px-4 sm:px-6 lg:px-8">
                    <div className="bg-white p-6 shadow sm:rounded-lg">
                        <h2 className="mb-6 text-2xl font-bold">Tambah Program Mentoring</h2>

                        <form onSubmit={submit} className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium">UMKM</label>
                                <select
                                    value={data.umkm_id}
                                    onChange={(e) => setData('umkm_id', e.target.value)}
                                    className="mt-1 block w-full rounded border-gray-300"
                                >
                                    <option value="">Pilih UMKM</option>
                                    {umkms.map((u) => (
                                        <option key={u.id} value={u.id}>
                                            {u.business_name}
                                        </option>
                                    ))}
                                </select>
                                {errors.umkm_id && <p className="mt-1 text-sm text-red-600">{errors.umkm_id}</p>}
                            </div>

                            <div>
                                <label className="block text-sm font-medium">Mentor</label>
                                <select
                                    value={data.mentor_id}
                                    onChange={(e) => setData('mentor_id', e.target.value)}
                                    className="mt-1 block w-full rounded border-gray-300"
                                >
                                    <option value="">Pilih Mentor</option>
                                    {mentors.map((m) => (
                                        <option key={m.id} value={m.id}>
                                            {m.name}
                                        </option>
                                    ))}
                                </select>
                                {errors.mentor_id && <p className="mt-1 text-sm text-red-600">{errors.mentor_id}</p>}
                            </div>

                            <div>
                                <label className="block text-sm font-medium">Nama Program</label>
                                <input
                                    type="text"
                                    value={data.program_name}
                                    onChange={(e) => setData('program_name', e.target.value)}
                                    className="mt-1 block w-full rounded border-gray-300"
                                />
                                {errors.program_name && <p className="mt-1 text-sm text-red-600">{errors.program_name}</p>}
                            </div>

                            <div>
                                <label className="block text-sm font-medium">Deskripsi</label>
                                <textarea
                                    value={data.description}
                                    onChange={(e) => setData('description', e.target.value)}
                                    rows={3}
                                    className="mt-1 block w-full rounded border-gray-300"
                                />
                            </div>

                            <div>
                                <label className="block text-sm font-medium">Tipe</label>
                                <select
                                    value={data.type}
                                    onChange={(e) => setData('type', e.target.value)}
                                    className="mt-1 block w-full rounded border-gray-300"
                                >
                                    <option value="financial">Keuangan</option>
                                    <option value="marketing">Pemasaran</option>
                                    <option value="production">Produksi</option>
                                </select>
                            </div>

                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label className="block text-sm font-medium">Tanggal Mulai</label>
                                    <input
                                        type="date"
                                        value={data.start_date}
                                        onChange={(e) => setData('start_date', e.target.value)}
                                        className="mt-1 block w-full rounded border-gray-300"
                                    />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium">Tanggal Selesai</label>
                                    <input
                                        type="date"
                                        value={data.end_date}
                                        onChange={(e) => setData('end_date', e.target.value)}
                                        className="mt-1 block w-full rounded border-gray-300"
                                    />
                                </div>
                            </div>

                            <div>
                                <label className="block text-sm font-medium">Status</label>
                                <select
                                    value={data.status}
                                    onChange={(e) => setData('status', e.target.value)}
                                    className="mt-1 block w-full rounded border-gray-300"
                                >
                                    <option value="scheduled">Scheduled</option>
                                    <option value="ongoing">Ongoing</option>
                                    <option value="completed">Completed</option>
                                </select>
                            </div>

                            <button
                                type="submit"
                                disabled={processing}
                                className="rounded bg-blue-600 px-4 py-2 text-white disabled:opacity-50"
                            >
                                Simpan
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}