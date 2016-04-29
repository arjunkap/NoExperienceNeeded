class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.date :date_viewed

      t.timestamps null: false
    end
  end
end
