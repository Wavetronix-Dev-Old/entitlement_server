class ChangeIdentityFields < ActiveRecord::Migration
  def self.up
    rename_column :identities, :company, :location
    rename_column :identities, :job_title, :description
  end

  def self.down
    rename_column :identities, :location, :company
    rename_column :identities, :description, :job_title
  end
end
