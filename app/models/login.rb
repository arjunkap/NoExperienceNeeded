class Login < ActiveRecord::Base
  belongs_to :user
  has_one :token
end
