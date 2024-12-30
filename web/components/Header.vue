<template>
  <header class="bg-white shadow-sm">
    <div class="container mx-auto px-4">
      <div class="flex justify-between items-center h-16">
        <!-- Logo -->
        <div class="flex-shrink-0">
          <img src="/onthefocus-icon.svg" alt="OnTheFocus Logo" class="h-8">
        </div>

        <!-- Desktop Navigation -->
        <nav class="hidden md:flex space-x-8">
          <NuxtLink to="/" class="text-gray-700 hover:text-primary-500 font-medium">
            Home
          </NuxtLink>
          <NuxtLink to="/services" class="text-gray-700 hover:text-primary-500 font-medium">
            Services
          </NuxtLink>
          <NuxtLink to="/use-cases" class="text-gray-700 hover:text-primary-500 font-medium">
            Use Cases
          </NuxtLink>
          <NuxtLink to="/about" class="text-gray-700 hover:text-primary-500 font-medium">
            About
          </NuxtLink>
          <NuxtLink to="/contact" class="text-gray-700 hover:text-primary-500 font-medium">
            Contact
          </NuxtLink>
        </nav>

        <!-- Mobile Menu Button -->
        <div class="md:hidden">
          <button @click="isOpen = !isOpen" class="p-2 focus:outline-none">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
          </button>
        </div>
      </div>

      <!-- Mobile Navigation -->
      <div v-if="isOpen" class="md:hidden">
        <div class="pt-2 pb-3 space-y-1">
          <NuxtLink to="/" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-white hover:bg-primary-500">
            Home
          </NuxtLink>
          <NuxtLink to="/services" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-white hover:bg-primary-500">
            Services
          </NuxtLink>
          <NuxtLink to="/use-cases" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-white hover:bg-primary-500">
            Use Cases
          </NuxtLink>
          <NuxtLink to="/about" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-white hover:bg-primary-500">
            About
          </NuxtLink>
          <NuxtLink to="/contact" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-white hover:bg-primary-500">
            Contact
          </NuxtLink>
        </div>
      </div>
    </div>
  </header>
</template>

<script setup>
const isOpen = ref(false)
</script>

<style scoped>
.router-link-active {
  @apply text-primary-500;
}
</style>
