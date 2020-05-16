FactoryBot.define do
  factory :invoice_item do
    item_id
    invoice_id
    quantity
    unit_price 
  end
end
