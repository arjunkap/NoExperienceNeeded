class AddNewColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :pic_location, :string
  	add_column :users, :web_url, :string
  	add_column :users, :about, :text

  end
end
