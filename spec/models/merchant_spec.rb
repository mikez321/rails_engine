require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many :invoices }
    it { should have_many(:invoice_items).through(:items)}
    it { should have_many(:transactions).through(:invoices)}
  end

  describe 'class methods' do
    before(:each) do
      @bill = Customer.create(first_name: 'Bill', last_name: 'Jack')
      @clayton = Customer.create(first_name: 'Clayton', last_name: 'Reeves')
      @mary = Customer.create(first_name: 'Mary', last_name: 'Jaspen')
      @larry = Customer.create(first_name: 'Larry', last_name: 'Jaspen')
      @marie = Customer.create(first_name: 'Marie', last_name: 'Lynchberg')

      @hotdog = Merchant.create(name: 'Big Jimmy Franks')
      @shoes = Merchant.create(name: 'Shoes Plus')
      @hats = Merchant.create(name: 'Lids')

      @food = @hotdog.items.create(name: 'Classic Frank', description: 'Meat, Catchup, Mustard, Onions', unit_price: 1.99)
      @foot = @shoes.items.create(name: 'Slip Ons', description: 'Easier than tying', unit_price: 109.99)
      @tieups = @shoes.items.create(name: 'Regs', description: 'More secure than a slip on', unit_price: 89.99)
      @basic = @hats.items.create(name: 'Snapback', description: 'Universal Fit', unit_price: 19.99)
      @fancy = @hats.items.create(name: 'Fitted', description: 'Fancy Schmancy', unit_price: 29.99)

      @invoice1 = Invoice.create(customer_id: @bill.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice2 = Invoice.create(customer_id: @bill.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice3 = Invoice.create(customer_id: @bill.id, merchant_id: @shoes.id, status: 'shipped')
      @invoice4 = Invoice.create(customer_id: @bill.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice5 = Invoice.create(customer_id: @clayton.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice6 = Invoice.create(customer_id: @clayton.id, merchant_id: @hats.id, status: 'shipped')
      @invoice7 = Invoice.create(customer_id: @clayton.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice8 = Invoice.create(customer_id: @mary.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice9 = Invoice.create(customer_id: @mary.id, merchant_id: @hats.id, status: 'shipped')
      @invoice10 = Invoice.create(customer_id: @mary.id, merchant_id: @hats.id, status: 'shipped')
      @invoice11 = Invoice.create(customer_id: @larry.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice12 = Invoice.create(customer_id: @larry.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice13 = Invoice.create(customer_id: @larry.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice14 = Invoice.create(customer_id: @larry.id, merchant_id: @hotdog.id, status: 'shipped')
      @invoice15 = Invoice.create(customer_id: @marie.id, merchant_id: @shoes.id, status: 'shipped')

      @invoice_item1 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice1.id, quantity: 10, unit_price: 1.99 )
      @invoice_item2 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice2.id, quantity: 10, unit_price: 1.99)
      @invoice_item3 = InvoiceItem.create(item_id: @foot.id, invoice_id: @invoice3.id, quantity: 1, unit_price: 109.99)
      @invoice_item4 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice4, quantity: 1, unit_price: 1.99)
      @invoice_item5 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice5.id, quantity: 10, unit_price: 1.99)
      @invoice_item6 = InvoiceItem.create(item_id: @basic.id, invoice_id: @invoice6.id, quantity: 1, unit_price: 19.99)
      @invoice_item7 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice7.id, quantity: 10, unit_price: 1.99)
      @invoice_item8 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice8.id, quantity: 10, unit_price: 1.99)
      @invoice_item9 = InvoiceItem.create(item_id: @fancy.id, invoice_id: @invoice9.id, quantity: 1, unit_price: 29.99)
      @invoice_item10 = InvoiceItem.create(item_id: @basic.id, invoice_id: @invoice10.id, quantity: 2, unit_price: 19.99)
      @invoice_item11 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice11.id, quantity: 10, unit_price: 1.99)
      @invoice_item12 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice12.id, quantity: 10, unit_price: 1.99)
      @invoice_item13 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice13.id, quantity: 10, unit_price: 1.99)
      @invoice_item14 = InvoiceItem.create(item_id: @food.id, invoice_id: @invoice14.id, quantity: 10, unit_price: 1.99)
      @invoice_item15 = InvoiceItem.create(item_id: @tieups.id, invoice_id: @invoice15.id, quantity: 1, unit_price: 89.99)

      @t1 = create(:transaction, invoice_id: @invoice1.id, result: 'success')
      @t2 = create(:transaction, invoice_id: @invoice2.id, result: 'success')
      @t3 = create(:transaction, invoice_id: @invoice3.id, result: 'failed')
      @t4 = create(:transaction, invoice_id: @invoice4.id, result: 'success')
      @t5 = create(:transaction, invoice_id: @invoice5.id, result: 'success')
      @t6 = create(:transaction, invoice_id: @invoice6.id, result: 'failed')
      @t7 = create(:transaction, invoice_id: @invoice7.id, result: 'success')
      @t8 = create(:transaction, invoice_id: @invoice8.id, result: 'success')
      @t9 = create(:transaction, invoice_id: @invoice9.id, result: 'success')
      @t10 = create(:transaction, invoice_id: @invoice10.id, result: 'success')
      @t11 = create(:transaction, invoice_id: @invoice11.id, result: 'success')
      @t12 = create(:transaction, invoice_id: @invoice12.id, result: 'success')
      @t13 = create(:transaction, invoice_id: @invoice13.id, result: 'success')
      @t14 = create(:transaction, invoice_id: @invoice14.id, result: 'failed')
      @t15 = create(:transaction, invoice_id: @invoice15.id, result: 'success')

      # there were a total of 80 hotdogs sold by Big Jimmy Franks worth 159.20
      # there was 1 item sold by Shoes Plus for 89.99
      # there were 2 items sold by Lids totaling 59.98

    end

    it 'can return the merchants orderd by number of items sold' do
      return_one = {:quantity => 1}
      return_two = {:quantity => 2}
      return_three = {:quantity => 3}

      expect(Merchant.most_items(return_one)).to include(@hotdog)
      expect(Merchant.most_items(return_two)).to include(@hotdog, @hats)
      expect(Merchant.most_items(return_three)).to include(@hotdog, @hats, @shoes)
    end

    it 'can return the merchants ordered by the most revenue' do
      return_one = {:quantity => 1}
      return_two = {:quantity => 2}
      return_three = {:quantity => 3}

      expect(Merchant.most_revenue(return_one)).to include(@hotdog)
      expect(Merchant.most_revenue(return_two)).to include(@hotdog, @shoes)
      expect(Merchant.most_revenue(return_three)).to include(@hotdog, @shoes, @hats)
    end

    it 'can retun all merchants with similar params' do
      steak = Merchant.create(name: 'Franks Steaks')
      params = { 'name' => 'frank'}

      expect(Merchant.all_with_params(params)).to include(@hotdog, steak)
    end

    it 'can return a single merchant with params' do
      steak = Merchant.create(name: 'Franks Steaks')
      params = { 'name' => 'frank'}

      expect(Merchant.find_with_params(params)).to eq(@hotdog)
    end
  end
end
