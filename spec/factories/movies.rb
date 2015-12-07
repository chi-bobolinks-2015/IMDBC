FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Jaws #{n}" }
    sequence(:synopsis) {|n| "Jaws #{n} attacks"}
    release_date { Faker::Date.between(600.days.ago, Date.today) }
  end
end
