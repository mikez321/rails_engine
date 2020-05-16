require 'rails_helper'

describe 'Items API' do
  it 'sends a list of items' do
    merchant = create(:merchant)
    item_list = create_list(:item, 5, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(5)
    expect(items.first['name']).to eq(item_list.first['name'])
  end
end
