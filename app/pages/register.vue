<template>
  <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-purple-50 py-12 px-4 sm:px-6 lg:px-8 relative overflow-hidden">
    <div class="absolute inset-0 bg-[url('/onthefocus-icon.svg')] bg-repeat opacity-5"></div>
    <div class="max-w-[450px] w-full bg-white/95 backdrop-blur-sm shadow-xl rounded-xl p-8 sm:p-10 relative z-10">
      <div class="text-center space-y-2">
        <h2 class="text-3xl sm:text-4xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
          Create your account
        </h2>
        <p class="text-gray-600 text-sm sm:text-base">
          Join our community and unlock new opportunities
        </p>
      </div>
      <form class="mt-8 space-y-6" @submit.prevent="handleSubmit">
        <div class="mt-8 space-y-5">
          <div class="relative">
            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-500">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
              </svg>
            </div>
            <input id="name" name="name" type="text" required
              v-model="form.name"
              :class="['w-full pl-10 pr-4 py-3 border-2 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 placeholder-gray-400 transition-all', 
                errors.name ? 'border-red-500' : 'border-gray-200 hover:border-gray-300']"
              placeholder="Full Name">
            <p v-if="errors.name" class="mt-1 text-sm text-red-500">{{ errors.name }}</p>
          </div>

          <div class="relative">
            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-500">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
              </svg>
            </div>
            <input id="company" name="company" type="text"
              v-model="form.company"
              class="w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 placeholder-gray-400 transition-all hover:border-gray-300"
              placeholder="Company Name">
          </div>

          <div class="relative">
            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-500">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
            </div>
            <input id="email" name="email" type="email" required
              v-model="form.email"
              :class="['w-full pl-10 pr-4 py-3 border-2 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 placeholder-gray-400 transition-all', 
                errors.email ? 'border-red-500' : 'border-gray-200 hover:border-gray-300']"
              placeholder="Email address">
            <p v-if="errors.email" class="mt-1 text-sm text-red-500">{{ errors.email }}</p>
          </div>

          <div class="relative">
            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-500">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
              </svg>
            </div>
            <input id="phone" name="phone" type="tel" required
              v-model="form.phone"
              :class="['w-full pl-10 pr-4 py-3 border-2 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 placeholder-gray-400 transition-all', 
                errors.phone ? 'border-red-500' : 'border-gray-200 hover:border-gray-300']"
              placeholder="Phone Number">
            <p v-if="errors.phone" class="mt-1 text-sm text-red-500">{{ errors.phone }}</p>
          </div>

          <div class="flex items-center">
            <input id="terms" name="terms" type="checkbox" required
              v-model="form.terms"
              :class="['w-5 h-5 text-blue-600 rounded-lg border-2 focus:ring-blue-500 transition-all', 
                errors.terms ? 'border-red-500' : 'border-gray-200 hover:border-gray-300']">
            <label for="terms" class="ml-3 block text-sm text-gray-700">
              I agree to the <a href="#" class="text-blue-600 hover:text-blue-500 font-medium">terms and conditions</a>
            </label>
            <p v-if="errors.terms" class="mt-1 text-sm text-red-500">{{ errors.terms }}</p>
          </div>
        </div>

        <div class="mt-8">
          <button type="submit"
            :disabled="isLoading"
            :class="['w-full flex justify-center py-3.5 px-6 border border-transparent text-sm font-semibold rounded-xl text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-all',
              isLoading ? 'bg-gradient-to-r from-blue-400 to-purple-400 cursor-not-allowed' : 'bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700']">
            <span v-if="isLoading" class="flex items-center">
              <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              Processing...
            </span>
            <span v-else>Create Account</span>
          </button>
          <p class="mt-4 text-center text-sm text-gray-600">
            Already have an account? <a href="/login" class="text-blue-600 hover:text-blue-500">Sign in</a>
          </p>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const form = ref({
  name: '',
  company: '',
  email: '',
  phone: '',
  terms: false
})

const errors = ref({
  name: '',
  email: '',
  phone: '',
  terms: ''
})

const isLoading = ref(false)

const validateEmail = (email) => {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

const validatePhone = (phone) => {
  return /^\+?[0-9]{10,15}$/.test(phone)
}

const handleSubmit = async () => {
  // Reset errors
  errors.value = {
    name: '',
    email: '',
    phone: '',
    terms: ''
  }

  // Validate required fields
  if (!form.value.name.trim()) {
    errors.value.name = 'Full name is required'
  }
  if (!form.value.email.trim()) {
    errors.value.email = 'Email is required'
  } else if (!validateEmail(form.value.email)) {
    errors.value.email = 'Please enter a valid email address'
  }
  if (!form.value.phone.trim()) {
    errors.value.phone = 'Phone number is required'
  } else if (!validatePhone(form.value.phone)) {
    errors.value.phone = 'Please enter a valid phone number'
  }
  if (!form.value.terms) {
    errors.value.terms = 'You must agree to the terms and conditions'
  }

  // Check if there are any errors
  if (Object.values(errors.value).some(error => error !== '')) {
    return
  }

  // Submit form
  isLoading.value = true
  try {
    // TODO: Implement form submission
    console.log('Form submitted successfully')
  } catch (error) {
    console.error('Form submission error:', error)
  } finally {
    isLoading.value = false
  }
}
</script>
