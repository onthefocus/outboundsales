<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Dashboard</h1>
    
    <!-- Campaign Overview -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
      <div class="bg-white p-6 rounded-lg shadow">
        <h3 class="text-gray-500 text-sm font-medium">Active Campaigns</h3>
        <p class="text-3xl font-bold mt-2">3</p>
      </div>
      <div class="bg-white p-6 rounded-lg shadow">
        <h3 class="text-gray-500 text-sm font-medium">Contacts Reached</h3>
        <p class="text-3xl font-bold mt-2">1,234</p>
      </div>
      <div class="bg-white p-6 rounded-lg shadow">
        <h3 class="text-gray-500 text-sm font-medium">Minutes Used</h3>
        <p class="text-3xl font-bold mt-2">120</p>
      </div>
    </div>

    <!-- Recent Activity -->
    <div class="bg-white p-6 rounded-lg shadow">
      <h2 class="text-xl font-semibold mb-4">Recent Activity</h2>
      <div class="space-y-4">
        <div class="flex items-center justify-between">
          <div class="flex items-center space-x-4">
            <div class="w-10 h-10 bg-gray-100 rounded-full"></div>
            <div>
              <p class="font-medium">New campaign created</p>
              <p class="text-sm text-gray-500">2 hours ago</p>
            </div>
          </div>
          <button class="text-blue-500 hover:text-blue-600">View</button>
        </div>
        <!-- Add more activity items here -->
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
