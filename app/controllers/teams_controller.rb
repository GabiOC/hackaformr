class TeamsController < ApplicationController

  def show
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @teams = Team.for(@hackathon)
  end

  def create
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @teams = Team.for(@hackathon)
    @teams.each do |t|
      t.create
      t.each do |p|
        p.team = t
      end
    end
  end
end
