require 'rails_helper'

describe 'merchant api' do
  it 'is formatted in json:api spec' do
    merchant_list = create_list(:merchant, 4)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)

    expect(merchants).to have_key('data')
    expect(merchants['data']).to be_an(Array)
    expect(merchants['data'].length).to eq(4)
    expect(merchants['data'].first).to have_key('id')
    expect(merchants['data'].first).to have_key('type')
    expect(merchants['data'].first).to have_key('attributes')
    expect(merchants['data'].first['attributes']).to have_key('name')
  end
end
