class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.text :detail
      t.string :image_id
      t.integer :price
      t.integer :user_id
      t.integer :people
      t.integer :day
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
