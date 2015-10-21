class PaymentsController < ApplicationController

  def create
  	token = params[:stripeToken]
    @product = Product.find(params[:product_id])

		charge = Stripe::Charge.create(
			:amount => @product.price * 100,
			:currency => "usd",
			:description => @product.description,
      :source => token
			)

    if charge.paid
      Order.create(
        :total => @product.price * 100,
        :product_id => @product.id,
        :user_id => @user_id
)
    end

  	rescue Stripe::CardError => e
    # The card has been declined
      body = e.json_body
      err = body[:error]
      flash.notice = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      redirect_to product_path(@product)
  end
end