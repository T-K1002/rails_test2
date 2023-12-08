class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.text :detail
      t.string :image_id
      t.integer :price

      t.timestamps
    end
  end
end
