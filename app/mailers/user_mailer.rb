class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
  	@message = message
  	@name = name
  	@email = email
  	mail(:from => email,
  				:to => 'erican@me.com',
  				:subject => "A new message from #{name}.")
  end
end
