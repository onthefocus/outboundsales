import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY || '', {
  apiVersion: '2024-12-18.acacia'
})

export default defineEventHandler(async (event) => {
  const body = await readBody(event)
  
  try {
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: `${body.minutes} Minutes Package`
          },
          unit_amount: body.price * 100
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: `${process.env.BASE_URL}/billing/success`,
      cancel_url: `${process.env.BASE_URL}/billing`
    })

    return { sessionId: session.id }
  } catch (error) {
    throw createError({
      statusCode: 500,
      statusMessage: 'Failed to create checkout session'
    })
  }
})
