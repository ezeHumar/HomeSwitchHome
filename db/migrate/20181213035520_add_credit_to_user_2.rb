class AddCreditToUser2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :credit, :integer, default: 2
  end
end
