class AddJobSeekerToShortListedJob < ActiveRecord::Migration
  def change
    add_reference :short_listed_jobs, :job_seeker, index: true, foreign_key: true
  end
end
