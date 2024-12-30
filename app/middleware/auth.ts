import { supabase } from '../utils/supabase'

export default defineNuxtRouteMiddleware(async (to) => {
  const { data: { session } } = await supabase.auth.getSession()

  if (!session && to.path !== '/login') {
    return navigateTo('/login')
  }
})
