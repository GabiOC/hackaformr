class Team < ActiveRecord::Base
  has_many :user_teams
  belongs_to :hackathon
  has_many :users, through: :user_teams
  has_many :skills, through: :users

  # Addition for MVP model
  has_many :participants

  # Matching algorithm (WIP!)
  def self.for(hackathon)
    @team_array = [[], []]

    hackathon.participants.each do |p|
      @team_array.each do |t|
        binding.pry
        participant_not_assigned = !@team_array.any? {|a| a.include?(p)}
        skill_not_in_team = !t.any? {|x| x.attributes["skills"].include?(p[:skills])}
        
        if skill_not_in_team && participant_not_assigned && t.length < 4
          t << p
        end
      end
    end
  end

end
