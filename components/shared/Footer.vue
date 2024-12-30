<template>
  <footer class="footer">
    <div class="container">
      <div class="footer-content">
        <div class="footer-section">
          <h3 class="section-title">OnTheFocus</h3>
          <p class="section-text">
            AI-powered outbound calling platform for businesses
          </p>
        </div>
        <div class="footer-section">
          <h3 class="section-title">Quick Links</h3>
          <ul class="footer-links">
            <li><a href="/">Home</a></li>
            <li><a href="/services">Services</a></li>
            <li><a href="/use-cases">Use Cases</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/contact">Contact</a></li>
          </ul>
        </div>
        <div class="footer-section">
          <h3 class="section-title">Legal</h3>
          <ul class="footer-links">
            <li><a href="/privacy">Privacy Policy</a></li>
            <li><a href="/terms">Terms of Service</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <p class="copyright">
          © 2024 OnTheFocus. All rights reserved.
        </p>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
// Shared footer component for the public website
</script>

<style scoped>
.footer {
  @apply bg-gray-800 text-white;
}

.container {
  @apply max-w-7xl mx-auto px-4 py-8;
}

.footer-content {
  @apply grid grid-cols-1 md:grid-cols-3 gap-8 mb-8;
}

.footer-section {
  @apply mb-6;
}

.section-title {
  @apply text-lg font-bold mb-4;
}

.section-text {
  @apply text-gray-400;
}

.footer-links {
  @apply space-y-2;
}

.footer-links a {
  @apply text-gray-400 hover:text-white transition-colors;
}

.footer-bottom {
  @apply border-t border-gray-700 pt-6;
}

.copyright {
  @apply text-sm text-gray-400 text-center;
}
</style>
