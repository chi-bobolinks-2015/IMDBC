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
                :release_date => DateTime.new(2015, 12, 11)},

            {:title => "Legend",
                :synopsis => "The film tells the story of the identical twin gangsters Reggie and Ronnie Kray, two of the most notorious criminals in British history, and their organised crime empire in the East End of London during the 1960s.",
                :release_date => DateTime.new(2015, 11, 20)},

            {:title => "The Big Short",
                :synopsis => "Four outsiders in the world of high-finance who predicted the credit and housing bubble collapse of the mid-2000s decide to take on the big banks for their lack of foresight and greed.",
                :release_date => DateTime.new(2015, 12, 23)},

           {:title => "The Lady in the Van",
                :synopsis => "A man forms an unexpected bond with a transient woman living in her car that's parked in his driveway.",
                :release_date => DateTime.new(2016, 01, 16)},

            {:title => "Don Verdean",
                :synopsis => "A self-professed biblical archaeologist who has fallen on hard times starts to bend the truth in order to continue inspiring the faithful. ",
                :release_date => DateTime.new(2015, 12, 11)},

            {:title => "The Boy and the World",
                :synopsis => "A little boy goes on an adventurous quest in search of his father.",
                :release_date => DateTime.new(2015, 12, 11)},

            {:title => "The Hunger Games: Mockingjay - Part 2",
                :synopsis => "As the war of Panem escalates to the destruction of other districts by the Capitol, Katniss Everdeen, the reluctant leader of the rebellion, must bring together an army against President Snow, while all she holds dear hangs in the balance.",
                :release_date => DateTime.new(2015, 11, 20)},

            {:title => "Krampus",
                :synopsis => "A boy who has a bad Christmas ends up accidentally summoning a Christmas demon to his family home.",
                :release_date => DateTime.new(2015, 12, 05)},

           {:title => "Creed",
                :synopsis => "The former World Heavyweight Champion Rocky Balboa serves as a trainer and mentor to Adonis Johnson, the son of his late friend and former rival Apollo Creed.",
                :release_date => DateTime.new(2015, 11, 25)},

           {:title => "The Good Dinosaur",
                :synopsis => "An epic journey into the world of dinosaurs where an Apatosaurus named Arlo makes an unlikely human friend.",
                :release_date => DateTime.new(2015, 11, 25)},

           {:title => "Spectre",
                :synopsis => "A cryptic message from Bond's past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.",
                :release_date => DateTime.new(2015, 11, 06)},

           {:title => "The Night Before",
                :synopsis => "On Christmas eve, three lifelong friends, two of whom are Jewish, spend the night in New York City looking for the Holy Grail of Christmas parties.",
                :release_date => DateTime.new(2015, 11, 20)},

           {:title => "The Peanuts Movie",
                :synopsis => "Snoopy embarks upon his greatest mission as he and his team take to the skies to pursue their arch-nemesis, while his best pal Charlie Brown begins his own epic quest back home.",
                :release_date => DateTime.new(2015, 11, 06)},

           {:title => "Spotlight",
                :synopsis => "The true story of how the Boston Globe uncovered the massive scandal of child molestation and cover-up within the local Catholic Archdiocese, shaking the entire Catholic Church to its core.",
                :release_date => DateTime.new(2015, 11, 25)},

           {:title => "Brooklyn",
                :synopsis => "An Irish immigrant lands in 1950s Brooklyn, where she quickly falls into a new romance. When her past catches up with her, however, she must choose between two countries and the lives that exist within.",
                :release_date => DateTime.new(2015, 11, 06)},

           {:title => "Secret in Their Eyes",
                :synopsis => "A tight-knit team of rising investigators, along with their supervisor, is suddenly torn apart when they discover that one of their own teenage daughters has been brutally murdered.",
                :release_date => DateTime.new(2015, 11, 20)},

           {:title => "Where the Wild Things Are",
                :synopsis => "Max (Max Records) is a young boy who feels misunderstood and wants to have fun all the time. He makes an igloo out of snow, but his sister's friends gang up on him and smash it. After making a scene in front of his mother's boyfriend, Max bites his mother and runs away. He keeps running until he stumbles upon a small boat; he climbs aboard and sets sail. After a few days at sea, he reaches the dangerous, rocky shore of a strange island at night. He leaves the boat on shore and walks toward voices he hears in the woods. Max eavesdrops on a few creatures arguing. One of them, Carol (voice: James Gandolfini), is destroying the huts and screaming. The other wild things are yelling at him, telling him to stop. Max runs out of the trees and joins Carol in destroying the huts. The wild things are angry about this and want to eat him. But Max tells them that he was the king where he came from, and he has \"special powers,\" so the wild things can't eat him. Carol crowns him king of the wild things and the island. Max's first order of business is to \"let the wild rumpus start!\" The wild things and Max dance and run around the forest destroying things. The wild things introduce themselves: Ira (voice: Forest Whitaker), Carol, Douglas (voice: Chris Cooper), the bull, Judith (voice: Catherine O'Hara), and Alexander (voice: Paul Dano). K.W. (voice: Lauren Ambrose) is missing; she's gone to hang out with other friends, apparently after a disagCarol shows Max his \"Kingdom\" and shows him his secret hideaway, where has built a miniature of the island. Carol says \"There should be a place where only the things you want to happen, happen.\" Max thinks that with effort from all the wild things, they can build a place like that. Over the next few days, Max and the wild things build a large fortress of rocks and sticks. Tension grows between Max and the wild things when Judith starts to think Max isn't a good king. They have a dirtball fight and many of the wild things get hurt, especially during the fort battle between the \"good\" and the \"bad\" wild things. K.W. and Carol argue because of an intentional face slap which was supposed to be a joke but got serious when it really hurt. K.W. takes Max to see her friends Terry and Bob, who turn out to be owls. They go back to the fortress and the wild things (minus Carol) greet them with open arms. Carol throws a fit and is angry that they are letting two outsiders into the group. K.W. runs away with Terry and Bob. Max and the wild things are sad, sitting in the rain. Judith demands to see Max's \"special powers\" and wants K.W. to come back. The wild things discover Max isn't a king and that he has no powers. Carol is angry with Max, telling him he didn't keep everyone safe, and that he is an awful king. Max runs away with Carol pursuing him. K.W. hides Max in her stomach until Carol leaves. Max then decides it's time to go home. Things seem to be better when he and the wild things all go to the beach, where Max's boat is. Carol is in his secret hideaway crying when he realizes he is being stupid and sees a heart with his initial that Max made for him. (Carol made a similar one for Max on the fort earlier.) Carol runs toward the beach. Max gets into his boat and says goodbye to all the wild things. Carol finally arrives and is unable to speak, so he howls. The other wild things join in and Max howls back. After a brief boat trip he runs back home and his mother greets him with open arms, and feeds him.", :release_date => DateTime.new(2009, 10, 16)}
              ]

Movie.create!(movies)

# movies = 50.times.map do
#   Movie.create!(:title => Faker::App.name,
#                 :synopsis => Faker::Lorem.paragraph(2, true),
#                 :release_date => '11/06/2015')

# end

critic_reviews = 100.times.map do
  Review.create!( :title => Faker::Lorem.sentence,
                  :content => Faker::Lorem.paragraph(word_count=225, true),
                  movie: Movie.all.sample,
                  user: critics.sample,
                  :movie_rating => rand(1..5) )
end

user_reviews = 100.times.map do
  Review.create!( :title => Faker::Lorem.sentence,
                  :content => Faker::Lorem.paragraph(word_count=100, true),
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
