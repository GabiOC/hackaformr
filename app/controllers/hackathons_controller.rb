class HackathonsController < ApplicationController

  def new
  end

  def create
    @hackathon = Hackathon.create(name: params["name"], start_date: params["start_date"])
    current_user.hackathons << @hackathon
    redirect_to hackathons_path
  end

  def show
    @hackathon = Hackathon.find_by_id(params[:id])
  end

  def index
    @hackathons = current_user.hackathons
  end

  def destroy
    deleted_hackathon = Hackathon.find_by_id(params[:id]).destroy
    flash[:success] = "#{deleted_hackathon.name} has been deleted."
    redirect_to hackathons_path
  end

end
