FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "FinnTheHero#{n}" }
    sequence(:email) {|n| "finn#{n}@heroes.com"}
    password "password"
  end

  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm }
  end
end
