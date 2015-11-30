FactoryGirl.define do
  pw = Faker::Internet.password
  factory :user do
    email { Faker::Internet.email }
    password pw
    password_confirmation pw
  end

end
