<script setup>
</script>

<template>
  <nav class="bg-white shadow-lg sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-6">
      <div class="flex justify-between items-center h-20">
        <div class="flex items-center">
          <NuxtLink to="/" class="flex items-center">
            <img src="/onthefocus-icon.svg" alt="OnTheFocus Icon" class="w-8 h-8 mr-2" />
            <span class="text-2xl font-bold text-secondary">OnTheFocus</span>
          </NuxtLink>
        </div>
        <div class="hidden md:flex items-center space-x-8">
          <NuxtLink to="/about-us" class="text-[#083A5E] hover:text-primary transition-colors font-medium">About</NuxtLink>
          <NuxtLink to="/services" class="text-[#083A5E] hover:text-primary transition-colors font-medium">Services</NuxtLink>
          <NuxtLink to="/contact" class="text-[#083A5E] hover:text-primary transition-colors font-medium">Contact</NuxtLink>
        </div>
        <div class="hidden md:block">
          <NuxtLink to="/login" class="text-[#3F3EED] hover:text-[#3F3EED]/90 transition-colors font-medium mr-6">
            Sign In
          </NuxtLink>
          <NuxtLink to="/register" class="bg-primary text-white px-6 py-2 rounded-md hover:bg-primary/90 transition-colors">
            Get Started
          </NuxtLink>
        </div>
      </div>
    </div>
  </nav>
</template>
