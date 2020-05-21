require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
  end

  describe 'class methods' do
    before(:each) do
      @merchant = create(:merchant)
      @item1 = Item.create(name: 'Red Baloons',
                          description: 'They are red',
                          unit_price: 1.99,
                          merchant_id: @merchant.id)

      @item2 = Item.create(name: 'Avaitor Sunglasses',
                          description: 'They go well with a mustache',
                          unit_price: 69.99,
                          merchant_id: @merchant.id)

      @item3 = Item.create(name: 'Oakley Sutro Sunglasses',
                          description: 'They are big and badass',
                          unit_price: 139.99,
                          merchant_id: @merchant.id)

    end

    it 'can find an item that meets two sets of criteria' do
      criteria = { 'name' => 'glasses',
                    'description' => 'badass'
                  }
      expect(Item.find_with_multi_params(criteria)).to eq(@item3)
    end

    it 'can find an item by a single parameter' do
      criteria = { 'name' => 'Avaitor' }

      expect(Item.find_with_single_param(criteria)).to eq(@item2)
    end

    it 'can find all items that have params' do
      criteria = { 'name' => 'glasses' }

      expect(Item.all_with_params(criteria)).to include(@item2, @item3)
    end
  end
end
