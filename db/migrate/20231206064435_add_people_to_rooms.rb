class AddPeopleToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :people, :integer
    add_column :rooms, :check_in, :date
    add_column :rooms, :check_out, :date
  end
end
