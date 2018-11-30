class AddDescriptionToResidences < ActiveRecord::Migration[5.2]
  def change
    add_column :residences, :description, :string
  end
end
