class UserMailer < ApplicationMailer
  def reset_password(user)
    mail to: user.email, subject: 'test'
  end
end
