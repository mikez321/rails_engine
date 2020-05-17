require 'rails_helper'

describe 'Items API' do
  it 'can see an individual item' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)
    item2 = create(:item, merchant_id: merchant.id)
    get "/api/v1/items/#{item1.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items['data']['id']).to eq(item1.id.to_s)
    expect(items['data']['attributes']['name']).to_not eq(item2.name)
  end
end
