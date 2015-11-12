class IdentityMailer < ActionMailer::Base
  default from: "Wavetronix.com <webmaster@wavetronix.com>"

  def new_account(identity)
    @identity = identity
    @title = "New Account Created for Entitlement Server"

    mail to: 'appsupport@wavetronix.com', subject: "A new Entitlement Server account has been created"
    # mail to: 'ehuntsman@wavetronix.com', subject: "A new Entitlement Server account has been created" #for testing only
  end

  def password_reset(identity)
    @identity = identity
    @title = "Password Reset"

    mail to: identity.email, subject: "Your Wavetronix ID identity password was reset."
  end
end
