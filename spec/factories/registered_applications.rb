FactoryGirl.define do
  factory :registered_application do
    name { Faker::App.name }
    url { Faker::Internet.url }
    user
  end
end
