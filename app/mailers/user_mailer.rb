class UserMailer < ActionMailer::Base
  default from: "admin@archbroker.com"

  def reset_password(user, new_password)
    @user = user
    @new_password = new_password
    mail(to: @user.email, subject: '[Archbroker] Password reset')
  end
end
