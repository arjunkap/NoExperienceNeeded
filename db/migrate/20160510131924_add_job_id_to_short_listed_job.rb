class AddJobIdToShortListedJob < ActiveRecord::Migration
  def change
    add_column :short_listed_jobs, :job_id, :integer
  end
end
