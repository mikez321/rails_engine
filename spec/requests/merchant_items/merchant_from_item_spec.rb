require 'rails_helper'

describe 'searching through relationships' do
  it 'can return all items associated with a merchant' do
    merchant1 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      item2 = create(:item, merchant_id: merchant1.id)
    merchant2 = create(:merchant)
      item3 = create(:item, merchant_id: merchant2.id)
      item4 = create(:item, merchant_id: merchant2.id)
      item5 = create(:item, merchant_id: merchant2.id)


    get "/api/v1/items/#{item1.id}/merchant"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(Item.count).to eq(5)
    expect(json[:data].keys).to include(:id)
    expect(json[:data].keys).to include(:type)
    expect(json[:data].keys).to include(:attributes)
    expect(json[:data][:type]).to eq('merchant')
    expect(json[:data][:id]).to eq(merchant1.id.to_s)
  end
end
