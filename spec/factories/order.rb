FactoryBot.define do
  factory :order do
    name { Faker::Games::Pokemon.name }
    address { Faker::Games::Pokemon.name }
    email { Faker::Games::Pokemon.name }
    pay_type { 'Credit card' }
  end
end