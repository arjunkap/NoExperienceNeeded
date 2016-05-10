class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.string :question
      t.text :answer

      t.timestamps null: false
    end
  end
end
