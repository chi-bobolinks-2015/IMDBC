class UsersController < ApplicationController

  def index
    @critics = User.where(critic: true)
    @users = User.where(critic: false)
  end

  def show
    @comments = Comment.where(user_id: params[:id])
    @reviews = Review.where(user_id: params[:id])
    @user = User.find(params[:id])
    if @user.critic ||  user_signed_in?
      @user
    else
      @error = "You must be logged in to view a user profile"
    end
  end

end
