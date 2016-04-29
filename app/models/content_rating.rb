class ContentRating < ActiveRecord::Base
  belongs_to :job_seeker
  belongs_to :content
end
