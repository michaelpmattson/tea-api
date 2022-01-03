FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.sentence }
    status { 'Active' }
    frequency { Faker::Number.between(from: 1, to: 100) }
    customer
  end
end
