class Team < ActiveRecord::Base
  has_many :user_teams
  belongs_to :hackathon
  has_many :users, through: :user_teams
  has_many :skills, through: :users

  # Addition for MVP model
  has_many :participants

  # Matching algorithm (WIP!)
  def self.for(hackathon)
    @hackathon = hackathon
    @team_array = create_team_array
    assign_teams
    assign_remainder_participants
    check_team_size
  end

  def self.assign_teams
    @remainder_participants = []
    @hackathon.participants.each do |p|
      @team_array.each do |t|
        participant_not_assigned = !@team_array.any? {|a| a.include?(p)}
        skill_not_in_team = !t.any? {|x| x.attributes["skills"].include?(p[:skills])}
        if skill_not_in_team && participant_not_assigned && t.length < 4
          t << p
        end
      end
      if !@team_array.any? {|a| a.include?(p)}
        @remainder_participants << p
      end
    end
    @team_array
  end

  def self.create_team_array
    @team_array = []
    # Add custom max team members when added as attribute, hard-coded for now
    @max_team_members = 4
    if @hackathon.participants.count % @max_team_members == 0
      max_num_teams = @hackathon.participants.count/@max_team_members
    else
      max_num_teams = @hackathon.participants.count/@max_team_members + 1
    end
    max_num_teams.times do |i|
      @team_array << Array.new
    end
    binding.pry
    @team_array
  end

  def self.assign_remainder_participants
    @remainder_participants.each do |p|
      @team_array.each do |t|
        if t.count < @max_team_members && !@team_array.any? {|a| a.include?(p)}
          t << p
        end
      end
    end
    binding.pry
    @team_array
    # check_team_size
  end

  def self.check_team_size
    smallest_team = @team_array.inject { |memo, team| memo.count < team.count ? memo : team }
    largest_team = @team_array.inject { |memo, team| memo.count > team.count ? memo : team }
    team_size_diff = largest_team.count - smallest_team.count
    @skills = ["Back End", "UX/Marketing", "Designer", "Front End"]
    missing_skills = []
    @skills.each do |skill|
      binding.pry
      if !smallest_team.any? {|a| a[:skills] == skill}
        missing_skills << skill
      end
    end

    @team_array.each do |t|
      if t.size == largest_team.size
    end

    if team_size_diff > 1
      (team_size_diff - 1).times do |i|
        # Should only add participants to smallest team that:
        # a) are from a team that have multiple of that skill
        # b) contain a skill that's missing from smallest team
        smallest_team.push largest_team.pop
        binding.pry
      end
      @team_array
    else
      @team_array
    end
  end

end
