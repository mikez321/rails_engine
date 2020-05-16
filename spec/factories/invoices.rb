FactoryBot.define do
  factory :invoice do
    customer_id { "" }
    merchant_id { "" }
    status { "MyString" }
  end
end
