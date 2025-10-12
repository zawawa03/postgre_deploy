class LoginWelcomeJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.with(user: user).login_mail.deliver_later
  end
end
