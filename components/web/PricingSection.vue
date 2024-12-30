<template>
  <section class="pricing-section">
    <div class="container">
      <div class="text-center mb-16">
        <h2 class="section-title">Flexible Pricing Plans</h2>
        <p class="section-subtitle">
          Choose the perfect plan for your business needs
        </p>
      </div>
      <div class="pricing-grid">
        <div class="pricing-card">
          <h3 class="plan-name">Starter</h3>
          <p class="plan-price">$49<span class="plan-duration">/month</span></p>
          <ul class="plan-features">
            <li>1000 calls/month</li>
            <li>Basic Analytics</li>
            <li>Email Support</li>
          </ul>
          <button class="btn-primary">Get Started</button>
        </div>
        <div class="pricing-card popular">
          <div class="popular-badge">Most Popular</div>
          <h3 class="plan-name">Professional</h3>
          <p class="plan-price">$99<span class="plan-duration">/month</span></p>
          <ul class="plan-features">
            <li>5000 calls/month</li>
            <li>Advanced Analytics</li>
            <li>Priority Support</li>
            <li>Custom Scripts</li>
          </ul>
          <button class="btn-primary">Get Started</button>
        </div>
        <div class="pricing-card">
          <h3 class="plan-name">Enterprise</h3>
          <p class="plan-price">$199<span class="plan-duration">/month</span></p>
          <ul class="plan-features">
            <li>Unlimited calls</li>
            <li>Custom Analytics</li>
            <li>Dedicated Account Manager</li>
            <li>API Access</li>
          </ul>
          <button class="btn-primary">Contact Us</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
// Pricing section component for the landing page
</script>

<style scoped>
.pricing-section {
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

.pricing-grid {
  @apply grid grid-cols-1 md:grid-cols-3 gap-8;
}

.pricing-card {
  @apply p-8 bg-white rounded-xl shadow-lg hover:shadow-xl transition-shadow relative;
}

.popular {
  @apply bg-blue-50 border-2 border-blue-500;
}

.popular-badge {
  @apply absolute top-0 right-0 bg-blue-500 text-white px-4 py-2 rounded-bl-lg text-sm font-semibold;
}

.plan-name {
  @apply text-2xl font-bold mb-4;
}

.plan-price {
  @apply text-4xl font-bold mb-6;
}

.plan-duration {
  @apply text-lg font-normal text-gray-500;
}

.plan-features {
  @apply mb-8;
}

.plan-features li {
  @apply mb-2 text-gray-600;
}

.btn-primary {
  @apply w-full px-6 py-3 bg-blue-500 text-white font-semibold rounded-lg hover:bg-blue-600 transition-colors;
}
</style>
