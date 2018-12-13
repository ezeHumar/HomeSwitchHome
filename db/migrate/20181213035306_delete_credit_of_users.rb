class DeleteCreditOfUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :credit
  end
end
