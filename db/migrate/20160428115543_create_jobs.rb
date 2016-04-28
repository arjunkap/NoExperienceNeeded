class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :description
      t.string :title
      t.date :post_date
      t.date :closing_date
      t.string :country
      t.string :state
      t.string :city
      t.integer :views
      t.date :last_updated

      t.timestamps null: false
    end
  end
end
