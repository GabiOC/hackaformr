class TeamsController < ApplicationController

  def create
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @teams = Team.for(@hackathon)
  end

end
