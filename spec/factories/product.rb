FactoryBot.define do
  factory :product do
    title { Faker::Games::Pokemon.name }
    description { Faker::Quote.yoda }
    image_url { 'dpchat.jpg' }
    price { 1 }
  end
end