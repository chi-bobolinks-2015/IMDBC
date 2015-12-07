FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "FinnTheHero#{n}" }
    sequence(:email) {|n| "finn#{n}@heroes.com"}
    password "password"
  end
end
