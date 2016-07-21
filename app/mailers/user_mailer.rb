class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notification_email(user)
    @user = user
    mail(to: @user.email, subject: 'Your account has been deleted.')
  end
end
