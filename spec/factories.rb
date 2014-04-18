FactoryGirl.define do
  factory :user do
    name { Faker::Internet.name }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
    password_confirmation { |u| u.password }
  end

  factory :property do
    title "Charming"
    description "This charming two-bedroom apartment..."
    address { Faker::Address.street_address }
    price 800.00
    bedrooms 2
    long_term false
    owner_id 1
    rented false
  end

  factory :rental1, :class => Rental do
    renter_id 1
    property_id 1
    start_date Date.today
    end_date Date.tomorrow
  end

  factory :rental2, :class => Rental do
    renter_id 1
    property_id 1
    start_date Date.tomorrow.tomorrow.tomorrow.tomorrow
    end_date Date.tomorrow.tomorrow.tomorrow.tomorrow.tomorrow
  end

  factory :rental3, :class => Rental do
    renter_id 1
    property_id 1
    start_date Date.today
    end_date Date.yesterday
  end

  factory :rental4, :class => Rental do
    renter_id 1
    property_id 1
    start_date Date.tomorrow.tomorrow
    end_date Date.tomorrow.tomorrow.tomorrow
  end

  factory :rating1, :class => Rating do
    value 6.0
  end

  factory :rating2, :class => Rating do
    value 4.0
  end
end


