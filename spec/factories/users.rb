FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "FinnTheHero#{n}" }
    sequence(:email) {|n| "finn#{n}@heroes.com"}
    password "password"
  end
end
