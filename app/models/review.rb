class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  # has_many :comments

  # def self.critic_ratings(movie)
  #   Review.all.where(movie_id: movie.id, :user_id => User.all.where(critic: true))
  # end

  # def self.user_ratings(movie)
  #   Review.all.where(movie_id: movie.id, :user_id => User.all.where(critic: false)
  # end

  # def self.critic_reviews(movie)
  #   Review.all.where(movie_id: movie.id, :user_id => User.all.where(critic: true))
  # end
  # #
  # def self.user_reviews(movie)
  #   Review.all.where(movie_id: movie.id, :user_id => User.all.where(critic: false))
  # end

end
