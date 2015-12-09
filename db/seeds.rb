User.delete_all
Movie.delete_all
Review.delete_all
Comment.delete_all

# So we always have a critic and a user we know the password for in advance
default_critic = User.create!( :username => "hana",
                :email    => "hana@gmail.com",
                :password   => '12345678',
                :critic => true,
                :confirmed_at => Time.now )

default_user  = User.create!( :username => "regina",
                :email    => "regina@gmail.com",
                :password   => '12345678',
                :critic => false,
                :confirmed_at => Time.now )


#generic critics and users
critics = 25.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email    => Faker::Internet.email,
                :password   => 'password',
                :critic => true,
                :confirmed_at => Time.now )
end

users = 20.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email    => Faker::Internet.email,
                :password   => 'password',
                :critic => false,
                :confirmed_at => Time.now )
end

movies = [ {:title => "In the Heart of the Sea",
                :synopsis => "Based on the 1820 event, a whaling ship is preyed upon by a sperm whale, stranding its crew at sea for 90 days, thousands of miles from home.", :release_date => DateTime.new(2015, 12, 11), :trailer_url => "https://www.youtube.com/embed/K-H35Mpj4uk"},

            {:title => "Legend",
                :synopsis => "The film tells the story of the identical twin gangsters Reggie and Ronnie Kray, two of the most notorious criminals in British history, and their organised crime empire in the East End of London during the 1960s.",
                :release_date => DateTime.new(2015, 11, 20), :trailer_url => "https://www.youtube.com/embed/yI3v6KfR9Mw"},

            {:title => "The Big Short",
                :synopsis => "Four outsiders in the world of high-finance who predicted the credit and housing bubble collapse of the mid-2000s decide to take on the big banks for their lack of foresight and greed.",
                :release_date => DateTime.new(2015, 12, 23), :trailer_url => "https://www.youtube.com/embed/vgqG3ITMv1Q"},

           {:title => "The Lady in the Van",
                :synopsis => "A man forms an unexpected bond with a transient woman living in her car that's parked in his driveway.",
                :release_date => DateTime.new(2016, 01, 16), :trailer_url => "https://www.youtube.com/embed/47T0HORY9gs"},

            {:title => "Don Verdean",
                :synopsis => "A self-professed biblical archaeologist who has fallen on hard times starts to bend the truth in order to continue inspiring the faithful. ",
                :release_date => DateTime.new(2015, 12, 11), :trailer_url => "https://www.youtube.com/embed/0a29hOLd1gA"},

            {:title => "The Boy and the World",
                :synopsis => "A little boy goes on an adventurous quest in search of his father.",
                :release_date => DateTime.new(2015, 12, 11), :trailer_url => "https://www.youtube.com/embed/eqdrwu0NvY8"},

            {:title => "The Hunger Games: Mockingjay - Part 2",
                :synopsis => "As the war of Panem escalates to the destruction of other districts by the Capitol, Katniss Everdeen, the reluctant leader of the rebellion, must bring together an army against President Snow, while all she holds dear hangs in the balance.",
                :release_date => DateTime.new(2015, 11, 20), :trailer_url => "https://www.youtube.com/embed/n-7K_OjsDCQ"},

            {:title => "Krampus",
                :synopsis => "A boy who has a bad Christmas ends up accidentally summoning a Christmas demon to his family home.",
                :release_date => DateTime.new(2015, 12, 05), :trailer_url => "https://www.youtube.com/embed/BqiRZGyU718"},

           {:title => "Creed",
                :synopsis => "The former World Heavyweight Champion Rocky Balboa serves as a trainer and mentor to Adonis Johnson, the son of his late friend and former rival Apollo Creed.",
                :release_date => DateTime.new(2015, 11, 25), :trailer_url => "https://www.youtube.com/embed/KwwLxNfBFmc"},

           {:title => "The Good Dinosaur",
                :synopsis => "An epic journey into the world of dinosaurs where an Apatosaurus named Arlo makes an unlikely human friend.",
                :release_date => DateTime.new(2015, 11, 25), :trailer_url => "https://www.youtube.com/embed/7BrH72aFXfI"},

           {:title => "Spectre",
                :synopsis => "A cryptic message from Bond's past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.",
                :release_date => DateTime.new(2015, 11, 06), :trailer_url => "https://www.youtube.com/embed/FCC0wG5eibI"},

           {:title => "The Night Before",
                :synopsis => "On Christmas eve, three lifelong friends, two of whom are Jewish, spend the night in New York City looking for the Holy Grail of Christmas parties.",
                :release_date => DateTime.new(2015, 11, 20), :trailer_url => "https://www.youtube.com/embed/kOBdxkhJvHQ"},

           {:title => "The Peanuts Movie",
                :synopsis => "Snoopy embarks upon his greatest mission as he and his team take to the skies to pursue their arch-nemesis, while his best pal Charlie Brown begins his own epic quest back home.", :release_date => DateTime.new(2015, 11, 06), :trailer_url => "https://www.youtube.com/embed/8pCoVQDD-OY"},

           {:title => "Spotlight",
                :synopsis => "The true story of how the Boston Globe uncovered the massive scandal of child molestation and cover-up within the local Catholic Archdiocese, shaking the entire Catholic Church to its core.",
                :release_date => DateTime.new(2015, 11, 25), :trailer_url => "https://www.youtube.com/embed/tb_WgKDqPsE"},

           {:title => "Brooklyn",
                :synopsis => "An Irish immigrant lands in 1950s Brooklyn, where she quickly falls into a new romance. When her past catches up with her, however, she must choose between two countries and the lives that exist within.",
                :release_date => DateTime.new(2015, 11, 06), :trailer_url => "https://www.youtube.com/embed/-pBfqEP2_J4"},

           {:title => "Secret in Their Eyes",
                :synopsis => "A tight-knit team of rising investigators, along with their supervisor, is suddenly torn apart when they discover that one of their own teenage daughters has been brutally murdered.",
                :release_date => DateTime.new(2015, 11, 20), :trailer_url => "https://www.youtube.com/embed/euQTVkpBfAk"},

           {:title => "Where the Wild Things Are",
                :synopsis => "Max (Max Records) is a young boy who feels misunderstood and wants to have fun all the time. He makes an igloo out of snow, but his sister's friends gang up on him and smash it. After making a scene in front of his mother's boyfriend, Max bites his mother and runs away. He keeps running until he stumbles upon a small boat; he climbs aboard and sets sail. After a few days at sea, he reaches the dangerous, rocky shore of a strange island at night. He leaves the boat on shore and walks toward voices he hears in the woods. Max eavesdrops on a few creatures arguing. One of them, Carol (voice: James Gandolfini), is destroying the huts and screaming. The other wild things are yelling at him, telling him to stop. Max runs out of the trees and joins Carol in destroying the huts. The wild things are angry about this and want to eat him. But Max tells them that he was the king where he came from, and he has \"special powers,\" so the wild things can't eat him. Carol crowns him king of the wild things and the island. Max's first order of business is to \"let the wild rumpus start!\" The wild things and Max dance and run around the forest destroying things. The wild things introduce themselves: Ira (voice: Forest Whitaker), Carol, Douglas (voice: Chris Cooper), the bull, Judith (voice: Catherine O'Hara), and Alexander (voice: Paul Dano). K.W. (voice: Lauren Ambrose) is missing; she's gone to hang out with other friends, apparently after a disagCarol shows Max his \"Kingdom\" and shows him his secret hideaway, where has built a miniature of the island. Carol says \"There should be a place where only the things you want to happen, happen.\" Max thinks that with effort from all the wild things, they can build a place like that. Over the next few days, Max and the wild things build a large fortress of rocks and sticks. Tension grows between Max and the wild things when Judith starts to think Max isn't a good king. They have a dirtball fight and many of the wild things get hurt, especially during the fort battle between the \"good\" and the \"bad\" wild things. K.W. and Carol argue because of an intentional face slap which was supposed to be a joke but got serious when it really hurt. K.W. takes Max to see her friends Terry and Bob, who turn out to be owls. They go back to the fortress and the wild things (minus Carol) greet them with open arms. Carol throws a fit and is angry that they are letting two outsiders into the group. K.W. runs away with Terry and Bob. Max and the wild things are sad, sitting in the rain. Judith demands to see Max's \"special powers\" and wants K.W. to come back. The wild things discover Max isn't a king and that he has no powers. Carol is angry with Max, telling him he didn't keep everyone safe, and that he is an awful king. Max runs away with Carol pursuing him. K.W. hides Max in her stomach until Carol leaves. Max then decides it's time to go home. Things seem to be better when he and the wild things all go to the beach, where Max's boat is. Carol is in his secret hideaway crying when he realizes he is being stupid and sees a heart with his initial that Max made for him. (Carol made a similar one for Max on the fort earlier.) Carol runs toward the beach. Max gets into his boat and says goodbye to all the wild things. Carol finally arrives and is unable to speak, so he howls. The other wild things join in and Max howls back. After a brief boat trip he runs back home and his mother greets him with open arms, and feeds him.", :release_date => DateTime.new(2009, 10, 16), :trailer_url => "https://www.youtube.com/embed/hcBPzqxBnRU"}
              ]

