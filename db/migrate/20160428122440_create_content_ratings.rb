class CreateContentRatings < ActiveRecord::Migration
  def change
    create_table :content_ratings do |t|
      t.integer :rating
      t.text :comment

      t.timestamps null: false
    end
  end
end
