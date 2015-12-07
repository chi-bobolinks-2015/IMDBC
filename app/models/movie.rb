class Movie < ActiveRecord::Base
# has_many :reviews
# has_many :critics, through: :reviews, foreign_key: :critic_id
has_many :movie_ratings, through: :reviews

def average_rating
  self.class.average(:movie_ratings).where(:title == self.title)
end

end
