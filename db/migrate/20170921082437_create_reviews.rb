class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :food_rating
      t.integer :cleanliness_rating
      t.integer :safety_rating
      t.integer :facility_rating
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
