class InterviewReview < ActiveRecord::Base
  has_many :interview_questions
  has_many :upvotes
  has_one :interview_question
  belongs_to :company
end
