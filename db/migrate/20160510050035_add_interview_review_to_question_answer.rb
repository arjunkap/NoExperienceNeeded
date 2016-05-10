class AddInterviewReviewToQuestionAnswer < ActiveRecord::Migration
  def change
    add_reference :question_answers, :interview_review, index: true, foreign_key: true
  end
end
