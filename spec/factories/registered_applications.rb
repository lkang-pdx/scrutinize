FactoryGirl.define do
  factory :registered_application do
    name { Faker::Hacker.say_something_smart }
    url { Faker::Internet.url }
    user
  end
end
