50.times do
  User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

50.times do
  RegisteredApplication.create!(
    name:  Faker::Hacker.say_something_smart,
    url: Faker::Internet.url,
    created_at: (rand*15).days.ago,
    user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} apps created"
