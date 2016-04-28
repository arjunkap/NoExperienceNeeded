class AddSuperUserToLogin < ActiveRecord::Migration
  def change
    add_reference :logins, :super_user, index: true, foreign_key: true
  end
end
