FactoryBot.define do
  factory :order_shipment do
    postalcode { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    region_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    building { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
  end
end
