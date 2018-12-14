class AddUserIdToHotsale < ActiveRecord::Migration[5.2]
  def change
    add_column :hotsales, :user_id, :integer
  end
end
