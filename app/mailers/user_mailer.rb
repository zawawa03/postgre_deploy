class UserMailer < ApplicationMailer
  default from: "sample@example.com"

  def login_mail
    @user = params[:user]
    mail(to: @user.email, subject: "ログイン通知")
  end
end
