class HackathonsController < ApplicationController

  def new
  end

  def create
    @hackathon = Hackathon.create(name: params["name"], start_date: params["start_date"], end_date: params["end_date"], description: params["description"], max_team_size: params["max_team_size"], location: params["location"])
    current_admin.hackathons << @hackathon
    redirect_to hackathons_path
  end

  def show
    @hackathon = Hackathon.find_by_id(params[:id])
  end

  def index
    if current_admin
      @hackathons = current_admin.hackathons
    else
      @hackathons = current_user.hackathons
    end
  end

  def destroy
    deleted_hackathon = Hackathon.find_by_id(params[:id]).destroy
    flash[:success] = "#{deleted_hackathon.name} has been deleted."
    redirect_to hackathons_path
  end

  def edit
    @hackathon = Hackathon.find_by_id(params[:id])
  end

end
