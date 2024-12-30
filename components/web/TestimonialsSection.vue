<template>
  <section class="testimonials-section">
    <div class="container">
      <div class="text-center mb-16">
        <h2 class="section-title">Trusted by Thousands</h2>
        <p class="section-subtitle">
          See what our customers are saying about our platform
        </p>
      </div>
      <div class="testimonials-grid">
        <div class="testimonial-card">
          <div class="testimonial-content">
            <p class="testimonial-text">
              "This platform has revolutionized our outbound calling process. The AI agents are incredibly effective!"
            </p>
            <div class="testimonial-author">
              <div class="author-avatar">
                <img src="/avatar1.svg" alt="John Doe" class="avatar-image" />
              </div>
              <div class="author-info">
                <h4 class="author-name">John Doe</h4>
                <p class="author-company">Acme Corp</p>
              </div>
            </div>
          </div>
        </div>
        <div class="testimonial-card">
          <div class="testimonial-content">
            <p class="testimonial-text">
              "The analytics dashboard provides valuable insights that help us optimize our campaigns."
            </p>
            <div class="testimonial-author">
              <div class="author-avatar">
                <img src="/avatar2.svg" alt="Jane Smith" class="avatar-image" />
              </div>
              <div class="author-info">
                <h4 class="author-name">Jane Smith</h4>
                <p class="author-company">Tech Solutions</p>
              </div>
            </div>
          </div>
        </div>
        <div class="testimonial-card">
          <div class="testimonial-content">
            <p class="testimonial-text">
              "The pricing is transparent and the platform is easy to use. Highly recommend!"
            </p>
            <div class="testimonial-author">
              <div class="author-avatar">
                <img src="/avatar3.svg" alt="Mike Johnson" class="avatar-image" />
              </div>
              <div class="author-info">
                <h4 class="author-name">Mike Johnson</h4>
                <p class="author-company">Global Enterprises</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
// Testimonials section component for the landing page
</script>

<style scoped>
.testimonials-section {
  @apply py-24 bg-gray-50;
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

.testimonials-grid {
  @apply grid grid-cols-1 md:grid-cols-3 gap-8;
}

.testimonial-card {
  @apply p-8 bg-white rounded-xl shadow-lg hover:shadow-xl transition-shadow;
}

.testimonial-content {
  @apply flex flex-col h-full;
}

.testimonial-text {
  @apply text-gray-600 mb-6;
}

.testimonial-author {
  @apply mt-auto flex items-center;
}

.author-avatar {
  @apply w-12 h-12 rounded-full overflow-hidden mr-4;
}

.avatar-image {
  @apply w-full h-full object-cover;
}

.author-info {
  @apply flex flex-col;
}

.author-name {
  @apply font-semibold text-gray-900;
}

.author-company {
  @apply text-sm text-gray-500;
}
</style>
