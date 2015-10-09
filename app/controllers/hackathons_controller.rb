class HackathonsController < ApplicationController

  def new
  end

  def create
    latitude = Geocoder.coordinates(params["location"]).first
    longitude = Geocoder.coordinates(params["location"]).last
    @hackathon = Hackathon.create(name: params["name"], start_date: params["start_date"], end_date: params["end_date"], description: params["description"], max_team_size: params["max_team_size"], location: params["location"], latitude: latitude, longitude: longitude)
    current_admin.hackathons << @hackathon
    redirect_to hackathons_path
  end

  def show
    @hackathon = Hackathon.find_by_id(params[:id])
    @hash = Gmaps4rails.build_markers(@hackathon) do |hackathon, marker|
      marker.lat hackathon.latitude
      marker.lng hackathon.longitude
    end
end


  def index
    if current_admin
      @hackathons = current_admin.hackathons
    else
      @hackathons = current_user.hackathons
    end
  end

  def destroy
    @hackathon = Hackathon.find_by_id(params[:id]).destroy
    flash[:success] = "#{@hackathon.name} has been deleted."
    redirect_to hackathons_path
  end

  def edit
    @hackathon = Hackathon.find_by_id(params[:id])
  end

  def update
     @hackathon = Hackathon.find(params[:id])
     if @hackathon.update_attributes(hackathon_params)
       flash[:success] = "#{@hackathon.name} has been updated!"
       redirect_to hackathons_path
     else
       render 'edit'
     end
   end

  private

  def hackathon_params
    params.require(:hackathon).permit(:name, :start_date, :end_date, :location, :max_team_size, :description)
  end
end
