FactoryGirl.define do
  factory :event do
    name { Faker::Hacker.noun }
    registered_application
    user
  end
end
