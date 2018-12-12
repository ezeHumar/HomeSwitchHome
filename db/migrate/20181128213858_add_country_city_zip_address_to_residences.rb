class AddCountryCityZipAddressToResidences < ActiveRecord::Migration[5.2]
  def change
    add_column :residences, :country, :string
    add_column :residences, :city, :string
    add_column :residences, :zip, :string
    add_column :residences, :address, :string
  end
end
