class Movie < ActiveRecord::Base
has_many :reviews
has_many :reviewers, through: :reviews, source: :user

  # def users_average_rating(array)
  #   array.average()
  # end
  #
  # def critics_average_rating(array)
  #   array.average
  # end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
