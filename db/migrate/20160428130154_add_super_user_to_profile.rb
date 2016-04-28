class AddSuperUserToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :super_user, index: true, foreign_key: true
  end
end
