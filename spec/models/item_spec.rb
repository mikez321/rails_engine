require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
  end

  describe 'class methods' do
    it 'can find an item that meets two sets of criteria' do
    merchant = create(:merchant)
      item1 = Item.create(name: 'Red Baloons',
                          description: 'They are red',
                          unit_price: 1.99,
                          merchant_id: merchant.id)

      item2 = Item.create(name: 'Avaitor Sunglasses',
                          description: 'They go well with a mustache',
                          unit_price: 69.99,
                          merchant_id: merchant.id)

      item3 = Item.create(name: 'Oakley Sutro Sunglasses',
                          description: 'They are big and badass',
                          unit_price: 139.99,
                          merchant_id: merchant.id)

      criteria = { 'name' => 'glasses',
                   'description' => 'badass'
                  }

      expect(Item.multi_find(criteria)).to eq(item3)
    end
  end
end
