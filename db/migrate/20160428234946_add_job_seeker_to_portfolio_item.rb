class AddJobSeekerToPortfolioItem < ActiveRecord::Migration
  def change
    add_reference :portfolio_items, :job_seeker, index: true, foreign_key: true
  end
end
