class CreateSpecialPrices < ActiveRecord::Migration
  def change
    create_table :special_prices do |t|
      t.integer :room_id
      t.date :start_date
      t.date :end_date
      t.float :price

      t.timestamps null: false
    end
  end
end
