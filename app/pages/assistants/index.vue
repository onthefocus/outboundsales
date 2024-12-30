<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Assistants</h1>
    
    <!-- Assistant List -->
    <div class="bg-white rounded-lg shadow">
      <div class="p-4 border-b flex justify-between items-center">
        <h2 class="text-lg font-semibold">Your Assistants</h2>
        <NuxtLink 
          to="/assistants/new"
          class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors"
        >
          Create New Assistant
        </NuxtLink>
      </div>
      
      <div class="divide-y">
        <div 
          v-for="assistant in assistants" 
          :key="assistant.id"
          class="p-4 hover:bg-gray-50 transition-colors"
        >
          <div class="flex justify-between items-center">
            <div>
              <h3 class="font-medium">{{ assistant.name }}</h3>
              <p class="text-sm text-gray-600">{{ assistant.description }}</p>
            </div>
            <div class="flex space-x-2">
              <NuxtLink 
                :to="`/assistants/${assistant.id}`"
                class="text-blue-500 hover:text-blue-600"
              >
                Edit
              </NuxtLink>
              <button 
                @click="deleteAssistant(assistant.id)"
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
const assistants = ref([
  {
    id: 1,
    name: 'Sales Assistant',
    description: 'Handles sales calls',
    campaignId: 1
  },
  {
    id: 2,
    name: 'Support Assistant',
    description: 'Handles customer support',
    campaignId: 2
  }
])

const deleteAssistant = (id) => {
  assistants.value = assistants.value.filter(a => a.id !== id)
}
</script>

<style scoped>
/* Add any custom styles here */
</style>
