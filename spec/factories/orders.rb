FactoryGirl.define do
  factory :order do
    amount { [1, 2, 5, 10].sample }
    notes { Faker::Lorem.sentence }
  end
end