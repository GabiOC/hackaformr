class TeamsController < ApplicationController
 skip_before_filter :verify_authenticity_token
  def show
  end

  def create
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @teams = Team.for(@hackathon)
    # remove previous teams in case teams generated multiple times
    @hackathon.teams = []
    @teams.each do |user_array|
      team_object = Team.create
      @hackathon.teams << team_object
      user_array.each do |u|
        u.teams << team_object
        UserNotifier.send_signup_email(u).deliver
      end
    end
    session[:hackathon_id] = @hackathon.id
    redirect_to hackathon_teams_path(@hackathon.id)
  end

  def index
  end
end
