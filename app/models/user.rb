class User < ActiveRecord::Base
  include Authentication
  rolify
  after_create :assign_initial_role

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

  def assign_initial_role
    if Mail::Address.new(self.email).domain == "wavetronix.com"
      self.add_role :wavetronix_employee
      self.save
    end
  end

end
