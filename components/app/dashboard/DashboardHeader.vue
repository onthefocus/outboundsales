<template>
  <header class="dashboard-header">
    <div class="logo">OnTheFocus</div>
    <nav class="main-nav">
      <ul>
        <li><a href="#">Dashboard</a></li>
        <li><a href="#">Campaigns</a></li>
        <li><a href="#">Contacts</a></li>
        <li><a href="#">Assistants</a></li>
      </ul>
    </nav>
    <div class="user-profile">
      <div class="user-avatar">👤</div>
      <div class="user-info">
        <p class="user-name">John Doe</p>
        <p class="user-email">john@example.com</p>
      </div>
    </div>
  </header>
</template>

<script setup lang="ts">
// Dashboard header component for the application
</script>

<style scoped>
.dashboard-header {
  @apply flex items-center justify-between p-4 bg-white shadow-sm;
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

.user-profile {
  @apply flex items-center;
}

.user-avatar {
  @apply text-2xl mr-2;
}

.user-name {
  @apply font-semibold;
}

.user-email {
  @apply text-sm text-gray-500;
}
</style>
