// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: false },
  modules: ['@nuxtjs/tailwindcss'],
  runtimeConfig: {
    public: {
      supabaseUrl: process.env.SUPABASE_URL,
      supabaseKey: process.env.SUPABASE_KEY,
      stripePublicKey: process.env.STRIPE_PUBLIC_KEY,
    },
    stripeSecretKey: process.env.STRIPE_SECRET_KEY,
    baseUrl: process.env.BASE_URL
  },
  app: {
    head: {
      title: 'OnTheFocus',
      link: [
        {
          rel: 'stylesheet', 
          href: 'https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&display=swap'
        }
      ]
    }
  },
  alias: {
    '~': './app'
  }
})
