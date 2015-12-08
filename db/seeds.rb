User.delete_all
Movie.delete_all
Review.delete_all
Comment.delete_all

critics = 25.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email    => Faker::Internet.email,
                :password   => 'password',
                :critic => true,
                :confirmed_at => Time.now )
end

users = 25.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email    => Faker::Internet.email,
                :password   => 'password',
                :critic => false,
                :confirmed_at => Time.now )
end

movies = [ {:title => "In the Heart of the Sea",
                :synopsis => "Based on the 1820 event, a whaling ship is preyed upon by a sperm whale, stranding its crew at sea for 90 days, thousands of miles from home.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

            {:title => "Legend",
                :synopsis => "The film tells the story of the identical twin gangsters Reggie and Ronnie Kray, two of the most notorious criminals in British history, and their organised crime empire in the East End of London during the 1960s.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

            {:title => "The Big Short",
                :synopsis => "Four outsiders in the world of high-finance who predicted the credit and housing bubble collapse of the mid-2000s decide to take on the big banks for their lack of foresight and greed.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "The Lady in the Van",
                :synopsis => "A man forms an unexpected bond with a transient woman living in her car that's parked in his driveway.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

            {:title => "Don Verdean",
                :synopsis => "A self-professed biblical archaeologist who has fallen on hard times starts to bend the truth in order to continue inspiring the faithful. ",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

            {:title => "The Boy and the World",
                :synopsis => "A little boy goes on an adventurous quest in search of his father.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

            {:title => "The Hunger Games: Mockingjay - Part 2",
                :synopsis => "As the war of Panem escalates to the destruction of other districts by the Capitol, Katniss Everdeen, the reluctant leader of the rebellion, must bring together an army against President Snow, while all she holds dear hangs in the balance.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

            {:title => "Krampus",
                :synopsis => "A boy who has a bad Christmas ends up accidentally summoning a Christmas demon to his family home.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "Creed",
                :synopsis => "The former World Heavyweight Champion Rocky Balboa serves as a trainer and mentor to Adonis Johnson, the son of his late friend and former rival Apollo Creed.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "The Good Dinosaur",
                :synopsis => "An epic journey into the world of dinosaurs where an Apatosaurus named Arlo makes an unlikely human friend.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "Spectre",
                :synopsis => "A cryptic message from Bond's past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "The Night Before",
                :synopsis => "On Christmas eve, three lifelong friends, two of whom are Jewish, spend the night in New York City looking for the Holy Grail of Christmas parties.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "The Penuts Movie",
                :synopsis => "Snoopy embarks upon his greatest mission as he and his team take to the skies to pursue their arch-nemesis, while his best pal Charlie Brown begins his own epic quest back home.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "Spotlight",
                :synopsis => "The true story of how the Boston Globe uncovered the massive scandal of child molestation and cover-up within the local Catholic Archdiocese, shaking the entire Catholic Church to its core.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "Brooklyn",
                :synopsis => "An Irish immigrant lands in 1950s Brooklyn, where she quickly falls into a new romance. When her past catches up with her, however, she must choose between two countries and the lives that exist within.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},

           {:title => "Secret in Their Eyes",
                :synopsis => "A tight-knit team of rising investigators, along with their supervisor, is suddenly torn apart when they discover that one of their own teenage daughters has been brutally murdered.",
                :release_date => Faker::Date.between(600.days.ago, Date.today)},
              ]

Movie.create!(movies)

# movies = 50.times.map do
#   Movie.create!(:title => Faker::App.name,
#                 :synopsis => Faker::Lorem.paragraph(2, true),
#                 :release_date => Faker::Date.between(600.days.ago, Date.today) )

# end

critic_reviews = 100.times.map do
  Review.create!( :title => Faker::Lorem.sentence,
                  :content => Faker::Lorem.paragraph(2, true),
                  movie: Movie.all.sample,
                  user: critics.sample,
                  :movie_rating => rand(1..5) )
end

user_reviews = 100.times.map do
  Review.create!( :title => Faker::Lorem.sentence,
                  :content => Faker::Lorem.paragraph(2, true),
                  movie: Movie.all.sample,
                  user: users.sample,
                  :movie_rating => rand(1..5) )
end

comments_on_critic_reviews = 400.times.map do
  Comment.create!(:content => Faker::Lorem.sentence,
                  user: users.sample,
                  review: critic_reviews.sample)
end

comments_on_user_reviews = 400.times.map do
  Comment.create!(:content => Faker::Lorem.sentence,
                  user: users.sample,
                  review: user_reviews.sample)
end
