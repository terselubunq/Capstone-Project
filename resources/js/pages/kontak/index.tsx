import { Footer } from '@/components/footer';
import { ContactForm } from '@/components/kontak/contact-form';
import { ContactHero } from '@/components/kontak/contact-hero';
import { ContactInfo } from '@/components/kontak/contact-info';
import { Navigation } from '@/components/navigation';

export default function KontakPage() {
    return (
        <div className="flex min-h-screen flex-col">
            <Navigation />
            <main className="flex-1">
                <ContactHero />
                <ContactInfo />
                <ContactForm />
            </main>
            <Footer />
        </div>
    );
}
