FactoryGirl.define do
  factory :review do
    movie
    title "Must see film of 2015"
    content "If you can only see one movie this year, check your priorities and then see this film"
    movie_rating { rand(1..5) }

    factory :critic_review do
      user factory: :confirmed_critic
    end

    factory :user_review do
      user factory: :confirmed_user
    end
  end
end
