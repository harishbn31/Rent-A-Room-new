class AddColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :user_id, :integer
  end
end
