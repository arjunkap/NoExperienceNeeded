class UserLocation < ActiveRecord::Base
  belongs_to :super_user
  belongs_to :location
end
