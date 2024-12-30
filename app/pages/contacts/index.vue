<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Contacts</h1>
    
    <!-- Contact List -->
    <div class="bg-white rounded-lg shadow">
      <div class="p-4 border-b flex justify-between items-center">
        <h2 class="text-lg font-semibold">Your Contacts</h2>
        <NuxtLink 
          to="/contacts/new"
          class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
        >
          Add New Contact
        </NuxtLink>
      </div>
      
      <div class="divide-y">
        <div 
          v-for="contact in contacts" 
          :key="contact.id"
          class="p-4 hover:bg-gray-50 transition-colors"
        >
          <div class="flex justify-between items-center">
            <div>
              <h3 class="font-medium">{{ contact.name }}</h3>
              <p class="text-sm text-gray-600">{{ contact.phone }}</p>
            </div>
            <div class="flex space-x-2">
              <NuxtLink 
                :to="`/contacts/${contact.id}`"
                class="text-blue-500 hover:text-blue-600"
              >
                Edit
              </NuxtLink>
              <button 
                @click="deleteContact(contact.id)"
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
const contacts = ref([
  {
    id: 1,
    name: 'John Doe',
    phone: '+1 234 567 890',
    campaignId: 1
  },
  {
    id: 2,
    name: 'Jane Smith',
    phone: '+1 987 654 321',
    campaignId: 2
  }
])

const deleteContact = (id) => {
  contacts.value = contacts.value.filter(c => c.id !== id)
}
</script>

<style scoped>
/* Add any custom styles here */
</style>
