class AddCompanyToCompanyIndustry < ActiveRecord::Migration
  def change
    add_reference :company_industries, :company, index: true, foreign_key: true
  end
end
