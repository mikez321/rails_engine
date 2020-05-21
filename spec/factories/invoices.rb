FactoryBot.define do
  factory :invoice do
    customer_id {rand(1..10)}
    merchant_id {rand(1..10)}
    status {'success'}
  end
end
