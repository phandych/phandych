# Preview all emails at http://localhost:3000/rails/mailers/frontend/user_mailer
class Frontend::UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/frontend/user_mailer/account_activation
  def account_activation
  	user = User.first
  	user.activation_token = User.new_token
    Frontend::UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/frontend/user_mailer/password_reset
  def password_reset
    Frontend::UserMailer.password_reset
  end

end
