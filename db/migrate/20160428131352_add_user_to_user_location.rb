class AddUserToUserLocation < ActiveRecord::Migration
  def change
    add_reference :user_locations, :user, index: true, foreign_key: true
  end
end
