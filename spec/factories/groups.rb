FactoryBot.define do
  factory :group do
    name { Faker::Company.name }
    icon { Faker::Internet.url }
    association :user
  end
end
