class ParticipantsController < ApplicationController

  def show
  end

  def create
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @participant = Participant.create(name: params["name"], email: params["email"], skills: params["skills"])
    @hackathon.participants << @participant
    redirect_to hackathon_path(@hackathon.id)
  end

  def new
  end

end
