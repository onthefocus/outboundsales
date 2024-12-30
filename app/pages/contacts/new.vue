<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Add New Contact</h1>
    
    <div class="bg-white p-6 rounded-lg shadow">
      <form @submit.prevent="createContact">
        <div class="space-y-6">
          <!-- Contact Name -->
          <div>
            <label class="block text-sm font-medium text-gray-700">Name</label>
            <input
              v-model="form.name"
              type="text"
              required
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            >
          </div>

          <!-- Contact Phone -->
          <div>
            <label class="block text-sm font-medium text-gray-700">Phone Number</label>
            <input
              v-model="form.phone"
              type="tel"
              required
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            >
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
              to="/contacts"
              class="bg-gray-100 text-gray-700 py-2 px-4 rounded hover:bg-gray-200 transition-colors"
            >
              Cancel
            </NuxtLink>
            <button
              type="submit"
              class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
            >
              Add Contact
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
const form = ref({
  name: '',
  phone: '',
  campaignId: ''
})

const createContact = () => {
  // TODO: Implement contact creation logic
  navigateTo('/contacts')
}
</script>

<style scoped>
/* Add any custom styles here */
</style>
