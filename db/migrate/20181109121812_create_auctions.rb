class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.date :startDate
      t.integer :residence_id
      t.string :email
      t.float :amount

      t.timestamps
    end
  end
end
