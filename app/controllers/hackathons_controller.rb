class HackathonsController < ApplicationController

  def new

  end

  def create
    @hackathon = Hackathon.create(name: params["name"], start_date: params["start_date"])
    current_user.hackathons << @hackathon
    binding.pry
    redirect_to hackathons_path
  end

  def show
  end

  def index
    @hackathons = current_user.hackathons
  end

  def destroy
    binding.pry
    deleted_hackathon = Hackathon.find_by_id(params[:id]).destroy
    flash[:success] = "#{deleted_hackathon.name} has been deleted."
    redirect_to hackathons_path
  end

end
