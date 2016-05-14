class Job < ActiveRecord::Base
  has_many :short_listed_jobs
  belongs_to :user
  belongs_to :sub_industry
  # self.per_page = 10
  validates :title, :presence => true
  validates :question1, :presence => true
  validates :question2 , :presence => true
  validates :question3, :presence => true


  validates_length_of :title, :in => 6..100, :on => :create



  validates :description, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true

 
 def self.uniq_with_column col
 	collection = Job.uniq.pluck(col)
 end

end
