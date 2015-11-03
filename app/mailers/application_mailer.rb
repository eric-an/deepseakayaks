class ApplicationMailer < ActionMailer::Base
  default from: "WelcomeEmail@DeepSeaKayaks.com"
  layout 'mailer'
end
