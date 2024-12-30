<template>
  <div class="campaign-list">
    <div class="list-header">
      <h2 class="title">Campaigns</h2>
      <button class="btn-primary" @click="createCampaign">
        + New Campaign
      </button>
    </div>
    <div class="campaigns-grid">
      <div class="campaign-card" v-for="campaign in campaigns" :key="campaign.id">
        <div class="campaign-info">
          <h3 class="campaign-name">{{ campaign.name }}</h3>
          <p class="campaign-status" :class="statusClass(campaign.status)">
            {{ campaign.status }}
          </p>
        </div>
        <div class="campaign-metrics">
          <div class="metric">
            <span class="metric-value">{{ campaign.metrics.calls_made }}</span>
            <span class="metric-label">Calls Made</span>
          </div>
          <div class="metric">
            <span class="metric-value">{{ campaign.metrics.calls_answered }}</span>
            <span class="metric-label">Calls Answered</span>
          </div>
          <div class="metric">
            <span class="metric-value">{{ campaign.metrics.conversion_rate }}%</span>
            <span class="metric-label">Conversion Rate</span>
          </div>
        </div>
        <div class="campaign-actions">
          <button class="btn-secondary">View Details</button>
          <button class="btn-danger">Delete</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import type { Campaign } from '~/types/models'

const campaigns = ref<Campaign[]>([
  {
    id: '1',
    name: 'Summer Sales',
    description: 'Campaign for summer sales promotion',
    status: 'active',
    account_id: 'acc-123',
    created_at: '2024-01-01',
    updated_at: '2024-01-15',
    settings: {
      call_times: '9am-5pm',
      retry_attempts: 3
    },
    metrics: {
      calls_made: 120,
      calls_answered: 80,
      conversion_rate: 15
    }
  },
  {
    id: '2',
    name: 'Product Launch',
    description: 'Campaign for new product launch',
    status: 'draft',
    account_id: 'acc-123',
    created_at: '2024-01-10',
    updated_at: '2024-01-10',
    settings: {
      call_times: '10am-6pm',
      retry_attempts: 2
    },
    metrics: {
      calls_made: 0,
      calls_answered: 0,
      conversion_rate: 0
    }
  }
])

const createCampaign = () => {
  // Handle campaign creation
}

const statusClass = (status: string) => {
  return {
    'status-active': status === 'active',
    'status-draft': status === 'draft',
    'status-completed': status === 'completed'
  }
}
</script>

<style scoped>
.campaign-list {
  @apply p-6;
}

.list-header {
  @apply flex items-center justify-between mb-6;
}

.title {
  @apply text-2xl font-bold;
}

.campaigns-grid {
  @apply grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6;
}

.campaign-card {
  @apply p-6 bg-white rounded-lg shadow-sm;
}

.campaign-info {
  @apply mb-4;
}

.campaign-name {
  @apply text-xl font-semibold mb-2;
}

.campaign-status {
  @apply text-sm px-2 py-1 rounded-full inline-block;
}

.status-active {
  @apply bg-green-100 text-green-600;
}

.status-draft {
  @apply bg-yellow-100 text-yellow-600;
}

.status-completed {
  @apply bg-gray-100 text-gray-600;
}

.campaign-metrics {
  @apply grid grid-cols-3 gap-4 mb-6;
}

.metric {
  @apply text-center;
}

.metric-value {
  @apply text-lg font-bold;
}

.metric-label {
  @apply text-sm text-gray-500;
}

.campaign-actions {
  @apply flex gap-2;
}

.btn-primary {
  @apply px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors;
}

.btn-secondary {
  @apply px-4 py-2 border border-blue-500 text-blue-500 rounded-lg hover:bg-blue-50 transition-colors;
}

.btn-danger {
  @apply px-4 py-2 border border-red-500 text-red-500 rounded-lg hover:bg-red-50 transition-colors;
}
</style>
