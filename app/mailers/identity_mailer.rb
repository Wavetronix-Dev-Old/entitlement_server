class IdentityMailer < ActionMailer::Base
  default from: "Wavetronix Entitlement Server <webmaster@wavetronix.com>"

  def password_reset(identity)
    @identity = identity
    @title = "Password Reset"

    mail to: identity.email, subject: "Your Wavetronix Entitlement Server identity password was reset."
  end

  def new_account(identity)
    @identity = identity
    @title = "New Account Created for Entitlement Server"

    if Rails.env.development?
      mail to: 'ehuntsman@wavetronix.com', subject: "A new Entitlement Server account has been created" #for testing only
    else
      mail to: 'appsupport@wavetronix.com', subject: "A new Entitlement Server account has been created"
    end
  end

end
