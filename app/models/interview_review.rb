class InterviewReview < ActiveRecord::Base
  has_many :question_answers
  has_many :upvotes
  belongs_to :company
  belongs_to :job_seeker	
end
