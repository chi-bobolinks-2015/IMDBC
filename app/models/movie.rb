class Movie < ActiveRecord::Base
has_many :reviews
has_many :reviewers, through: :reviews, source: :user

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def critic_reviews
    self.reviews.where(movie_id: self.id, :user_id => User.all.where(critic: true))
  end

  def user_reviews
    self.reviews.where(movie_id: self.id, :user_id => User.all.where(critic: false))
  end

  def average_critic_rating
    x = critic_reviews.reduce(0){|sum, review| sum += review.movie_rating.to_f}
    x / critic_reviews.length
  end

  def average_user_rating
    x = user_reviews.reduce(0){|sum, review| sum += review.movie_rating.to_f}
    x / user_reviews.length
  end

end
