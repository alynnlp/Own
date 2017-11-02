class Agent < ApplicationRecord
  has_many :messages
  has_many :reviews
  has_many :responses

  has_many :messaged_users, through: :messages, source: :user
  has_many :reviewed_users, through: :reviews, source: :user
  has_many :responsed_user, through: :responses, source: :user
end
