class User < ActiveRecord::Base

  attr_accessor :remember_token

  has_one :login
  has_many :reports
  has_one :profile
  has_many :skill_verifiers
  has_one :user_location
  has_one :company
  has_one :job_seeker
  has_many :jobs
  has_many :short_listed_jobs
  
  # attr_accessor :password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i
  validates :first_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX


  has_secure_password
  validates :password, :confirmation => true , length: { minimum: 6 }#password_confirmation attr
   # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def self.create_from_console

  end

 def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

   def self.update_user_from_console (params, id)
      user = User.find(id).update(params)
    

      # if user.password.present?
      #   user.salt = BCrypt::Engine.generate_salt
      #   user.encrypted_password= BCrypt::Engine.hash_secret(user.password, user.salt)
      # end

      # Return the user for future use
      user
   end
end
