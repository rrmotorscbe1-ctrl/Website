import { Navbar } from '@/components/Navbar';
import { HeroSection } from '@/components/HeroSection';
import { BikeShowcase } from '@/components/BikeShowcase';
import { AboutSection } from '@/components/AboutSection';
import { NewBikesSection } from '@/components/NewBikesSection';
import { SecondHandSection } from '@/components/SecondHandSection';
import { InsuranceSection } from '@/components/InsuranceSection';
import { ServiceSection } from '@/components/ServiceSection';
import { Footer } from '@/components/Footer';

const Index = () => {
  return (
    <main className="min-h-screen">
      <Navbar />
      <HeroSection />
      <BikeShowcase />
      <NewBikesSection />
      <SecondHandSection />
      <ServiceSection />
      <InsuranceSection />
      <AboutSection />
      <Footer />
    </main>
  );
};

export default Index;
