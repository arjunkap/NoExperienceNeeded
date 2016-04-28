class CreateCompanyIndustries < ActiveRecord::Migration
  def change
    create_table :company_industries do |t|
      t.string :industry_name

      t.timestamps null: false
    end
  end
end
