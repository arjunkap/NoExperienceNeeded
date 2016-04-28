class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :email
      t.string :password
      t.boolean :verified_account
      t.date :last_login

      t.timestamps null: false
    end
  end
end
