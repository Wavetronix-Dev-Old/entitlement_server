class IdentityMailer < ActionMailer::Base
  default from: "Wavetronix Entitlement Server <webmaster@wavetronix.com>"

  def password_reset(identity)
    @identity = identity
    @title = "Password Reset"

    mail to: identity.email, subject: "Your Wavetronix Entitlement Server identity password was reset."
  end

end
