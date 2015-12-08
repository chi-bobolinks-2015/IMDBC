User.delete_all
Movie.delete_all
# Review.delete_all
# Comment.delete_all

critics = 25.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email    => Faker::Internet.email,
                :password   => 'password',
                # :critic => true,
                :confirmed_at => Time.now )
end

users = 25.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email    => Faker::Internet.email,
                :password   => 'password',
                # :critic => false,
                :confirmed_at => Time.now )
end

movies = 50.times.map do
  Movie.create!(:title => Faker::App.name,
                :synopsis => Faker::Lorem.paragraph(2, true),
                :release_date => Faker::Date.between(600.days.ago, Date.today) )

end

# critic_reviews = 100.times.map do
#   Review.create!( :title => Faker::Lorem.sentence,
#                   :content => Faker::Lorem.paragraph(2, true),
#                   movie: movies.sample,
#                   user: critics.sample,
#                   :movie_rating => { rand(1..5) })
# end

# user_reviews = 100.times.map do
#   Review.create!( :title => Faker::Lorem.sentence,
#                   :content => Faker::Lorem.paragraph(2, true),
#                   movie: movies.sample,
#                   user: users.sample,
#                   :movie_rating => { rand(1..5) })
# end

# comments_on_critic_reviews = 200.times.map do
#   Comment.create!(:content => Faker::Lorem.sentence,
#                   user: users.sample,
#                   review: critic_reviews.sample)
# end

# comments_on_user_reviews = 200.times.map do
#   Comment.create!(:content => Faker::Lorem.sentence,
#                   user: users.sample,
#                   review: user_reviews.sample)
# end
