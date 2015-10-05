class TeamsController < ApplicationController

  def show
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @teams = Team.for(@hackathon)
  end

  def create
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @teams = Team.for(@hackathon)
    @teams.each do |t|
      binding.pry
      Team.create
      binding.pry
      t.each do |p|
        t = Team.last
        p.team = t
        binding.pry
      end
    end
  end
end
