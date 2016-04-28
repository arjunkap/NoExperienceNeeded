class CreatePortfolioItems < ActiveRecord::Migration
  def change
    create_table :portfolio_items do |t|
      t.string :name
      t.text :description
      t.string :project_type
      t.text :url

      t.timestamps null: false
    end
  end
end
