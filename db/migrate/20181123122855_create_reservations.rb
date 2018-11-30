class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.belongs_to :user
      t.belongs_to :residence
      t.belongs_to :auction
      t.date :reservation_date

      t.timestamps
    end
  end
end
