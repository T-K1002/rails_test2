class AddAdressToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :adress, :string
  end
end
