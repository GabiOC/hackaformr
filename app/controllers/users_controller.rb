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
  
  def create
      # Create the user from params
      @user = User.new(params[:user])
      if @user.save
        # Deliver the signup email
        UserNotifier.send_signup_email(@user).deliver
        redirect_to(@user, :notice => 'User created')
      else
        render :action => 'new'
      end
    end

  def add_hackathon
    @hackathon = Hackathon.find_by_id(params["hackathon_id"])
    @hackathon.users << current_user
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
