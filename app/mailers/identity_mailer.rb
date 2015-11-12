class IdentityMailer < ActionMailer::Base
  default from: "Wavetronix.com <webmaster@wavetronix.com>"

  def password_reset(identity)
    @identity = identity
    @title = "Password Reset"

    mail to: identity.email, subject: "Your Wavetronix ID identity password was reset."
  end
end
