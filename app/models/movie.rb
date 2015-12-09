class Movie < ActiveRecord::Base
has_many :reviews
has_many :reviewers, through: :reviews, source: :user

ratyrate_rateable "overall"

  def self.search(query)
    where("lower(title) like ?", "%#{query.downcase}%")
  end

  def critic_reviews
    self.reviews.where(movie_id: self.id, :user_id => User.all.where(critic: true))
  end

  def user_reviews
    self.reviews.where(movie_id: self.id, :user_id => User.all.where(critic: false))
  end

  def average_ratingz(boolean) #(boolean for critic true || false)
    ratings_array = Rate.all.where(:rateable_id => self.id, :rater_id => User.all.where(critic: boolean))
      .map(&:stars)
      .map(&:to_f)

    x = ratings_array.reduce(:+)

    average = x / ratings_array.length
    average.round(2) ? average.round(2) : 0
   # avg = x ? x.avg : 0
   # avg.round(1)
  end

  def return_rating_for_review(critic)
    rating = Rate.all.where(:rateable_id => self.id, :rater_id => critic.id)[0]
    rating.stars
  end

end
