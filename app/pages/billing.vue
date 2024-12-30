<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Billing</h1>
    
    <!-- Minute Packages -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
      <div 
        v-for="pkg in packages" 
        :key="pkg.minutes"
        class="bg-white p-6 rounded-lg shadow hover:shadow-md transition-shadow"
      >
        <h3 class="text-xl font-semibold mb-2">{{ pkg.minutes }} Minutes</h3>
        <p class="text-gray-600 mb-4">{{ pkg.description }}</p>
        <p class="text-2xl font-bold mb-6">${{ pkg.price }}</p>
        <button
          @click="handlePurchase(pkg)"
          class="w-full bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
        >
          Purchase
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
const packages = [
  { minutes: 50, price: 30, description: 'For small campaigns' },
  { minutes: 100, price: 50, description: 'For medium campaigns' },
  { minutes: 200, price: 80, description: 'For large campaigns' },
  { minutes: 500, price: 200, description: 'For enterprise campaigns' }
]

const handlePurchase = async (pkg) => {
  try {
    const stripe = await useStripe()
    const response = await $fetch('/api/create-checkout-session', {
      method: 'POST',
      body: {
        minutes: pkg.minutes,
        price: pkg.price
      }
    })
    
    await stripe.redirectToCheckout({
      sessionId: response.sessionId
    })
  } catch (error) {
    console.error('Purchase error:', error)
  }
}
</script>

<style scoped>
/* Add any custom styles here */
</style>
