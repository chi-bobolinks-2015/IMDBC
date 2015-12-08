module ApplicationHelper

   def critic_reviews(movie)
    Review.all.where(movie_id: movie.id, :user_id => User.all.where(critic: true))
  end

  def user_reviews(movie)
    Review.all.where(movie_id: movie.id, :user_id => User.all.where(critic: false))
  end

end
