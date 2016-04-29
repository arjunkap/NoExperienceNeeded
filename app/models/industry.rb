class Industry < ActiveRecord::Base
  has_many :sub_industries
  has_many :company_industries
end
