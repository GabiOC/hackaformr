class Participant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :hackathon
  belongs_to :team
  belongs_to :user
  has_many :participant_skills
  belongs_to :skill
end
