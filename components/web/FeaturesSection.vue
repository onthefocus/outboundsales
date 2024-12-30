<template>
  <section class="features-section">
    <div class="container">
      <div class="text-center mb-16">
        <h2 class="section-title">Powerful Features</h2>
        <p class="section-subtitle">
          Everything you need to supercharge your outreach campaigns
        </p>
      </div>
      <div class="features-grid">
        <div class="feature-card">
          <div class="feature-icon">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
            </svg>
          </div>
          <h3 class="feature-title">Automated Calling</h3>
          <p class="feature-description">
            Schedule and automate outbound calls with AI agents
          </p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
            </svg>
          </div>
          <h3 class="feature-title">Real-time Analytics</h3>
          <p class="feature-description">
            Track call performance and campaign metrics
          </p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
            </svg>
          </div>
          <h3 class="feature-title">AI Agents</h3>
          <p class="feature-description">
            Customizable AI agents for different use cases
          </p>
        </div>
        <div class="feature-card">
          <div class="feature-icon">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <h3 class="feature-title">Flexible Pricing</h3>
          <p class="feature-description">
            Pay-as-you-go pricing with no hidden fees
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
// Features section component for the landing page
</script>

<style scoped>
.features-section {
  @apply py-24 bg-white;
}

.container {
  @apply max-w-7xl mx-auto px-4;
}

.section-title {
  @apply text-4xl font-bold mb-4;
}

.section-subtitle {
  @apply text-xl text-gray-600;
}

.features-grid {
  @apply grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8;
}

.feature-card {
  @apply p-8 bg-white rounded-xl shadow-lg text-center hover:shadow-xl transition-shadow;
}

.feature-icon {
  @apply mb-6 text-blue-600;
}

.feature-title {
  @apply text-2xl font-semibold mb-4;
}

.feature-description {
  @apply text-gray-600;
}
</style>
