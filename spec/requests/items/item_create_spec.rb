require 'rails_helper'

describe 'Items API' do
  it 'can see an individual item' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)
    item2 = create(:item, merchant_id: merchant.id)

    expect(Item.count).to eq(2)

    body = { name: 'Ray Gun',
             description: 'pew pew pew',
             unit_price: 149.99,
             merchant_id: merchant.id
           }

    post "/api/v1/items", params: { body: body }

    expect(response).to be_successful

    json = JSON.parse(response.body)

    expect(Item.count).to eq(3)
    expect(json['data']['attributes']['name']).to eq('Ray Gun')
  end
end
