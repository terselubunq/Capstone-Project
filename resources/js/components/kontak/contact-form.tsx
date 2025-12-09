'use client';

import type React from 'react';

import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import { useState } from 'react';

export function ContactForm() {
    const [isSubmitting, setIsSubmitting] = useState(false);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsSubmitting(true);
        // Simulate form submission
        await new Promise((resolve) => setTimeout(resolve, 1000));
        setIsSubmitting(false);
        alert('Pesan Anda telah terkirim!');
    };

    return (
        <section className="border-t bg-muted/30 py-16 md:py-24">
            <div className="container mx-auto px-4">
                <div className="mx-auto max-w-2xl">
                    <Card>
                        <CardHeader>
                            <CardTitle>Kirim Pesan</CardTitle>
                            <CardDescription>
                                Isi formulir di bawah ini dan kami akan segera
                                menghubungi Anda
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <form onSubmit={handleSubmit} className="space-y-6">
                                <div className="grid gap-6 md:grid-cols-2">
                                    <div className="space-y-2">
                                        <Label htmlFor="name">
                                            Nama Lengkap
                                        </Label>
                                        <Input
                                            id="name"
                                            placeholder="Masukkan nama Anda"
                                            required
                                        />
                                    </div>
                                    <div className="space-y-2">
                                        <Label htmlFor="email">Email</Label>
                                        <Input
                                            id="email"
                                            type="email"
                                            placeholder="nama@email.com"
                                            required
                                        />
                                    </div>
                                </div>

                                <div className="space-y-2">
                                    <Label htmlFor="phone">Nomor Telepon</Label>
                                    <Input
                                        id="phone"
                                        type="tel"
                                        placeholder="08xx-xxxx-xxxx"
                                    />
                                </div>

                                <div className="space-y-2">
                                    <Label htmlFor="subject">Subjek</Label>
                                    <Input
                                        id="subject"
                                        placeholder="Perihal pesan Anda"
                                        required
                                    />
                                </div>

                                <div className="space-y-2">
                                    <Label htmlFor="message">Pesan</Label>
                                    <Textarea
                                        id="message"
                                        placeholder="Tulis pesan Anda di sini..."
                                        rows={6}
                                        required
                                    />
                                </div>

                                <Button
                                    type="submit"
                                    size="lg"
                                    className="w-full"
                                    disabled={isSubmitting}
                                >
                                    {isSubmitting
                                        ? 'Mengirim...'
                                        : 'Kirim Pesan'}
                                </Button>
                            </form>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </section>
    );
}
