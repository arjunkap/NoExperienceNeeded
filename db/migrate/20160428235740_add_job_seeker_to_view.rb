class AddJobSeekerToView < ActiveRecord::Migration
  def change
    add_reference :views, :job_seeker, index: true, foreign_key: true
  end
end
