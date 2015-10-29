class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :first_name,
            :last_name, presence: true
  validates :password,
            :password_confirmation, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$\Z/i }


  ## PASSWORD RESET METHODS
  def send_password_reset
    generate_token :password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save!
    IdentityMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Identity.exists?(column => self[column])
  end

end
