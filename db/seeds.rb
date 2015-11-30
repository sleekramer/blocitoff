# create users
10.times do
  password = Faker::Internet.password
  User.create!(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
  )
end
users = User.all
# create items
75.times do
  Item.create!(
    name: Faker::Hipster.sentence,
    user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users in database"
puts "#{Item.count} items in database"
