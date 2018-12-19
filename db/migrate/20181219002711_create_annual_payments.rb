class CreateAnnualPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :annual_payments do |t|
      t.datetime :date
      t.timestamps
    end
  end
end
