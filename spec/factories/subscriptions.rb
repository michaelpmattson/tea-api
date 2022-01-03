FactoryBot.define do
  factory :subscription do
    customer_id { nil }
    title { "MyString" }
    status { "MyText" }
    frequency { 1 }
  end
end
