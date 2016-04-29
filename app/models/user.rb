class User < ActiveRecord::Base
  has_one :login
  has_many :reports
  has_one :profile
  has_many :skill_verifiers
  has_one :user_location
end
