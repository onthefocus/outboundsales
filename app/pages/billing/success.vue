<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Payment Successful</h1>
    
    <div class="bg-white p-6 rounded-lg shadow">
      <div class="text-center">
        <svg class="w-16 h-16 text-green-500 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
        </svg>
        <h2 class="text-xl font-semibold mb-2">Thank you for your purchase!</h2>
        <p class="text-gray-600 mb-4">Your minutes have been added to your account.</p>
        <NuxtLink 
          to="/dashboard" 
          class="inline-block bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
        >
          Return to Dashboard
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup>
// Add any necessary script logic here
</script>

<style scoped>
/* Add any custom styles here */
</style>
