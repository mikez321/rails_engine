FactoryBot.define do
  factory :invoice_item do
    item_id {rand(1..10)}
    invoice_id {rand(1..25)}
    quantity {rand(1..10)}
    unit_price {rand(1..100).to_f}
  end
end
