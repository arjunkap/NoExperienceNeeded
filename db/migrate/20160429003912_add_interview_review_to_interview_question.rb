class AddInterviewReviewToInterviewQuestion < ActiveRecord::Migration
  def change
    add_reference :interview_questions, :interview_review, index: true, foreign_key: true
  end
end
