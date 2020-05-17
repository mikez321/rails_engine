require 'rails_helper'

describe 'searching through relationships' do
  xit 'can return all items associated with a merchant' do
    merchant1 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
    merchant2 = create(:merchant)
      item2 = create(:item, merchant_id: merchant2.id)
      item3 = create(:item, merchant_id: merchant2.id)
      item4 = create(:item, merchant_id: merchant2.id)
      item5 = create(:item, merchant_id: merchant2.id)


    get "/api/v1/items/#{item1.id}/merchants"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(Item.count).to eq(5)
    expect(json[:data].first[:type]).to eq('merchant')
    expect(json[:data].first[:id]).to eq(merchant1.id.to_s)
    expect(json[:data].count).to eq(1)
  end
end
