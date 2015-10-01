class TeamsController < ApplicationController

  def show
  end

  def create
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])

  end

end
