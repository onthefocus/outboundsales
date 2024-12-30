<template>
  <header class="header">
    <div class="container">
      <div class="logo">OnTheFocus</div>
      <nav class="main-nav">
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/services">Services</a></li>
          <li><a href="/use-cases">Use Cases</a></li>
          <li><a href="/about">About</a></li>
          <li><a href="/contact">Contact</a></li>
        </ul>
      </nav>
      <div class="auth-buttons">
        <NuxtLink to="/login" class="btn-secondary">Login</NuxtLink>
        <NuxtLink to="/register" class="btn-primary">Sign Up</NuxtLink>
      </div>
    </div>
  </header>
</template>

<script setup lang="ts">
// Shared header component for the public website
</script>

<style scoped>
.header {
  @apply bg-white shadow-sm;
}

.container {
  @apply max-w-7xl mx-auto px-4 py-4 flex items-center justify-between;
}

.logo {
  @apply text-xl font-bold text-blue-600;
}

.main-nav ul {
  @apply flex space-x-6;
}

.main-nav a {
  @apply text-gray-600 hover:text-blue-600 transition-colors;
}

.auth-buttons {
  @apply flex space-x-4;
}

.btn-primary {
  @apply px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors;
}

.btn-secondary {
  @apply px-4 py-2 border border-blue-500 text-blue-500 rounded-lg hover:bg-blue-50 transition-colors;
}
</style>
