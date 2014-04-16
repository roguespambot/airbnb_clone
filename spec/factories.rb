FactoryGirl.define do
  factory :user do
    name { Faker::Internet.name }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
    password_confirmation { |u| u.password }
  end

  factory :property do
    description "This charming two-bedroom apartment..."
    address { Faker::Address.street_address }
    price 800.00
    bedrooms 2
    long_term false
    owner_id 1
  end
end


