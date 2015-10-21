class PaymentsController < ApplicationController

  def create
  	token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    customer = Stripe::Customer.create(
      :source => token,
      description: @user.first_name + " " + @user.last_name,
      email: @user.email
      )

  		charge = Stripe::Charge.create(
  			:amount => @product.price * 100,
  			:currency => "usd",
  			:description => @product.description,
        :customer => customer.id
  			)

    if charge.paid
      Order.create(
        :total => @product.price,
        :product_id => @product.id,
        :user_id => @user.id
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


# # save the customer ID in your database so you can use it later
# save_stripe_customer_id(user, customer.id)

# # later
# customer_id = get_stripe_customer_id(user)

# Stripe::Charge.create(
#     amount: 1500, # $15.00 this time
#     currency: 'usd',
#     customer: customer_id
# )