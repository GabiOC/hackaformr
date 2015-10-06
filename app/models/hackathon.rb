class Hackathon < ActiveRecord::Base
  has_many :teams
  belongs_to :admin

  has_many :user_hackathons
  has_many :users, through: :user_hackathons
end
