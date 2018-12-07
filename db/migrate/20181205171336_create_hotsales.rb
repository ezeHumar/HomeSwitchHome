class CreateHotsales < ActiveRecord::Migration[5.2]
  def change
    create_table :hotsales do |t|
      t.integer :reservation_id
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
