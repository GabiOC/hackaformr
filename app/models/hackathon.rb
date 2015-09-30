class Hackathon < ActiveRecord::Base
  has_many :user_hackathons
  has_many :teams
  has_many :users, through: :user_hackathons

  # Addition for MVP
  has_many :participants
end
