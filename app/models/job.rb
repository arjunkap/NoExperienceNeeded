class Job < ActiveRecord::Base
  has_many :short_listed_jobs
  belongs_to :user
  has_one :sub_industry
end
