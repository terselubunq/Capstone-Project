import InputError from '@/components/input-error';
import TextLink from '@/components/text-link';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AuthLayout from '@/layouts/auth-layout';
import { Head, useForm } from '@inertiajs/react';
import { LoaderCircle } from 'lucide-react';

export default function Register() {
    const form = useForm({
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
    });

    function submit(e: React.FormEvent) {
        e.preventDefault();
        form.post(route('register.store'), {
            preserveScroll: true,
            onSuccess: () => form.reset('password', 'password_confirmation'),
        });
    }

    return (
        <AuthLayout
            title="Create an account"
            description="Enter your details below to create your account"
        >
            <Head title="Register" />

            <form onSubmit={submit} className="flex flex-col gap-6">
                <div className="grid gap-6">
                    <div className="grid gap-2">
                        <Label htmlFor="name">Name</Label>
                        <Input
                            id="name"
                            type="text"
                            required
                            autoFocus
                            tabIndex={1}
                            autoComplete="name"
                            name="name"
                            placeholder="Full name"
                            value={form.data.name}
                            onChange={(e) =>
                                form.setData('name', e.currentTarget.value)
                            }
                        />
                        <InputError
                            message={form.errors.name}
                            className="mt-2"
                        />
                    </div>

                    <div className="grid gap-2">
                        <Label htmlFor="email">Email address</Label>
                        <Input
                            id="email"
                            type="email"
                            required
                            tabIndex={2}
                            autoComplete="email"
                            name="email"
                            placeholder="email@example.com"
                            value={form.data.email}
                            onChange={(e) =>
                                form.setData('email', e.currentTarget.value)
                            }
                        />
                        <InputError message={form.errors.email} />
                    </div>

                    <div className="grid gap-2">
                        <Label htmlFor="password">Password</Label>
                        <Input
                            id="password"
                            type="password"
                            required
                            tabIndex={3}
                            autoComplete="new-password"
                            name="password"
                            placeholder="Password"
                            value={form.data.password}
                            onChange={(e) =>
                                form.setData('password', e.currentTarget.value)
                            }
                        />
                        <InputError message={form.errors.password} />
                    </div>

                    <div className="grid gap-2">
                        <Label htmlFor="password_confirmation">
                            Confirm password
                        </Label>
                        <Input
                            id="password_confirmation"
                            type="password"
                            required
                            tabIndex={4}
                            autoComplete="new-password"
                            name="password_confirmation"
                            placeholder="Confirm password"
                            value={form.data.password_confirmation}
                            onChange={(e) =>
                                form.setData(
                                    'password_confirmation',
                                    e.currentTarget.value,
                                )
                            }
                        />
                        <InputError
                            message={form.errors.password_confirmation}
                        />
                    </div>

                    <Button
                        type="submit"
                        className="mt-2 w-full"
                        tabIndex={5}
                        data-test="register-user-button"
                        disabled={form.processing}
                    >
                        {form.processing && (
                            <LoaderCircle className="mr-2 inline-block h-4 w-4 animate-spin" />
                        )}
                        Create account
                    </Button>
                </div>

                <div className="text-muted-foreground text-center text-sm">
                    Already have an account?{' '}
                    <TextLink href={route('login')} tabIndex={6}>
                        Log in
                    </TextLink>
                </div>
            </form>
        </AuthLayout>
    );
}
