require 'rails_helper'

describe 'searching through relationships' do
  it 'can return all items associated with a merchant' do
    merchant1 = create(:merchant)
    items = create_list(:item, 5, merchant_id: merchant1.id)
    merchant2 = create(:merchant)
    items2 = create_list(:item, 3, merchant_id: merchant2.id)

    get "/api/v1/merchants/#{merchant1.id}/items"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].count).to eq(5)

    json_merchant_id = json[:data].map do |item|
      item[:attributes][:merchant_id]
    end.uniq

    expect(json_merchant_id.length).to eq(1)
    expect(json_merchant_id.first).to eq(merchant1.id)
  end
end
