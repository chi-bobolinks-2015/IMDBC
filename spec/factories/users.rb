FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "FinnTheHero#{n}" }
    sequence(:email) {|n| "finn#{n}@heroes.com"}
    password "password"

    factory :critic do
      critic true
    end
  end

  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm }
  end

  factory :confirmed_critic, :parent => :critic do
    after(:create) { |user| user.confirm }
  end
end
