class User < ActiveRecord::Base
  include Authentication
  rolify
  after_create :assign_initial_role, :send_new_account_email

  validates :uid,
            :provider,
            :first_name,
            :last_name,
            :email, presence: true

  def name
    %W[#{first_name} #{last_name}].join(" ")
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def send_new_account_email
    UserMailer.new_account(self).deliver_now
  end

  def assign_initial_role
    if Mail::Address.new(self.email).domain == "wavetronix.com"
      self.add_role :wavetronix_employee
      self.save
    end
  end

  def account_success
    #redirect needs to be outside of model
  end

end
