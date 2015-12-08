class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  # before_action :check_admin, except: [:index, :show]

  def index
    if params[:search]
      @movies = Movie.search(params[:search]).order(release_date: :desc)
    else
      @movies = Movie.order(release_date: :desc)
    end
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)

    if @movie.valid?
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  # def edit
  # end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie updated!"
    else
      render 'edit'
    end
  end


  def destroy
    @movie.destroy
    redirect_to movies_path
  end


  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :synopsis, :release_date)
  end
end
