class Job < ActiveRecord::Base
  has_many :short_listed_jobs
  belongs_to :user
  has_one :sub_industry

  validates :title, :presence => true
  validates_length_of :title, :in => 6..100, :on => :create



  validates :description, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true

 

end
