class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  # def show
  # end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
