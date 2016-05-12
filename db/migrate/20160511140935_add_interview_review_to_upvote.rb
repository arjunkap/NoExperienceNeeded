class AddInterviewReviewToUpvote < ActiveRecord::Migration
  def change
    add_reference :upvotes, :interview_review, index: true, foreign_key: true
  end
end
