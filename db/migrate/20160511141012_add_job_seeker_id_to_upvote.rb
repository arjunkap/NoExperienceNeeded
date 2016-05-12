class AddJobSeekerIdToUpvote < ActiveRecord::Migration
  def change
    add_column :upvotes, :job_seeker_id, :integer
  end
end
