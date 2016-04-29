class CreateJobPortfolios < ActiveRecord::Migration
  def change
    create_table :job_portfolios do |t|

      t.timestamps null: false
    end
  end
end
