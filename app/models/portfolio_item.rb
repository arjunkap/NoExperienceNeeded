class PortfolioItem < ActiveRecord::Base
  belongs_to :job_seeker
  has_many :attachments
  has_many :members
  belongs_to :portfolio_item
  has_many :job_portfolios
end
