class AddPasswordResetToIdentity < ActiveRecord::Migration
  def self.up
    add_column :identities, :password_reset_token, :string
    add_column :identities, :password_reset_sent_at, :datetime
  end

  def self.down
    remove_column :identities, :password_reset_token
    remove_column :identities, :password_reset_sent_at
  end
end
