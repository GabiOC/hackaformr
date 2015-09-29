class Team < ActiveRecord::Base
  has_many :user_teams
  belongs_to :hackathon
  has_many :users, through: :user_teams
  has_many :skills, through: :users
end
