class RemoveAdminToUsers < ActiveRecord::Migration[5.2]
  def self.up
  remove_column :users, :admin
end
end
