class InterviewQuestion < ActiveRecord::Base
  has_one :question
  belongs_to :interview_review
end
