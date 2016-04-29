class PortfolioItem < ActiveRecord::Base
  belongs_to :job_seeker
  has_many :attachments
end
