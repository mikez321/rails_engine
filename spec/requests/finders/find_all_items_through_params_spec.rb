require 'rails_helper'

describe 'finding records through request' do
  it 'can find an item based on its attributes' do
    merchant1 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      item2 = create(:item, merchant_id: merchant1.id)
    merchant2 = create(:merchant)
      item3 = Item.create(name: 'Red Baloons',
                          description: 'They are red',
                          unit_price: 1.99,
                          merchant_id: merchant2.id)

      item4 = Item.create(name: 'Green Baloons',
                          description: 'They are green',
                          unit_price: 1.99,
                          merchant_id: merchant2.id)

      item5 = Item.create(name: 'Blue Baloons',
                          description: 'They are blue',
                          unit_price: 1.99,
                          merchant_id: merchant2.id)

      item6 = create(:item, merchant_id: merchant2.id)


    get "/api/v1/items/find_all?name=loon"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(3)
    ids = json[:data].map do |object|
      object[:id]
    end

    expect(ids).to include(item3.id.to_s)
    expect(ids).to include(item4.id.to_s)
    expect(ids).to include(item5.id.to_s)
    expect(ids).to_not include(item1.id.to_s)
    expect(ids).to_not include(item2.id.to_s)
    expect(ids).to_not include(item6.id.to_s)
  end
end
