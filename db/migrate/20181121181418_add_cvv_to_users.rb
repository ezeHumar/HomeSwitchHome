class AddCvvToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cvv, :integer
  end
end
