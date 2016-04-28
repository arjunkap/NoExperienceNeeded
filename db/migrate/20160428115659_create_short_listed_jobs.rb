class CreateShortListedJobs < ActiveRecord::Migration
  def change
    create_table :short_listed_jobs do |t|
      t.date :date_added

      t.timestamps null: false
    end
  end
end
