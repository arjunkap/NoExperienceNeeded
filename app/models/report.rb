class Report < ActiveRecord::Base
  has_one :super_user
  belongs_to :reason

end
