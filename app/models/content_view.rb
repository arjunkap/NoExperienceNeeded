class ContentView < ActiveRecord::Base
  belongs_to :content
  belongs_to :job_seeker
end
