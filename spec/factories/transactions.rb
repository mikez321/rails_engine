FactoryBot.define do
  factory :transaction do
    invoice_id { "" }
    credit_card_number { Faker::Number.number(digits: 16) }
    credit_card_expiration_date { Faker::Number.number(digits: 4) }
    result { "MyString" }
  end
end
