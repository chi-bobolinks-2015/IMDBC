class Movie < ActiveRecord::Base
has_many :reviews
has_many :users, through: :reviews
# has_many :movie_ratings, through: :reviews

  # def users_average_rating
  #   self.class.average(:movie_ratings).where(:user_id in (get all non critic/admin users)
  # end
  #
  # def critics_average_rating
  #   self.class.average(:movie_ratings).where(:user_id in (get all critics)
  # end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
