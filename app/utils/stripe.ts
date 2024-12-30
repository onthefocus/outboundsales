import { loadStripe } from '@stripe/stripe-js'

const stripePromise = loadStripe(process.env.STRIPE_PUBLIC_KEY || '')

export const useStripe = () => {
  if (!process.env.STRIPE_PUBLIC_KEY) {
    throw new Error('STRIPE_PUBLIC_KEY is not defined in environment variables')
  }
  return stripePromise
}
