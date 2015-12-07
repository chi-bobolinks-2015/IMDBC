FactoryGirl.define do
  factory :comment do
    user
    review
    content "This reviewer knows their way to the theater"
  end
end
