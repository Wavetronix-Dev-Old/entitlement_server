class AddTitleToIdentities < ActiveRecord::Migration
  def self.up
    add_column :identities, :company, :string
    add_column :identities, :job_title, :string
  end

  def self.down
    remove_column :identities, :company
    remove_column :identities, :job_title
  end
end
