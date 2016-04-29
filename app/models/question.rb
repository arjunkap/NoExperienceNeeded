class Question < ActiveRecord::Base
  has_many :interview_questions
  has_many :answers
end
