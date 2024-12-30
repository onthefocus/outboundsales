<template>
  <div class="min-h-screen flex">
    <!-- Sidebar -->
    <aside class="w-64 bg-gray-800 text-white">
      <div class="p-4">
        <!-- Logo -->
        <div class="mb-8">
          <img src="/onthefocus-icon.svg" alt="Logo" class="w-12 h-12">
        </div>

        <!-- Main Navigation -->
        <nav class="space-y-2">
          <NuxtLink to="/dashboard" class="flex items-center p-2 rounded hover:bg-gray-700">
            <span>Dashboard</span>
          </NuxtLink>
          <NuxtLink to="/campaigns" class="flex items-center p-2 rounded hover:bg-gray-700">
            <span>Campaigns</span>
          </NuxtLink>
          <NuxtLink to="/contacts" class="flex items-center p-2 rounded hover:bg-gray-700">
            <span>Contacts</span>
          </NuxtLink>
          <NuxtLink to="/assistants" class="flex items-center p-2 rounded hover:bg-gray-700">
            <span>Assistants</span>
          </NuxtLink>
        </nav>

        <!-- Profile Section -->
        <div class="mt-8 border-t border-gray-700 pt-4">
          <div class="flex items-center space-x-2">
            <div class="w-8 h-8 bg-gray-600 rounded-full"></div>
            <div>
              <p class="text-sm">John Doe</p>
              <p class="text-xs text-gray-400">Admin</p>
            </div>
          </div>
        </div>

        <!-- Billing Section -->
        <div class="mt-4">
          <div class="text-sm text-gray-400">Available Minutes</div>
          <div class="text-lg">120</div>
          <button class="mt-2 w-full text-sm text-center text-blue-400 hover:text-blue-300">
            Top Up Minutes
          </button>
        </div>
      </div>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 bg-gray-100">
      <slot />
    </main>
  </div>
</template>

<script setup>
// Add any necessary script logic here
</script>

<style scoped>
/* Add any custom styles here */
</style>
