class Skill < ActiveRecord::Base
  has_many :user_skills
  has_many :users, through: :user_skills

  # Addition for MVP
  has_many :participant_skills
  has_many :participants
end
