require 'rails_helper'

describe 'merchant API' do
  it 'can return all merchants' do
    merchant_list = create_list(:merchant, 4)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(4)
    expect(merchants.first['name']).to eq(merchant_list.first['name'])
  end
end
