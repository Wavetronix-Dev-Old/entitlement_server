class ChangeUserFields < ActiveRecord::Migration
  def self.up
    rename_column :users, :company, :location
    rename_column :users, :job_title, :description
  end

  def self.down
    rename_column :users, :location, :company
    rename_column :users, :description, :job_title
  end
end
