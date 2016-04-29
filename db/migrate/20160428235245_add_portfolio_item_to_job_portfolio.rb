class AddPortfolioItemToJobPortfolio < ActiveRecord::Migration
  def change
    add_reference :job_portfolios, :portfolio_item, index: true, foreign_key: true
  end
end
