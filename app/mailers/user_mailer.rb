class UserMailer < ActionMailer::Base
  default from: "Wavetronix Entitlement Server <webmaster@wavetronix.com>"

  def new_account(user)
    @user = user
    @title = "New Account Created for Entitlement Server"

    if Rails.env.development?
      mail to: 'ehuntsman@wavetronix.com', subject: "A new Entitlement Server account has been created" #for testing only
    else
      mail to: 'appsupport@wavetronix.com', subject: "A new Entitlement Server account has been created"
    end
  end

end
