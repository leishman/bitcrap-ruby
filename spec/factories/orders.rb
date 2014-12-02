FactoryGirl.define do
  factory :order do
    amount { [1, 2, 5, 10].sample }
    notes { Faker::Lorem.sentence }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    status 'unpaid'
  end
end