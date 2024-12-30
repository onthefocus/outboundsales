<script setup>
// Import the dashboard layout
import DashboardLayout from '~/layouts/dashboard.vue'

// Define the layout to use based on route
const route = useRoute()
const layout = computed(() => {
  return route.path.startsWith('/dashboard') ? DashboardLayout : 'default'
})
</script>

<template>
  <NuxtLayout :name="layout">
    <NuxtPage />
  </NuxtLayout>
</template>

<style>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
