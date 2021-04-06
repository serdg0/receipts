require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "123456" }
    password_confirmation { "123456" }
  end

  factory :receipt do
    association :user
    buyer { "Homer" }
    description { "chips"}
    price { 12 }
    items_count { 5 }
    total_price { 60 }
    seller_address { "Fake st. 123" }
    seller { "Fake Doctor" }
  end
end
