class AddSubIndudstryToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :sub_industry, index: true, foreign_key: true
  end
end
