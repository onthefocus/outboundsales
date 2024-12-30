<template>
  <div class="dashboard">
    <DashboardHeader />
    <main class="dashboard-content">
      <div class="dashboard-sidebar">
        <nav class="sidebar-nav">
          <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Campaigns</a></li>
            <li><a href="#">Contacts</a></li>
            <li><a href="#">Assistants</a></li>
            <li><a href="#">Billing</a></li>
          </ul>
        </nav>
        <div class="minutes-balance">
          <p class="balance-label">Available Minutes</p>
          <p class="balance-value">120</p>
          <button class="btn-primary">Top Up</button>
        </div>
      </div>
      <div class="dashboard-main">
        <CampaignList />
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import DashboardHeader from '~/components/app/dashboard/DashboardHeader.vue'
import CampaignList from '~/components/app/campaigns/CampaignList.vue'

definePageMeta({
  layout: 'app'
})
</script>

<style scoped>
.dashboard {
  @apply min-h-screen bg-gray-100;
}

.dashboard-content {
  @apply flex;
}

.dashboard-sidebar {
  @apply w-64 bg-white shadow-sm p-4;
}

.sidebar-nav ul {
  @apply space-y-2;
}

.sidebar-nav a {
  @apply block px-4 py-2 text-gray-600 hover:bg-gray-100 rounded-lg;
}

.minutes-balance {
  @apply mt-8 p-4 bg-gray-50 rounded-lg;
}

.balance-label {
  @apply text-sm text-gray-500;
}

.balance-value {
  @apply text-2xl font-bold my-2;
}

.btn-primary {
  @apply w-full px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors;
}

.dashboard-main {
  @apply flex-1 p-6;
}
</style>
