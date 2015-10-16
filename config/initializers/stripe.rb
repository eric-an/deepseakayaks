if Rails.env.production?
  Rails.configuration.stripe = {
  	:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  	:secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
	Rails.configuration.stripe = {
    :publishable_key => 'pk_test_70TZ4IPjWM8XOIuiGgh26YSa',
    :secret_key => 'sk_test_ATixX1X1mwOyGNLNBPaHiIGo'
	}
end

	Stripe.api_key = Rails.configuration.stripe[:secret_key]