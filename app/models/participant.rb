class Participant < ActiveRecord::Base
  belongs_to :hackathon
  belongs_to :team
  belongs_to :user
  has_many :participant_skills
  belongs_to :skill
end
