require 'rails_helper'

describe 'item api' do
  it 'is formatted by the json:api standards' do
    merchant = create(:merchant)
    item_list = create_list(:item, 5, merchant_id: merchant.id)

    get '/api/v1/items'

    merchants = JSON.parse(response.body)

    expect(merchants).to have_key('data')
    expect(merchants['data']).to be_an(Array)
    expect(merchants['data'].length).to eq(5)
    expect(merchants['data'].first).to have_key('id')
    expect(merchants['data'].first).to have_key('type')
    expect(merchants['data'].first).to have_key('attributes')
    expect(merchants['data'].first['attributes']).to have_key('name')
    expect(merchants['data'].first['attributes']).to have_key('description')
    expect(merchants['data'].first['attributes']).to have_key('unit_price')
    expect(merchants['data'].first['attributes']).to have_key('merchant_id')
  end
end
