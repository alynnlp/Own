class User < ApplicationRecord
  has_many :messages
  has_many :reviews
  has_many :responses

  has_many :agent_messages, through: :messages, source: :agent
  has_many :agent_reviews, through: :reviews, source: :agent
  has_many :agent_response, through:  :reviews, source: :agent
end
