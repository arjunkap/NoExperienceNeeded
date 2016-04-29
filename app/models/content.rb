class Content < ActiveRecord::Base
  has_one :content_type
  has_many :content_ratings
  has_many :views
  belongs_to :content_type

end
