<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Edit Campaign</h1>
    
    <div class="bg-white p-6 rounded-lg shadow">
      <form @submit.prevent="updateCampaign">
        <div class="space-y-6">
          <!-- Campaign Name -->
          <div>
            <label class="block text-sm font-medium text-gray-700">Campaign Name</label>
            <input
              v-model="form.name"
              type="text"
              required
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            >
          </div>

          <!-- Campaign Description -->
          <div>
            <label class="block text-sm font-medium text-gray-700">Description</label>
            <textarea
              v-model="form.description"
              rows="3"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            ></textarea>
          </div>

          <!-- Campaign Status -->
          <div>
            <label class="block text-sm font-medium text-gray-700">Status</label>
            <select
              v-model="form.status"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            >
              <option value="draft">Draft</option>
              <option value="active">Active</option>
            </select>
          </div>

          <!-- Form Actions -->
          <div class="flex justify-end space-x-4">
            <NuxtLink 
              to="/campaigns"
              class="bg-gray-100 text-gray-700 py-2 px-4 rounded hover:bg-gray-200 transition-colors"
            >
              Cancel
            </NuxtLink>
            <button
              type="submit"
              class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
            >
              Update Campaign
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
const route = useRoute()
const campaignId = route.params.id

// TODO: Fetch campaign data from API
const form = ref({
  name: 'Sample Campaign',
  description: 'This is a sample campaign',
  status: 'draft'
})

const updateCampaign = () => {
  // TODO: Implement campaign update logic
  navigateTo('/campaigns')
}
</script>

<style scoped>
/* Add any custom styles here */
</style>
