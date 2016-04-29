class Company < ActiveRecord::Base
  has_many :interview_review
  belongs_to :company_industry
  belongs_to :user
  
end
