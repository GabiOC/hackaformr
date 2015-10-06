class UsersController < ApplicationController

  def show
    binding.pry
  end

  def create
    # @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    # @user = User.create(name: params["name"], email: params["email"], skills: params["skills"])
    # @hackathon.users << @user
    # redirect_to hackathon_path(@hackathon.id)
  end

  def new
  end

  def add_hackathon
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @hackathon.users << current_user
    binding.pry
    flash[:success] = "You've successfully signed up for this hackathon."
    redirect_to hackathon_path(@hackathon.id)
  end

  def remove_hackathon
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @hackathon.users.delete(current_user)
    flash[:success] = "You're no longer signed up for this hackathon."
    redirect_to hackathon_path(@hackathon.id)
  end

  def destroy
  end

end
