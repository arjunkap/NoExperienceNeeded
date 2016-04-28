class CreatePortFolioItemTypes < ActiveRecord::Migration
  def change
    create_table :port_folio_item_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
