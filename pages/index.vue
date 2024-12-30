<template>
  <div class="landing-page">
    <HeroSection />
    <div class="section-spacer"></div>
    <FeaturesSection />
    <div class="section-spacer"></div>
    <TestimonialsSection />
    <div class="section-spacer"></div>
    <PricingSection />
  </div>
</template>

<script setup lang="ts">
import HeroSection from '~/components/web/HeroSection.vue'
import FeaturesSection from '~/components/web/FeaturesSection.vue'
import TestimonialsSection from '~/components/web/TestimonialsSection.vue'
import PricingSection from '~/components/web/PricingSection.vue'

definePageMeta({
  layout: 'web'
})
</script>

<style scoped>
.landing-page {
  @apply flex flex-col;
}

.section-spacer {
  @apply h-16;
}
</style>
