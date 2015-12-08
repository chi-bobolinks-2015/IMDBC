class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  # has_many :comments

  # def self.critic_ratings(movie)
  # end
  #
  # def self.user_ratings(movie)
  # end
  #
  # def self.critic_reviews(movie)
  # end
  #
  # def self.user_reviews(movie)
  # end

end
