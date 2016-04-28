class CreateSuperUsers < ActiveRecord::Migration
  def change
    create_table :super_users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
