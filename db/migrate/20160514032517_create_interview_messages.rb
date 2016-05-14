class CreateInterviewMessages < ActiveRecord::Migration
  def change
    create_table :interview_messages do |t|
      t.text :message

      t.timestamps null: false
    end
  end
end
