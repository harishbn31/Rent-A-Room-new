class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.float :price
      t.text :rules
      t.text :address
      t.string :images
      t.float :latitude
      t.float :longitude
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
