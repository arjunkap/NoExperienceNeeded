class AddSuperUserToReport < ActiveRecord::Migration
  def change
    add_reference :reports, :super_user, index: true, foreign_key: true
  end
end
