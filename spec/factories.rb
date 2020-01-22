FactoryBot.define do
  factory :farmer_instrument do
    rent_per_hour {Faker::Number.number(4)}
    deposit {Faker::Number.number(4)}
    is_available {true}
    # available_till {Faker::Date.between(:from '2020-01-01', :to '2021-01-01')}
  end

  factory :farmer do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    mobile_number {Faker::Number.number(10)}
    email {Faker::Internet.email}
  end

  factory :rent do
    # from_date {Faker::Date}
    # to_date {Faker::Date}
    from_date {'2020-01-01'}
    to_date {'2020-11-01'}
  end

  factory :address do
    line1 {Faker::Address}
    # city {Faker::Providers.city}
    # pincode {Faker::Number.number(6)}
    # state {Faker::Providers.state}
    # country {Faker::Providers.country}
    city {"Nashik"}
    pincode {"420120"}
    state {"Maharashtra"}
    country {"India"}
  end

  factory :instrument do
    name {"Harvester"}
    brand {"Mahindra"}
    specification {"Grain"}
  end

end
