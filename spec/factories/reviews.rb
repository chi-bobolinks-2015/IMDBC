FactoryGirl.define do
  factory :review do
    critic
    movie
    title "Must see film of 2015"
    description "If you can only see one movie this year, check your priorities and then see this film"
    rating { rand(1..5) }
  end
end
