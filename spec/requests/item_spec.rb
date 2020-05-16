require 'rails_helper'

describe 'Items API' do
  it 'sends a list of items' do
    merchant = create(:merchant)
    item_list = create_list(:item, 5, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items['data'].count).to eq(5)
    expect(items['data'].first['id']).to eq(item_list.first.id.to_s)
  end

  it 'is formatted in json:api spec' do
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
  end
end
