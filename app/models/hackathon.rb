class Hackathon < ActiveRecord::Base
  has_many :teams
  belongs_to :admin

  has_many :user_hackathons
  has_many :users, through: :user_hackathons
  #
  geocoded_by :location
  after_validation :geocode  # auto-fetch address
end
