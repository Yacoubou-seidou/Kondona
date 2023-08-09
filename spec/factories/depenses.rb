FactoryBot.define do
  factory :depense do
    name { Faker::Commerce.product_name }
    amount { Faker::Commerce.price }
    association :user
  end
end
