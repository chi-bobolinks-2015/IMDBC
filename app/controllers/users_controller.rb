class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user.critic ||  user_signed_in?
      @user
    else
      @error = "You must be logged in to view a users profile"
    end
  end

end
