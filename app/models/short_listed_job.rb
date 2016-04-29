class ShortListedJob < ActiveRecord::Base
  belongs_to :job_seeker
  belongs_to :job
end
