class Report < ActiveRecord::Base
  has_one :user
  belongs_to :reason

end
