require 'csv'

desc 'Import CSV data'
task :import => [:environment] do
  require "pry"; binding.pry
  Customer.delete_all
  InvoiceItem.delete_all
  Invoice.delete_all
  Item.delete_all
  Merchant.delete_all
  Transaction.delete_all

  CSV.foreach('data/customers.csv', headers: :true).each do |line|
    Customer.create(first_name: line['first_name'],
                    last_name: line['last_name'],
                    created_at: line['created_at'],
                    updated_at: line['updated_at']
                  )
  end

  CSV.foreach('data/invoice_items.csv', headers: :true).each do |line|
    InvoiceItem.create(item_id: line['item_id'],
                       invoice_id: line['invoice_id'],
                       quantity: line['quantity'],
                       unit_price: (line['unit_price'].to_f/100),
                       created_at: line['created_at'],
                       updated_at: line['updated_at']
                     )
  end

  CSV.foreach('data/invoices.csv', headers: :true).each do |line|
    Invoice.create(customer_id: line['customer_id'],
                   merchant_id: line['merchant_id'],
                   status: line['status'],
                   created_at: line['created_at'],
                   updated_at: line['updated_at']
                 )
  end

  CSV.foreach('data/items.csv', headers: :true).each do |line|
    Item.create(name: line['name'],
                description: line['description'],
                unit_price: (line['unit_price'].to_f/100),
                merchant_id: line['merchant_id'],
                created_at: line['created_at'],
                updated_at: line['updated_at']
              )
  end

  CSV.foreach('data/merchants.csv', headers: :true).each do |line|
    Merchant.create(name: line['name'],
                    created_at: line['created_at'],
                    updated_at: line['updated_at']
                  )
  end

  CSV.foreach('data/transactions.csv', headers: :true).each do |line|
    Transaction.create(invoice_id: line['invoice_id'],
                       credit_card_number: line['credit_card_number'],
                       credit_card_expiration_date: line['credit_card_expiration_date'],
                       result: line['result'],
                       created_at: line['created_at'],
                       updated_at: line['updated_at']
                     )
  end
end
