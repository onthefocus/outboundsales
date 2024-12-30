import { ref } from 'vue'
import type { User } from '@supabase/supabase-js'
import { createClient } from '@supabase/supabase-js'

export const useAuth = () => {
  const supabase = createClient(
    process.env.SUPABASE_URL || '',
    process.env.SUPABASE_KEY || ''
  )
  const user = ref<User | null>(null)
  const loading = ref(false)
  const error = ref<Error | null>(null)

  const login = async (email: string, password: string) => {
    try {
      loading.value = true
      const { data, error: authError } = await supabase.auth.signInWithPassword({
        email,
        password
      })
      if (authError) throw authError
      user.value = data.user
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  const logout = async () => {
    try {
      loading.value = true
      const { error: authError } = await supabase.auth.signOut()
      if (authError) throw authError
      user.value = null
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  const register = async (email: string, password: string) => {
    try {
      loading.value = true
      const { data, error: authError } = await supabase.auth.signUp({
        email,
        password
      })
      if (authError) throw authError
      user.value = data.user
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  return {
    user,
    loading,
    error,
    login,
    logout,
    register
  }
}
