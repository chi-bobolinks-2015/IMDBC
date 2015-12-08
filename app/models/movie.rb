class Movie < ActiveRecord::Base
has_many :reviews
has_many :users, through: :reviews

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
