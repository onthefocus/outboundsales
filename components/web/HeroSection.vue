<template>
  <section class="hero-section">
    <div class="container">
      <div class="hero-content text-center">
        <h1 class="hero-title">Revolutionize Your Outreach Strategy</h1>
        <p class="hero-subtitle">
          Transform your business with our cutting-edge AI-powered calling solutions
        </p>
        <div class="hero-cta">
          <button class="btn-primary">Start Free Trial</button>
          <button class="btn-secondary">Explore Features</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
// Hero section component for the landing page
</script>

<style scoped>
.hero-section {
  @apply py-32 bg-gradient-to-r from-blue-600 to-indigo-700 text-white;
}

.container {
  @apply max-w-7xl mx-auto px-4;
}

.hero-content {
  @apply max-w-3xl mx-auto;
}

.hero-title {
  @apply text-6xl font-bold mb-8 leading-tight;
}

.hero-subtitle {
  @apply text-2xl mb-12 text-gray-100;
}

.hero-cta {
  @apply flex gap-6 justify-center;
}

.btn-primary {
  @apply px-8 py-4 bg-white text-blue-700 font-semibold rounded-lg hover:bg-gray-50 transition-all text-lg;
}

.btn-secondary {
  @apply px-8 py-4 border-2 border-white text-white font-semibold rounded-lg hover:bg-white hover:text-blue-700 transition-all text-lg;
}
</style>
