class CreateJobSeekers < ActiveRecord::Migration
  def change
    create_table :job_seekers do |t|
      t.string :mobile_number

      t.timestamps null: false
    end
  end
end
