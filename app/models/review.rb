class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  # has_many :comments

  # def self.critic_ratings(movie)
  # Review.all.where(movie_id: movie.id)
  #  (get all non critic/admin users)
  # end
  #
  # def self.user_ratings(movie)
  #  (get all critics)
  # end
  #
  # def self.critic_reviews(movie)
  # end
  #
  # def self.user_reviews(movie)
  # end

end
