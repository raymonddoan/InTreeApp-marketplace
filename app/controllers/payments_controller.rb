class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    paid_order_id = payment.metadata.listing_id
    user_id = payment.metadata.user_id

    paid_order = SellOrder.find(paid_order_id.to_i)
    paid_order.filled = true
    paid_order.buyer_id = user_id.to_i
    paid_order.save

    # status 200
  end

end
