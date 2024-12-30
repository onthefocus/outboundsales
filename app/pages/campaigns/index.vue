<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Campaigns</h1>
    
    <!-- Campaign List -->
    <div class="bg-white rounded-lg shadow">
      <div class="p-4 border-b flex justify-between items-center">
        <h2 class="text-lg font-semibold">Your Campaigns</h2>
        <NuxtLink 
          to="/campaigns/new"
          class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
        >
          Create New Campaign
        </NuxtLink>
      </div>
      
      <div class="divide-y">
        <div 
          v-for="campaign in campaigns" 
          :key="campaign.id"
          class="p-4 hover:bg-gray-50 transition-colors"
        >
          <div class="flex justify-between items-center">
            <div>
              <h3 class="font-medium">{{ campaign.name }}</h3>
              <p class="text-sm text-gray-600">{{ campaign.description }}</p>
            </div>
            <div class="flex space-x-2">
              <NuxtLink 
                :to="`/campaigns/${campaign.id}`"
                class="text-blue-500 hover:text-blue-600"
              >
                Edit
              </NuxtLink>
              <button 
                @click="deleteCampaign(campaign.id)"
                class="text-red-500 hover:text-red-600"
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
const campaigns = ref([
  {
    id: 1,
    name: 'Summer Promotion',
    description: 'Promoting summer products',
    status: 'active'
  },
  {
    id: 2,
    name: 'Holiday Campaign',
    description: 'Special offers for holidays',
    status: 'draft'
  }
])

const deleteCampaign = (id) => {
  campaigns.value = campaigns.value.filter(c => c.id !== id)
}
</script>

<style scoped>
/* Add any custom styles here */
</style>
