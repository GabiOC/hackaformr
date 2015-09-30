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
        if !t.include?(p[:skills]) && !@team_array.any? {|a| a.include?(p)} && t.length < 4
          t << p
        end
      end
    end
  end

end
