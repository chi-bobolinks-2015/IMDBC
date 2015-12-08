class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user = User.find(params[:id])
    else
      @error = "You must be logged in to view a users profile"
    end
  end

end
