require 'rails_helper'

describe 'Items API' do
  it 'can update an item' do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    old_id = item.id
    old_name = item.name
    old_price = item.unit_price

    body = { name: 'Ruckus',
             description: 'It brings the ruckus',
             unit_price: 1129.99
           }

    patch "/api/v1/items/#{item.id}", params: { body: body }

    expect(response).to be_successful

    json = JSON.parse(response.body)

    expect(json['data']['id']).to eq(old_id.to_s)
    expect(json['data']['attributes']['name']).to_not eq(old_name)
    expect(json['data']['attributes']['unit_price']).to_not eq(old_price)
    expect(json['data']['attributes']['name']).to eq(body[:name])
  end
end
