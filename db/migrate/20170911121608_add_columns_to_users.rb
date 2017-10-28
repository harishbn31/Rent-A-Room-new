class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :mobile, :string
  	add_column :users, :role_id, :integer
  end
end
