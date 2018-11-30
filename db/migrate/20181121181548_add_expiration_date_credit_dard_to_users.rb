class AddExpirationDateCreditDardToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expiration_credit_card, :date
  end
end
