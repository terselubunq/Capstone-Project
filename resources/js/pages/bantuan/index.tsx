import { FAQSection } from '@/components/bantuan/faq-section';
import { HelpCategories } from '@/components/bantuan/help-categories';
import { HelpHero } from '@/components/bantuan/help-hero';
import { Footer } from '@/components/footer';
import { Navigation } from '@/components/navigation';

export default function BantuanPage() {
    return (
        <div className="flex min-h-screen flex-col">
            <Navigation />
            <main className="flex-1">
                <HelpHero />
                <HelpCategories />
                <FAQSection />
            </main>
            <Footer />
        </div>
    );
}
