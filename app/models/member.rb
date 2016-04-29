class Member < ActiveRecord::Base
  belongs_to :job_seeker
  has_one :portfolio_item
end
