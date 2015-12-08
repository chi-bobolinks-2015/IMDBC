class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  # before_action :check_admin, except: [:show]
  # before_action :check_critic, except: [:show, :destroy]

  # def index
  #   @reviews = Review.all
  # end

  def show
    puts params[:id]
    @comments = Comment.where(review_id: params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build

  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)
    # @review.movie_id
    # p "****************************"
    # p review_params
    # # p params
    # @movie = Movie.find(@review.movie_id)
    if @review.valid?
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
    # if review created_at date within 72 hours this link works else show error page explaination
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: "review updated!"
    else
      render 'edit'
    end
  end


  def destroy
    @review.destroy
    redirect_to movie_reviews_path
  end


  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :movie_rating)
  end
end
