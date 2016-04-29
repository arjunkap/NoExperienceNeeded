class JobSeeker < ActiveRecord::Base
  has_many :members
  has_many :content_ratings
  has_many :views
  has_many :upvotes
  has_many :portfolio_items
  has_many :short_listed_jobs
  belongs_to :user
  has_many :skills
  has_many :interview_reviews
end
