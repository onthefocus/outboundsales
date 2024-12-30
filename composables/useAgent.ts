import { ref } from 'vue'
import type { Agent } from '~/types/models'
import { createClient } from '@supabase/supabase-js'

export const useAgent = () => {
  const supabase = createClient(
    process.env.SUPABASE_URL || '',
    process.env.SUPABASE_KEY || ''
  )
  const agents = ref<Agent[]>([])
  const loading = ref(false)
  const error = ref<Error | null>(null)

  const fetchAgents = async () => {
    try {
      loading.value = true
      const { data, error: queryError } = await supabase
        .from('agents')
        .select('*')
        .order('created_at', { ascending: false })
      
      if (queryError) throw queryError
      agents.value = data
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  const createAgent = async (agent: Omit<Agent, 'id' | 'created_at'>) => {
    try {
      loading.value = true
      const { data, error: insertError } = await supabase
        .from('agents')
        .insert(agent)
        .select()
        .single()
      
      if (insertError) throw insertError
      agents.value.unshift(data)
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  const updateAgent = async (id: string, updates: Partial<Agent>) => {
    try {
      loading.value = true
      const { data, error: updateError } = await supabase
        .from('agents')
        .update(updates)
        .eq('id', id)
        .select()
        .single()
      
      if (updateError) throw updateError
      const index = agents.value.findIndex((a: Agent) => a.id === id)
      if (index !== -1) {
        agents.value.splice(index, 1, data)
      }
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  const deleteAgent = async (id: string) => {
    try {
      loading.value = true
      const { error: deleteError } = await supabase
        .from('agents')
        .delete()
        .eq('id', id)
      
      if (deleteError) throw deleteError
      agents.value = agents.value.filter((a: Agent) => a.id !== id)
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  return {
    agents,
    loading,
    error,
    fetchAgents,
    createAgent,
    updateAgent,
    deleteAgent
  }
}
