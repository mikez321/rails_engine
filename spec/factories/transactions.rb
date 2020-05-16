FactoryBot.define do
  factory :transaction do
    invoice_id { "" }
    credit_card_number { "" }
    credit_card_expiration_date { "" }
    result { "MyString" }
  end
end
