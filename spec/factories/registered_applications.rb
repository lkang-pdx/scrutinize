FactoryGirl.define do
  factory :item do
    name { Faker::Hacker.say_something_smart }
    url { Faker::Internet.url }
    user
  end
end
