class User < ActiveRecord::Base
  has_many :reviews
  has_many :reviewed_movies, through: :reviews, source: :movie

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  ratyrate_rater
end
