class AddTitleToInterviewReview < ActiveRecord::Migration
  def change
    add_column :interview_reviews, :title, :string
  end
end
