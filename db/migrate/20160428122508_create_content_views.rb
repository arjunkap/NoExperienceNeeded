class CreateContentViews < ActiveRecord::Migration
  def change
    create_table :content_views do |t|
      t.date :date_viewed

      t.timestamps null: false
    end
  end
end