Movie.create!(movies)

rates = User.all.each do |user|
    Movie.all.each do |movie|
      Rate.create!(rater_id: user.id, rateable_id: movie.id, rateable_type: "Movie", dimension: "overall", stars: rand(1..5))
    end
  end

critic_reviews1 = [
  {:title => "A journey going absolutely nowhere",
    :content => "The film of The Lady in the Van becomes a journey in which Bennett pieces together the arc of Miss Shepherd’s life while tending to his own middle-class failing mother, who’s increasingly deluded but none too swift even with her full faculties. The inside of Miss Shepherd’s van — crammed with newspapers, street junk, and inorganic and organic filth — is visible every time she opens the back doors, which she does often. We watch her inside gazing at the telly. We see flashbacks to her younger self as a gifted pianist forced to give up music by repressive nuns. We follow her on a road trip. We find out that she had a tragic accident that drove her underground and that a sinister stranger (Jim Broadbent) comes by to see her on occasion. \n The mystery is gone and so, frankly, is the thrill. But Maggie Smith does her best to give the role some edge. She is fiercely unlikable, demanding help rather than asking for it, and managing to look scary rather than cute in a wheelchair flying the Union Jack. One scene reminds you of her greatness. On that road trip, Miss Shepherd wanders into a senior-citizens’ center and watches a young woman play the piano. The mask of distaste dissolves before your eyes and you see the tragedy of her life. \n Not everyone recoils from The Lady in the Van the way I do. It apparently plays well with older audiences and some critics praise its abiding sweetness. My adoration for Bennett’s published diaries doubtless colors my belief that, as a playwright and screenwriter, he went astray. I don’t think he dramatized this blessed accident in his life. I think he worried it to death.",
    movie: Movie.find_by(title: "The Lady in the Van"),
    user: critics.sample},

  {:title => "A meekly gallant invitation",
    :content => " Nicholas Hytner’s twee film of Alan Bennett’s The Lady in the Van is the final injury to what was, in its original form, a perfect thing: Bennett’s diary entries recounting the appearance of the prodigiously unstable (and unhygienic) but proud “Miss Shepherd” in a broken-down van on his block and her move — at his meekly gallant invitation when she was forced off the public street — to park her vehicle and herself in his driveway. She remained there for 15 years. \n Have you read said entries? Buy Bennett’s audio version and listen to him read in his faintly embarrassed tones, which are no less genuine for having been cultivated. Miss Shepherd exists in the margins of his life, someone he had to reckon seriously with only when she or some crisis in her increasingly enfeebled existence imposed on him. She was — despite some inquiries he made about her background — a mystery to the end. Even the inside of that van was off limits until they removed her body. \nIn his theatrical adaptation and now this screenplay, Bennett gives us not one but two Alan Bennetts, played onscreen by Alex Jennings with a high-tenor squeak just this side of Truman Capote and the sad frown of Stan Laurel. The gimmick is that one Bennett encourages the other to exploit Miss Shepherd (Maggie Smith) as fodder for a play or movie script and add events and interactions that never happened but would play well. The other Bennett worries that he’s exploiting her. He should have just used her — no shame, she was an exhibitionist and is dead now anyway — and gotten on with it. The two Bennetts double his tedious squeamishness, and scenes with his friends (“How’s your old lady?” triple it. We already know how conflicted he is.",
    movie: Movie.find_by(title: "The Lady in the Van"),
    user: critics.sample},

  {:title => "'The Lady in the Van' is a showcase for a great performance by Maggie Smith",
    :content => " I’ve never met anybody who doesn’t love Maggie Smith, and if I ever do I’ll run in the other direction. Despite her reputation for playing snippy dowagers á la “Downton Abbey,” she’s capable of playing anything. (If you doubt me, take a look sometime, for starters, at her portrayal of Desdemona opposite Laurence Olivier in “Othello.”) The same emotional insight that allows her to play the high born with such feeling and felicity is continuous with her genius for playing the low born and indigent, as in “The Lonely Passion of Judith Hearne.” Nowhere is this gift more apparent than in “The Lady in the Van,” where she reprises her famed stage performance as Miss Shepherd – a bag lady who carries herself like bedraggled royalty. \n Adapted by Alan Bennett from his 1999 play, and directed by frequent collaborator Nicholas Hytner (who also directed the stage version), “The Lady in the Van” is a showcase for what is sometimes generically referred to as a tour de force, which often means a celebrated stage performance that ossified long before it hit the screen. The remarkable thing about Smith in “The Lady in the Van” is that, even though the role is no longer fresh for her, the performance certainly is. She gives it everything she’s got because, you feel, she wants to honor this character. She wants Miss Shepherd to live on. \n The movie, which begins in 1970, is billed as “mostly a true story,” which is a bit coy, but this lead-up does invite us to view the drama as a kind of guessing game.\n Bennett (played by Alex Jennings), a celebrated playwright and sometime actor, first encountered Miss Shepherd when she parked her beat-up yellow van in the driveway of his North London townhouse. Well known to the neighborhood as a roaming, persnickety hag, she found a refuge of sorts with Bennett, who, with a mixture of incredulity and writerly fascination, allowed her to take up residence in his driveway until her death 15 years later.",
    movie: Movie.find_by(title: "The Lady in the Van"),
    user: critics.sample},

  {:title => "A journey going absolutely nowhere",
    :content => "The film gets at the ways in which writers find themselves conflicted about exploiting the lives of real people in their writing. Bennett in the movie is split into two selves, both played, using camera trickery, by Jennings. His alter ego is his non-writer self, the one who tells his counterpart, “I live, you write, that’s how it works.” At first, Bennett the playwright, who also cares for his aging, demanding mother, resists the temptation to keep a notebook of observations about Miss Shepherd, despite the fact that she is such obvious “material.” He says “she’s just something that’s happening,” but comes to realize that “you don’t put yourself into what you write, you find yourself there.",
    movie: Movie.find_by(title: "The Lady in the Van"),
    user: critics.sample},

  {title: "Relentlessly bleak and action-packed",
    content: "If you're looking for a bright and breezy popcorn movie, give this a miss. Relentlessly bleak from the first frame, this final outing pulls no punches as white knuckle action sequences see the casualty rate rise alongside the tension. \n The decision to split the final book in author Suzanne Collins' trilogy into two meant that the previous film was light on action, but the result is a last chapter that grips from the beginning, as Katniss and friends face mortal threat after mortal threat. \n Jennifer Lawrence holds everything together with another measured performance as the reluctant leader who must choose between her friends' safety and the cause. \n There are minor failings - the death of a major character is not as affecting as it might be - but on the whole director Francis Lawrence should be applauded for not wavering from the series' downbeat willingness to focus on serious themes while targeting a teenage market.",
    movie: Movie.find_by(title: "The Hunger Games: Mockingjay - Part 2"),
    user: critics.sample},

  {title: "It's good.",
    content: "Mockingjay Part 2 looks spectacular. The costumes are awesome. The acting is on point. And all that solid artistic work kinda but not entirely distracts from a super goofy movie.\n Okay, where are we again? Part 1: There were 'Hunger Games,'' a televised event where children fight to the death with silly obstacles. Katniss won. Part 2: 'Catching Fire,'' Katniss gets so famous from winning, it makes everybody want to overthrow the government. The evil president tries to solve it with yet another Hunger Games, this time an All Star edition including Katniss (that'll teach her!). She escapes. Part 3 Part 1: There's full-frontal rebellion. We ignore it and focus on Katniss's role as Mascot of the Revolution. \n Now we're finally at Part 3: Part 2, and shit's about to get really real. War is raging. Katniss sneaks to the front line. But… oh look it's another Hunger Games. You see, Suzanne Collins had the one idea, an arena where kids fight to death with silly obstacles. So in order to shoe-horn that concept into a war movie, she decides that the evil Capitol will just pull back all its forces and leave a bunch of silly obstacles around the city. Rather than fighting, the war somehow comes down to the same kids from the earlier games trying to avoid magical booby traps. It doesn't make a lot of sense.",
    movie: Movie.find_by(title: "The Hunger Games: Mockingjay - Part 2"),
    user: critics.sample},

  {title: "Not a logical movie" ,
    content: "The Capitol has the ability to create an entire city block that fills with hot oil, ceiling-mounted laser cannons that instantly destroy anything that touches them, and lizard people. And they're losing. THEY HAVE AN ARMY OF LIZARD PEOPLE HOW ARE THEY LOSING THIS WAR???.",
    movie: Movie.find_by(title: "The Hunger Games: Mockingjay - Part 2"),
    user: critics.sample},
  {title: "Landing punches every round" ,
    content: "Sylvester Stallone hands off the Rocky saga to writer-director Ryan Coogler, who makes the aging Italian Stallion the corner man for a younger boxer who is the illegitimate son of his old adversary Apollo Creed. Coogler's acclaimed debut feature, Fruitvale Station (2013), dealt with the real-life police killing of an unarmed black man in San Francisco, but in keeping with Stallone's wholesome formula for the Rocky movies, there's no racial angle here, just a lot of daddy issues. Michael B. Jordan, who played the victim in Fruitvale Station, injects some juice as Adonis Creed, and the muttering Stallone has a few ostensibly touching moments. But anyone hoping the franchise might open out into new thematic territory will be disappointed; this is the same old ritual, from the amped-up training sequences to the climactic title fight with its absurd number of punches landed in every round.",
    movie: Movie.find_by(title: "Creed"),
    user: critics.sample},
  {title: "Not so much a Rocky sequel as a movie set in the Rocky universe" ,
    content: "Rocky is a Best Picture winner that became a long-running franchise, which – if we're being honest – stripped a bit of the luster from its Oscar win. The series became sillier, hitting a nadir with Rocky IV, which is admittedly fun in all the wrong kinds of ways. From there, it became slightly gimmicky, bringing in a kid for Rocky V, then going for the standard return-to-roots comeback vibe with Rocky Balboa. All the individual films have their merits to some degree, but none are really on par with the original. The latest sequel, Creed, takes a slightly new approach. It's not so much a Rocky sequel as it is a movie set in the Rocky universe. That's a crucial difference, and one that marks the film as a high point in the franchise. \n Michael B. Jordan plays Adonis Johnson, the illegitimate son of Apollo Creed (famously played by Carl Weathers). A misspent youth, he was eventually taken in by the wife (Phylicia Rashad) Creed cheated on. As a young man, Adonis decides that he, too, wants to be a professional fighter, so he makes his way to Philadelphia, where he convinces Rocky (Sylvester Stallone) to train him. He initially tries to hide his connection to his famous father, but others are intent on bringing the secret to light. Meanwhile, Adonis romances a young singer named Bianca (Tessa Thompson) who lives in his building. Since it wouldn't be right for a Rocky movie to end without a big fight, Creed has one with high personal stakes for the young boxer.",
    movie: Movie.find_by(title: "Creed"),
    user: critics.sample},
  {title: "Innovative Staging" ,
    content: "The smartest thing Sylvester Stallone did was to not write and/or direct this film, as he did with all the previous sequels (minus Rocky V, which put John G. Avildsen back in the director's chair). Ryan Coogler (Fruitvale Station) brings a fresh set of eyes to the project. He clearly understands and respects the appeal of the 1976 original, and he pays tribute to the franchise as a whole in the screenplay he co-wrote with Aaron Covington. But Coogler also brings his own touches. One of them is some innovative staging, including a dazzling boxing match done entirely in one unbroken shot (or least appearing to be). Another is providing a more internal motivation for the central character. Whereas Rocky wanted to prove himself to the world, Adonis needs to prove himself to himself. He is ashamed of things about his heritage, and believes that being a good fighter will earn him a degree of self-respect that he can't – or won't allow himself to – find any other way.",
    movie: Movie.find_by(title: "Creed"),
    user: critics.sample},
  {title: "Good Old-Fashioned Underdog Story" ,
    content: "Michael B. Jordan once again proves himself to be the real deal, effectively making Adonis' inner struggle feel true. We sense how deep and real the stakes are as he looks for a way to establish himself outside of his famous father's shadow, even though he's choosing the same career path. Jordan has some very touching scenes with Stallone, who takes on a mentoring role here. What's so captivating about his performance is that you can see a touch of identification in it. Rocky knows that Adonis is so good that his skills could be life-changing. Similarly, Stallone knows that playing Adonis could open a lot of career doors for Jordan, just as it did for him. There are moments where the line between reality and fiction blur, creating a character dynamic that is surprisingly affecting. \n Creed is also just a good old-fashioned underdog story, one that earns your rooting interest early on, then continues building it. Yes, it follows a fairly traditional formula, but so what? With strong performances, a worthy theme about learning to like yourself, and some appropriate – but not corny – references to key moments from the Rocky series, Creed works both as part of a larger franchise and on its own massively entertaining terms.",
    movie: Movie.find_by(title: "Creed"),
    user: critics.sample},
  {title: "Cue The Sad Music",
    content: "5 million years ago a rogue meteor hit the earth, changing the world drastically. One of the big changes was the extinction of the dinosaurs. But what if that meteor had missed? \n Meet the Apatosaurus family. Momma and Poppa welcome the arrival of three eggs and their contents. Soon, the family is complete with Libby, Buck and Arlo. These particular dinosaurs are farmers, and they’re bodies allow them the opportunity to act as both the plow and the sprinkler system. Brainy Libby helps out, as does brawny Buck. Sadly, tiny Arlo can only feed the chickens (or at least the prehistoric version of chickens) and help fill the silo with corn so the family can survive the winter. Things go well until, like most films, tragedy strikes and Arlo finds himself on his own. Cue the sad music..",
    movie: Movie.find_by(title: "The Good Dinosaur"),
    user: critics.sample},
  {title: "Visually Pleasing But Your Kids Will Cry",
    content: "From the PIXAR division of Disney, “The Good Dinosaur” is a visual treat for the eyes. From the ice covered mountains to the rushing river waters it is amazing the advances that have been made in computer generated animation. Like most Disney films, the hero soon finds himself in trouble, where he is rescued by a young boy that Arlo names “Spot.” The best way to describe Spot is to ask if you remember the Feral Kid from “The Road Warrior.” If so, you now have an image of what I’m talking about. \n The film follows Arlo and Spot as they make their way back to Three Claw Mountain. Along the way they meet some colorful creatures, including a trio of T-rex’s led by Sam Elliott. The many characters are vividly rendered and all are memorable. And frightening. I have no idea how this film received a PG rating. There is death in and around the story, including a scene where a cute, saucer-eyed animal is suddenly gobbled down and then torn to shreds by a pair of dueling pterodactyls! If you’re taking children under the age of 7 prepare to dry their tears.",
    movie: Movie.find_by(title: "The Good Dinosaur"),
    user: critics.sample},
  {title: "Visually Pleasing But Your Kids Will Cry",
    content: "From the PIXAR division of Disney, “The Good Dinosaur” is a visual treat for the eyes. From the ice covered mountains to the rushing river waters it is amazing the advances that have been made in computer generated animation. Like most Disney films, the hero soon finds himself in trouble, where he is rescued by a young boy that Arlo names “Spot.” The best way to describe Spot is to ask if you remember the Feral Kid from “The Road Warrior.” If so, you now have an image of what I’m talking about. \n The film follows Arlo and Spot as they make their way back to Three Claw Mountain. Along the way they meet some colorful creatures, including a trio of T-rex’s led by Sam Elliott. The many characters are vividly rendered and all are memorable. And frightening. I have no idea how this film received a PG rating. There is death in and around the story, including a scene where a cute, saucer-eyed animal is suddenly gobbled down and then torn to shreds by a pair of dueling pterodactyls! If you’re taking children under the age of 7 prepare to dry their tears.",
    movie: Movie.find_by(title: "The Good Dinosaur"),
    user: critics.sample},
  {title: "The Peanuts, But Not As Good",
    content: "Peanuts would never have been any good without the grief. When Charles Schulz's daily comic strip debuted in 1950, it offered cute jokes about neighborhood kids and their dog, but as Schulz began to find his characters in the late '50s and early '60s—the depressed Charlie Brown, the hardened Lucy, the insecure Linus, the monomaniacal Snoopy—Peanuts developed an emotional depth that made it hilariously funny and revolutionized the art form. Last week The Peanuts Movie brought Schulz's cast of characters back to the big screen for the first time in 35 years, adding the modern technology of 3-D animation to give the characters physical depth. But emotional depth is another matter—this is a G-rated movie, and in America we try to protect children from not only sex and violence but also unhappiness.",
    movie: Movie.find_by(title: "The Peanuts Movie"),
    user: critics.sample},
  {title: "Nostalgic And Good",
    content: "For those of us from a certain time, the “Peanuts” comic strip is a definite part of our growing up. I collected the paperback books, read the daily comic strips and can proudly say that I am so old that I can remember watching “A Charlie Brown Christmas” when it debuted! Five decades of memories are treated with the respect they deserve in the new film “The Peanuts Movie.” \n As the film begins, the gang are celebrating a new snow fall, which signals a snow day. We gradually meet all of the familiar characters (Linus, Lucy, Sally and, of course, Snoopy). And we meet a new one when a moving truck shows up. The family consists of a mother and father and a pretty little red-headed girl. Cue the arrows to the heart – Charlie Brown is in love. \n A production from the same group that made the “Ice Age” films, I have to give great credit to the filmmakers for keeping the look of the characters the same. Even though the animation is done via CGI, the way the characters move and interact is similar to the original hand-drawn films and television specials from the past. Each character is given their familiar traits (Lucy’s vainness, Schroeder’s piano playing, Linus and his blanket) and situations. Each character is given their due, almost as if the film was a true ensemble piece. The story is straight-forward but will be entertaining for both young and old viewers.",
    movie: Movie.find_by(title: "The Peanuts Movie"),
    user: critics.sample},
  {title: "Sleek and Serious.",
    content: "Ever since Daniel Craig took over the role of 007, the Bond franchise has been moving toward a more grounded, John La Carre-style spy thriller and away from the cartoony gadgets of the Roger Moore era. Villains don’t have grand schemes like robbing Fort Knox but rather something more nebulous and sinister like controlling global technology. But some things – like Bond’s banter with evil masterminds – never quite goes away. \n 'SPECTRE' is a sleek, stylish entry in the modern Bond films. There’s less action, more exposition but also an ambitious overarching story arc. It’s a solid, serious spy film that still has a playful glint in its eye.",
    movie: Movie.find_by(title: "Spectre"),
    user: critics.sample},

  {title: "The Haunting of James Bond",
    content: "The decision, starting in Quantum of Solace, to make Bond a rogue agent operating outside the umbrella of Queen and Country—and then Javier Bardem’s Silva an ex-MI6 operative with an axe to grind—was to eschew those reliable standbys, good and evil (white and black, like a tuxedo) and instead cloak the old warhorse in those fashionable shades of grey that all the kids (and comic-book-movie-worshipping adultcritics) like to rave about these days. If a spectre was haunting the proceedings, it was the ghost of Christopher Nolan, whose fanatical need to connect and reflect his good guys and bad guys off of one another typically borders on the pathological—and requires a heaping ton of convoluted backstory to boot. This all gets even worse in Spectre, where Waltz’s You-Know-Who explains to a stricken-looking Daniel Craig: “It was me, James, the author of all your pain..",
    movie: Movie.find_by(title: "Spectre"),
    user: critics.sample}]

Review.create!(critic_reviews1)

critic_reviews = 70.times.map do
  Review.create!( :title => Faker::Lorem.sentence,
                  :content => Faker::Lorem.paragraph(word_count=225, true),
                  movie: Movie.all.sample,
                  user: critics.sample)
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
