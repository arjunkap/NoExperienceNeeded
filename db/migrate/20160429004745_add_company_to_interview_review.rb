class AddCompanyToInterviewReview < ActiveRecord::Migration
  def change
    add_reference :interview_reviews, :company, index: true, foreign_key: true
  end
end
