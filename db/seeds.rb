# before seed delete previous users
User.where.not(id: 1).destroy_all
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
items = Item.all
# create Subitems
200.times do
  Subitem.create!(
    name: Faker::Hipster.sentence,
    item: items.sample
  )
end
puts "Seed finished"
puts "#{User.count} users in database"
puts "#{Item.count} items in database"
puts "#{Subitem.count} subitems in database"
