class AddJobSeekerToContentRating < ActiveRecord::Migration
  def change
    add_reference :content_ratings, :job_seeker, index: true, foreign_key: true
  end
end
