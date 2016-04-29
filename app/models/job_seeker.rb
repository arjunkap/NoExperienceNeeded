class JobSeeker < ActiveRecord::Base
  has_many :members
  has_many :content_ratings
  has_many :views
  has_many :upvotes
  has_many :portfolio_items
  
end
