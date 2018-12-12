class AddCreditCardToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :credit_card, :string
  end
end
