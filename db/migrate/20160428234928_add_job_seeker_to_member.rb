class AddJobSeekerToMember < ActiveRecord::Migration
  def change
    add_reference :members, :job_seeker, index: true, foreign_key: true
  end
end
