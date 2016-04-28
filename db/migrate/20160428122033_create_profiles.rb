class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_pic_location
      t.string :website_url
      t.date :last_updated
      t.text :about_me

      t.timestamps null: false
    end
  end
end
