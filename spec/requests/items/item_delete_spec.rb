require 'rails_helper'

describe 'item api' do
  it 'can delete an item' do
    merchant = create(:merchant)
    item_list = create_list(:item, 5, merchant_id: merchant.id)
    item_to_delete = item_list.last

    expect(Item.count).to eq(5)

    delete "/api/v1/items/#{item_to_delete.id}"

    expect(response).to be_successful

    json = JSON.parse(response.body)

    expect(json['data']['id']).to eq(item_to_delete.id.to_s)
    expect(Item.count).to eq(4)
  end
end
