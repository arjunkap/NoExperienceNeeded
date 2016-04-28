class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|

      t.timestamps null: false
    end
  end
end
