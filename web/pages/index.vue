<template>
  <div>
    <WebHeader />
    <main>
      <HeroSection />
      <PlatformBenefits />
      <CallToAction />
      <Testimonials />
      <CostComparison />
      <ValueProposition />
    </main>
    <WebFooter />
  </div>
</template>

<script setup>
import WebHeader from '~/web/components/Header.vue'
import WebFooter from '~/web/components/Footer.vue'
import HeroSection from '~/web/components/sections/HeroSection.vue'
import PlatformBenefits from '~/web/components/sections/PlatformBenefits.vue'
import CallToAction from '~/web/components/sections/CallToAction.vue'
import Testimonials from '~/web/components/sections/Testimonials.vue'
import CostComparison from '~/web/components/sections/CostComparison.vue'
import ValueProposition from '~/web/components/sections/ValueProposition.vue'
</script>
