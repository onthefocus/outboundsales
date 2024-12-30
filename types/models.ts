export interface Agent {
  id: string
  name: string
  description: string
  campaign_id: string
  status: 'active' | 'inactive' | 'training'
  created_at: string
  updated_at: string
  instructions: string
  scripts: string[]
  metrics: {
    calls_made: number
    calls_answered: number
    success_rate: number
  }
}

export interface Campaign {
  id: string
  name: string
  description: string
  status: 'draft' | 'active' | 'completed'
  account_id: string
  created_at: string
  updated_at: string
  settings: Record<string, any>
  metrics: {
    calls_made: number
    calls_answered: number
    conversion_rate: number
  }
}
