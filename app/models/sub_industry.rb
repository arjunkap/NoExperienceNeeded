class SubIndustry < ActiveRecord::Base
	has_many :jobs


	 def self.uniq_with_column col
	 	collection = SubIndustry.uniq.pluck(col)
	 end
end
