import { Footer } from '@/components/footer';
import { Navigation } from '@/components/navigation';
import { AboutDinas } from '@/components/tentang/about-dinas';
import { AboutHero } from '@/components/tentang/about-hero';
import { MissionVision } from '@/components/tentang/mission-vision';

export default function TentangPage() {
    return (
        <div className="flex min-h-screen flex-col">
            <Navigation />
            <main className="flex-1">
                <AboutHero />
                <MissionVision />
                <AboutDinas />
            </main>
            <Footer />
        </div>
    );
}
