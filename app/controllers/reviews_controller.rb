class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  # before_action :check_admin, except: [:show]
  # before_action :check_critic, except: [:show, :destroy]

  # def index
  #   @reviews = Review.all
  # end

  # def show
  # end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)

    if @review.valid?
      redirect_to review_path(@review)
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
    redirect_to reviews_path
  end


  private

  def set_review
    @review = review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :synopsis, :release_date)
  end
end
