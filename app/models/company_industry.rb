class CompanyIndustry < ActiveRecord::Base
  belongs_to :industry
  belongs_to :company
end
