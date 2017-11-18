class Agent < ApplicationRecord
  has_many :messages
  has_many :reviews
  has_many :responses

  has_many :messaged_users, through: :messages, source: :user
  has_many :reviewed_users, through: :reviews, source: :user
  has_many :responsed_user, through: :responses, source: :user


  # # create an virtual  attribute call password
  # attr_accessor :password
  # #allow these fields to be accessible
  # attr_accessor :name, :email, :password, :bio, :specialty, :location, :image, :utf8, :authenticity_token, :commit, :agent
  #
  # email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  #
  # validates :name, :presence => true,
  #           :length          => { :maximum => 50 }
  # validates :email, :presence => true,
  #           :format           => { :with => email_regex},
  #           :uniqueness       => { :case_sensitive => false }
  # validates :password, :presence => true,
  #           :confirmation        => true, # to give proper validation error
  #           :length              => { :within => 6..40 }
  # validates :bio, :presence => true
  # validates :specialty, :presence => true
  # validates :location, :presence => true
  # validates :image, :presence => true
  #
  # #before someone try to save a password into the AGENT MODEL, we gonna
  # #run the function encrypt_password define under PRIVATE
  # before_save :encrypt_password
  #
  # def has_password?(submitted_password)
  #   password == encrypt(submitted_password)
  # end
  #
  # #to check if the email and submitted password are valid
  # # if it doesnt start with self., those are all instance method
  # def self.authenticate(email, submitted_password)
  #   user = find_by_email(email)
  #   return nil if user.nil?
  #   return user if user.has_password?(submitted_password)
  #
  # end
  #
  # private
  # def encrypt_password
  #   #generate a unique salt if its a NEW user
  #   #take the current time and whatever the passed password, store that into the salt field
  #   self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?
  #
  #   #encrypt the password and STORE that in the password field in the AGENT model
  #   #encrypt function is define below
  #   self.password = encrypt(password)
  # end
  #
  # #encrypt the password using both SALT and the PASSED password
  # #even if they know your password,
  # #if they dont have the salt, then the self.password up there   will be a unique string/variable
  # def encrypt(pass)
  #   Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
  # end

end
