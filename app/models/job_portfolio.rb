class JobPortfolio < ActiveRecord::Base
  belongs_to :portfolio_item
  belongs_to :job
end
