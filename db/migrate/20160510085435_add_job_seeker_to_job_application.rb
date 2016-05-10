class AddJobSeekerToJobApplication < ActiveRecord::Migration
  def change
    add_reference :job_applications, :job_seeker, index: true, foreign_key: true
  end
end
