class TeamsController < ApplicationController

  def show
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @teams = Team.for(@hackathon)
  end

  def create
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @teams = Team.for(@hackathon)
    @teams.each do |t|
      Team.create
      t.each do |p|
        t = Team.last
        p.team = t
        UserNotifier.send_signup_email(p).deliver
      end
    end
    render "teams/index"
  end
end
