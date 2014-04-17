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

  factory :rental1, :class => Rental do
    id 1
    renter_id 1
    property_id 1
  end

  factory :rental2, :class => Rental do
    id 1
    renter_id 1
    property_id 1
  end

  factory :rating1, :class => Rating do
    rental_id 1
    value 5
  end
end


