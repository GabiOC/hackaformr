class User < ActiveRecord::Base
  has_many :teams
  has_many :hackathons, through: :teams
  has_many :skills
end
