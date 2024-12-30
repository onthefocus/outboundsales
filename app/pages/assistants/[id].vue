<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Edit Assistant</h1>
    
    <div class="bg-white p-6 rounded-lg shadow">
      <form @submit.prevent="updateAssistant">
        <div class="space-y-6">
          <!-- Assistant Name -->
          <div>
            <label class="block text-sm font-medium text-gray-700">Name</label>
            <input
              v-model="form.name"
              type="text"
              required
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            >
          </div>

          <!-- Assistant Description -->
          <div>
            <label class="block text-sm font-medium text-gray-700">Description</label>
            <textarea
              v-model="form.description"
              rows="3"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            ></textarea>
          </div>

          <!-- Associated Campaign -->
          <div>
            <label class="block text-sm font-medium text-gray-700">Campaign</label>
            <select
              v-model="form.campaignId"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            >
              <option value="">Select Campaign</option>
              <option value="1">Summer Promotion</option>
              <option value="2">Holiday Campaign</option>
            </select>
          </div>

          <!-- Form Actions -->
          <div class="flex justify-end space-x-4">
            <NuxtLink 
              to="/assistants"
              class="bg-gray-100 text-gray-700 py-2 px-4 rounded hover:bg-gray-200 transition-colors"
            >
              Cancel
            </NuxtLink>
            <button
              type="submit"
              class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
            >
              Update Assistant
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
const route = useRoute()
const assistantId = route.params.id

// TODO: Fetch assistant data from API
const form = ref({
  name: 'Sales Assistant',
  description: 'Handles sales calls',
  campaignId: '1'
})

const updateAssistant = () => {
  // TODO: Implement assistant update logic
  navigateTo('/assistants')
}
</script>

<style scoped>
/* Add any custom styles here */
</style>
