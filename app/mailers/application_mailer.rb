class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@hyperbeast.com"
  layout 'mailer'
end
