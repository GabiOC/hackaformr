class Team < ActiveRecord::Base
  belongs_to :hackathon
  belongs_to :admin
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :skills, through: :users

  # Matching algorithm (WIP!)
  def self.for(hackathon)
    @hackathon = hackathon
    create_team_array
    assign_teams
    assign_remainder_users
    check_team_size
  end

  def self.create_team_array
    @team_array = []
    # Add custom max team members when added as attribute, hard-coded for now
    @max_team_members = 4
    if @hackathon.users.count % @max_team_members == 0
      max_num_teams = @hackathon.users.count/@max_team_members
    else
      max_num_teams = @hackathon.users.count/@max_team_members + 1
    end
    max_num_teams.times do |i|
      @team_array << Array.new
    end
    @team_array
  end

  def self.assign_teams
    @remainder_users = []
    @hackathon.users.each do |p|
      @team_array.each do |t|
        user_not_assigned = !@team_array.any? {|a| a.include?(p)}
        skill_not_in_team = !t.any? {|x| x.attributes["skills"].include?(p[:skills])}

        if skill_not_in_team && user_not_assigned && t.length < 4
          t << p
        end
      end
      if !@team_array.any? {|a| a.include?(p)}
        @remainder_users << p
      end
    end
    @team_array
  end


  def self.assign_remainder_users
    @remainder_users.each do |p|
      @team_array.each do |t|
        if t.count < @max_team_members && !@team_array.any? {|a| a.include?(p)}
          t << p
        end
      end
    end
    @team_array
  end

  def self.check_team_size
    smallest_team = @team_array.inject { |memo, team| memo.count < team.count ? memo : team }
    largest_team = @team_array.inject { |memo, team| memo.count > team.count ? memo : team }
    team_size_diff = largest_team.count - smallest_team.count
    @skills = ["Back End", "UX/Marketing", "Designer", "Front End"]
    missing_skills = []
    @skills.each do |skill|
      if !smallest_team.any? {|a| a[:skills] == skill}
        missing_skills << skill
      end
    end

    # @team_array.each do |t|
    #   if t.size == largest_team.size
    #   end
    # end

    if team_size_diff > 1
      (team_size_diff - 1).times do |i|
        # Should only add users to smallest team that:
        # a) are from a team that have multiple of that skill
        # b) contain a skill that's missing from smallest team
        smallest_team.push largest_team.pop
      end
      @team_array
    else
      @team_array
    end
  end
end
#
#   # New permutation of algorithm
#   def self.for(hackathon)
#     @users = hackathon.users
#     @skills = ["Back End", "Front End", "UX/Marketing", "Designer"]
#     create_team_array
#     group_skills
#     assign_teams
#     assign_remainder_users
#     check_team_size
#   end
#
#   def self.group_skills
#     @skills_hash = {}
#
#     @skills.each do |skill|
#       @skills_hash[skill] = @users.select {|a| a[:skills] == skill}
#     end
#   end
#
#   def self.assign_teams
#     @team_array.each do |team|
#       @skills_hash.each_with_index do |(skill, users), index|
#         user_not_assigned = !@team_array.any? {|a| a.include?(users[index])}
#         if user_not_assigned && team.length < 4
#           binding.pry
#           team << users[index]
#         end
#       end
#     end
#     @team_array
#   end
#
#   def self.create_team_array
#     @team_array = []
#     # Add custom max team members when added as attribute, hard-coded for now
#     @max_team_members = 4
#     if @users.count % @max_team_members == 0
#       max_num_teams = @users.count/@max_team_members
#     else
#       max_num_teams = @users.count/@max_team_members + 1
#     end
#     max_num_teams.times do |i|
#       @team_array << Array.new
#     end
#     binding.pry
#     @team_array
#   end
#
#   def self.assign_remainder_users
#     @remainder_users.each do |p|
#       @team_array.each do |t|
#         if t.count < @max_team_members && !@team_array.any? {|a| a.include?(p)}
#           t << p
#         end
#       end
#     end
#     binding.pry
#     @team_array
#     # check_team_size
#   end
#
#   def self.check_team_size
#     smallest_team = @team_array.inject { |memo, team| memo.count < team.count ? memo : team }
#     largest_team = @team_array.inject { |memo, team| memo.count > team.count ? memo : team }
#     team_size_diff = largest_team.count - smallest_team.count
#     @skills = ["Back End", "UX/Marketing", "Designer", "Front End"]
#     missing_skills = []
#     @skills.each do |skill|
#       binding.pry
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
#         binding.pry
#       end
#       @team_array
#     else
#       @team_array
#     end
#   end
#
# end
