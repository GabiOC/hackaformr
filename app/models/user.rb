class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_hackathons
  has_many :hackathons, through: :user_hackathons
  has_many :admins, through: :hackathons
  has_many :teams, through: :user_teams
  # has_many :participant_skills
  belongs_to :skill
end
