FactoryGirl.define do
  factory :shipping_address do
    order
    address_line_1 { Faker::Address.street_address }
    address_line_2 { Faker::Address.secondary_address }
    address_line_3 'Extra line'
    city  { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code[0..4] }
  end
end