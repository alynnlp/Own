class Agent < ApplicationRecord
  has_many :messages
  has_many :reviews
  has_many :responses

  has_many :messaged_users, through: :messages, source: :user
  has_many :reviewed_users, through: :reviews, source: :user
  has_many :responsed_user, through: :responses, source: :user

  attr_accessor :name, :email, :password

  attr_accessor :password
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :presence => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :presence => true
  validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end


end
