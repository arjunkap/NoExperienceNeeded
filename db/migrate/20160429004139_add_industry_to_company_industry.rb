class AddIndustryToCompanyIndustry < ActiveRecord::Migration
  def change
    add_reference :company_industries, :industry, index: true, foreign_key: true
  end
end
