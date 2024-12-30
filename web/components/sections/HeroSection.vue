<template>
  <section class="bg-gradient-to-b from-primary-50 to-white py-20">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8 items-center">
        <!-- Text Content -->
        <div class="space-y-6">
          <h1 class="text-5xl font-bold text-gray-900 leading-tight">
            AI-Powered Cold Calling<br>
            <span class="text-primary-500">That Actually Works</span>
          </h1>
          <p class="text-xl text-gray-600">
            Our AI assistant makes cold calling efficient, effective, and scalable.
            Focus on closing deals while we handle the outreach.
          </p>
          
          <!-- Call to Action -->
          <div class="space-y-4">
            <NuxtLink 
              to="/register" 
              class="inline-block bg-primary-500 text-white px-8 py-4 rounded-lg font-semibold hover:bg-primary-600 transition-colors"
            >
              Get Started - Free 20 Minutes
            </NuxtLink>
            <p class="text-sm text-gray-500">
              No credit card required. Try our AI assistant risk-free.
            </p>
          </div>
        </div>

        <!-- Visual Element -->
        <div class="relative">
          <img src="/onthefocus-icon.svg" alt="AI Assistant" class="w-full max-w-md mx-auto">
          <div class="absolute -bottom-8 right-0 bg-white rounded-lg shadow-lg p-4">
            <div class="flex items-center space-x-2">
              <div class="w-3 h-3 bg-green-400 rounded-full animate-pulse"></div>
              <p class="text-sm text-gray-600">AI Assistant Ready</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
// Component logic can be added here if needed
</script>

<style scoped>
/* Custom styles can be added here */
</style>
