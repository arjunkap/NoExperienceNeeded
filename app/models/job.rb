class Job < ActiveRecord::Base
  require 'date'
  has_many :short_listed_jobs
  belongs_to :user
  belongs_to :sub_industry
  # self.per_page = 10
  validates :title, :presence => true
  validates :question1, :presence => true
  validates :question2 , :presence => true
  validates :question3, :presence => true
  validates :category, :presence => true
  validates :work_type, :presence => true
  validates :closing_date, :presence => true
  validate :validate_closing_date
  validates :description, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true
  validates_length_of :title, :in => 6..100, :on => :create

  def validate_closing_date
    if closing_date.blank?
      #automatically added
    elsif !(is_valid_date closing_date)
      errors[:base] << "Please enter a correct closing date"
    end
  end

   def self.uniq_with_column col
   	collection = Job.uniq.pluck(col)
   end

  private
  def is_valid_date(date_entered)
   
    if date_entered  < DateTime.now.to_date
      return false
    end
    return true
  end

end
