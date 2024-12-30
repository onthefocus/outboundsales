import { ref } from 'vue'
import type { Campaign } from '~/types/models'
import { createClient } from '@supabase/supabase-js'

export const useCampaign = () => {
  const supabase = createClient(
    process.env.SUPABASE_URL || '',
    process.env.SUPABASE_KEY || ''
  )
  const campaigns = ref<Campaign[]>([])
  const loading = ref(false)
  const error = ref<Error | null>(null)

  const fetchCampaigns = async () => {
    try {
      loading.value = true
      const { data, error: queryError } = await supabase
        .from('campaigns')
        .select('*')
        .order('created_at', { ascending: false })
      
      if (queryError) throw queryError
      campaigns.value = data
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  const createCampaign = async (campaign: Omit<Campaign, 'id' | 'created_at'>) => {
    try {
      loading.value = true
      const { data, error: insertError } = await supabase
        .from('campaigns')
        .insert(campaign)
        .select()
        .single()
      
      if (insertError) throw insertError
      campaigns.value.unshift(data)
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  const updateCampaign = async (id: string, updates: Partial<Campaign>) => {
    try {
      loading.value = true
      const { data, error: updateError } = await supabase
        .from('campaigns')
        .update(updates)
        .eq('id', id)
        .select()
        .single()
      
      if (updateError) throw updateError
      const index = campaigns.value.findIndex((c: Campaign) => c.id === id)
      if (index !== -1) {
        campaigns.value.splice(index, 1, data)
      }
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  const deleteCampaign = async (id: string) => {
    try {
      loading.value = true
      const { error: deleteError } = await supabase
        .from('campaigns')
        .delete()
        .eq('id', id)
      
      if (deleteError) throw deleteError
      campaigns.value = campaigns.value.filter((c: Campaign) => c.id !== id)
    } catch (err) {
      error.value = err as Error
    } finally {
      loading.value = false
    }
  }

  return {
    campaigns,
    loading,
    error,
    fetchCampaigns,
    createCampaign,
    updateCampaign,
    deleteCampaign
  }
}
