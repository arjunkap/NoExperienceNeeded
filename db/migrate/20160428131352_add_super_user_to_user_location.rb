class AddSuperUserToUserLocation < ActiveRecord::Migration
  def change
    add_reference :user_locations, :super_user, index: true, foreign_key: true
  end
end
