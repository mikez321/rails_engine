FactoryBot.define do
  factory :transaction do
    invoice_id {rand(1..10)}
    credit_card_number { Faker::Number.number(digits: 16) }
    credit_card_expiration_date { Faker::Number.number(digits: 4) }
    result { 'success' }
  end
end
