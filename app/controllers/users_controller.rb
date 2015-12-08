class UsersController < ApplicationController

  def index
    @critics = User.where(critic: true)
    @users = User.where(critic: false)
    # Add statement to account for new users, where critic: nil
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
