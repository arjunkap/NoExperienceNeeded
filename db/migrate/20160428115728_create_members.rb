class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.date :date_joined

      t.timestamps null: false
    end
  end
end
