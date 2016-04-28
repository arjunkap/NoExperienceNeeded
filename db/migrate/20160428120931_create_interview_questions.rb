class CreateInterviewQuestions < ActiveRecord::Migration
  def change
    create_table :interview_questions do |t|
    
      t.timestamps null: false
    end
  end
end
