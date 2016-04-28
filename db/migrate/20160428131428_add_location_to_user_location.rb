class AddLocationToUserLocation < ActiveRecord::Migration
  def change
    add_reference :user_locations, :location, index: true, foreign_key: true
  end
end
