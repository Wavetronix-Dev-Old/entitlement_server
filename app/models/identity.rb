class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :first_name,
            :last_name,
            :location,
            :description, presence: true
  validates :password,
            :password_confirmation, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$\Z/i }

  after_create :send_new_account_email

  after_destroy :delete_user

  def send_new_account_email
    IdentityMailer.new_account(self).deliver_now
  end

  ## PASSWORD RESET METHODS
  def send_password_reset
    generate_token :password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save!
    IdentityMailer.password_reset(self).deliver_now
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Identity.exists?(column => self[column])
  end

  def delete_user
    user = User.find_by(uid: id)
    user.destroy
  end

  def update_user
    user = User.find_by(uid: id)
    user.first_name = first_name
    user.last_name = last_name
    user.email = email
    user.location = location
    user.description = description
    user.save
  end

end
