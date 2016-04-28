class Login < ActiveRecord::Base
  belongs_to :super_user
  has_one :token
end
