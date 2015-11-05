class AddTitleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :company, :string
    add_column :users, :job_title, :string
  end

  def self.down
    remove_column :users, :company
    remove_column :users, :job_title
  end
end
