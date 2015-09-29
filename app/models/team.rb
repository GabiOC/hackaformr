class Team < ActiveRecord::Base
  belongs_to :hackathon
  has_many :users
  has_many :skills, through: :users
end
