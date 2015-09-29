class UserHackathon < ActiveRecord::Base
  belongs_to :hackathon
  belongs_to :user
end
