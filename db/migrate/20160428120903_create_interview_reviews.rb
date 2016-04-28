class CreateInterviewReviews < ActiveRecord::Migration
  def change
    create_table :interview_reviews do |t|
      t.string :company_name
      t.text :description
      t.string :position
      t.date :interview_date
      t.string :experience
      t.boolean :offer
      t.integer :difficulty
      t.integer :duration

      t.timestamps null: false
    end
  end
end
