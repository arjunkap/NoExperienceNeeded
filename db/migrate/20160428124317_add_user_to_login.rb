class AddUserToLogin < ActiveRecord::Migration
  def change
    add_reference :logins, :user, index: true, foreign_key: true
  end
end
