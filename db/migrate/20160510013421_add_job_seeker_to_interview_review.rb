class AddJobSeekerToInterviewReview < ActiveRecord::Migration
  def change
    add_reference :interview_reviews, :job_seeker, index: true, foreign_key: true
  end
end
