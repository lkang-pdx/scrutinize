50.times do
  User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

50.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    url: Faker::Internet.url,
    created_at: (rand*15).days.ago,
    user: users.sample
  )
end

apps = RegisteredApplication.all

25.times do
  Event.create!(
    registered_application: apps.sample,
    name: Faker::Hacker.noun,
    created_at: (rand*15).days.ago
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} apps created"
puts "#{Event.count} events created"
