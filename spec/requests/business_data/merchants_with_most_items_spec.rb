require 'rails_helper'

describe 'merchant business metrics' do
  it 'can return the merchant with the most sold items' do
    customer_list = create_list(:customer, 10)

    merchant1 = create(:merchant)
      m1items = create_list(:item, 10, merchant_id: merchant1.id)
    merchant2 = create(:merchant)
      m2items = create_list(:item, 10, merchant_id: merchant1.id)
    merchant3 = create(:merchant)
      m3items = create_list(:item, 10, merchant_id: merchant1.id)

    # inv1 = Invoice.create(customer_id: customer_list[0].id, merchant_id:)
    # inv1 = Invoice.create(customer_id: customer_list[0].id, merchant_id:)
    # inv1 = Invoice.create(customer_id: customer_list[3].id, merchant_id:)
    # inv1 = Invoice.create(customer_id: customer_list[2].id, merchant_id:)
    # inv1 = Invoice.create(customer_id: customer_list[1].id, merchant_id:)
    # inv1 = Invoice.create(customer_id: customer_list[1].id, merchant_id:)
    # inv1 = Invoice.create(customer_id: customer_list[1].id, merchant_id:)

    InvoiceItem.create(item_id: m1items[1].id, invoice_id: rand(1..1000), quantity: 5, unit_price: rand(1..100))
    InvoiceItem.create(item_id: m1items[2].id, invoice_id: rand(1..1000), quantity: 15, unit_price: rand(1..100))
    InvoiceItem.create(item_id: m1items[4].id, invoice_id: rand(1..1000), quantity: 15, unit_price: rand(1..100))

    InvoiceItem.create(item_id: m2items[1].id, invoice_id: rand(1..1000), quantity: 5, unit_price: rand(1..100))
    InvoiceItem.create(item_id: m2items[2].id, invoice_id: rand(1..1000), quantity: 5, unit_price: rand(1..100))


    get '/api/v1/merchants/most_items?quantity=3'

    expect(response).to be_successful
  end
end
