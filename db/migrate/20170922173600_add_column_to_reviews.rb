class AddColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :locality_rating, :integer
  end
end
