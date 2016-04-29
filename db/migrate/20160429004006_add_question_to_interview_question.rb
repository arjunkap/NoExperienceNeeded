class AddQuestionToInterviewQuestion < ActiveRecord::Migration
  def change
    add_reference :interview_questions, :question, index: true, foreign_key: true
  end
end
