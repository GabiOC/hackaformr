class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_teams
  has_many :user_hackathons
  has_many :user_skills

  has_many :teams, through: :user_teams
  has_many :hackathons, through: :user_hackathons
  has_many :skills, through: :user_skills

  # Addition for MVP
  has_many :participants
end
