class UserMailer < ApplicationMailer
  default from: "Welcome@DeepSeaKayaks.com"

  def contact_form(email, name, message)
  	@message = message
  	@name = name
  	@email = email
  	mail(:from => email,
  				:to => 'erican@me.com',
  				:subject => "New message from #{name}.")
  end

  def welcome_email(user)
  	@user = user
  	mail(:to => user.email, 
  		    :subject => "Welcome to Deep Sea Kayaks!")
  end
end