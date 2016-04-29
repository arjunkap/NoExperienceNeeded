class AddIndustryToSubIndustry < ActiveRecord::Migration
  def change
    add_reference :sub_industries, :industry, index: true, foreign_key: true
  end
end
