class Team < ActiveRecord::Base
  belongs_to :hackathon
  belongs_to :admin
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :skills, through: :users

  # Matching algorithm 2.0
  def self.for(hackathon)
    @users = hackathon.users
    @max_team_members = hackathon.max_team_size
    @skills = Skill.all
    create_team_array
    group_skills
    assign_teams
  end

  def self.group_skills
    @skills_hash = {}

    @skills.each do |skill|
      @skills_hash[skill.name] = @users.select {|a| a.skills.include? skill}
    end
  end

  def self.assign_teams
    # iterate through skill hash
    # iterate through users in skill
    # iterate through teams
    # if user hasn't been assigned yet, add to team
    # next user starts with next team in array. so reorder team_array so next team is first team

    @skills_hash.each do |skill, users|
      users.each do |user|
        @team_array.each do |team|
          user_not_assigned = !@team_array.any? {|a| a.include?(user)}
          if user_not_assigned && team.length < @max_team_members
            team << user
            @team_array.rotate!
          end
        end
      end
    end

    @team_array
  end

  def self.create_team_array
    @team_array = []
    # Add custom max team members when added as attribute, hard-coded for now
    if @users.count % @max_team_members == 0
      max_num_teams = @users.count/@max_team_members
    else
      max_num_teams = @users.count/@max_team_members + 1
    end
    max_num_teams.times do |i|
      @team_array << Array.new
    end
    @team_array
  end

end


#   # Matching algorithm 1.0
#   def self.for(hackathon)
#     @hackathon = hackathon
#     create_team_array
#     assign_teams
#     assign_remainder_users
#     check_team_size
#   end
#
#   def self.create_team_array
#     @team_array = []
#     # Add custom max team members when added as attribute, hard-coded for now
#     @max_team_members = 4
#     if @hackathon.users.count % @max_team_members == 0
#       max_num_teams = @hackathon.users.count/@max_team_members
#     else
#       max_num_teams = @hackathon.users.count/@max_team_members + 1
#     end
#     max_num_teams.times do |i|
#       @team_array << Array.new
#     end
#     @team_array
#   end
#
#   def self.assign_teams
#     @remainder_users = []
#     @hackathon.users.each do |p|
#       @team_array.each do |t|
#         user_not_assigned = !@team_array.any? {|a| a.include?(p)}
#         binding.pry
#         skill_not_in_team = !t.any? {|x| x.skills.include?(p.skills)}
#         binding.pry
#         if skill_not_in_team && user_not_assigned && t.length < 4
#           t << p
#           binding.pry
#         end
#       end
#       if !@team_array.any? {|a| a.include?(p)}
#         @remainder_users << p
#       end
#     end
#     @team_array
#   end
#
#
#   def self.assign_remainder_users
#     @remainder_users.each do |p|
#       @team_array.each do |t|
#         if t.count < @max_team_members && !@team_array.any? {|a| a.include?(p)}
#           t << p
#         end
#       end
#     end
#     @team_array
#   end
#
#   def self.check_team_size
#     smallest_team = @team_array.inject { |memo, team| memo.count < team.count ? memo : team }
#     largest_team = @team_array.inject { |memo, team| memo.count > team.count ? memo : team }
#     team_size_diff = largest_team.count - smallest_team.count
#     @skills = ["Back End", "UX/Marketing", "Designer", "Front End"]
#     missing_skills = []
#     @skills.each do |skill|
#       if !smallest_team.any? {|a| a[:skills] == skill}
#         missing_skills << skill
#       end
#     end
#
#     # @team_array.each do |t|
#     #   if t.size == largest_team.size
#     #   end
#     # end
#
#     if team_size_diff > 1
#       (team_size_diff - 1).times do |i|
#         # Should only add users to smallest team that:
#         # a) are from a team that have multiple of that skill
#         # b) contain a skill that's missing from smallest team
#         smallest_team.push largest_team.pop
#       end
#       @team_array
#     else
#       @team_array
#     end
#   end
# end
