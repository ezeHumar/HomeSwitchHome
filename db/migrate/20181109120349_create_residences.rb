class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :name
      t.integer :capacity
      t.string :location
      t.string :photos

      t.timestamps
    end
  end
end
