class Location < ActiveRecord::Base
  has_many :user_location
end
