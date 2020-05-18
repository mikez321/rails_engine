require 'rails_helper'

describe 'finding records through request' do
  it 'can find a merchant based on its attributes' do
    create_list(:merchant, 4)
    merchant5 = Merchant.create(name: 'Blown Away Baloon Co')

    get "/api/v1/merchants/find?name=#{merchant5.name}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].first[:id]).to eq(merchant5.id.to_s)
    expect(json[:data].length).to eq(1)
  end

  it 'can find a merchant without a whole name' do
    merchant1 = Merchant.create(name: 'Up Up & Away Kite Co')
    merchant2 = Merchant.create(name: 'Blown Away Baloon Co')
    merchant3 = Merchant.create(name: 'Highway Two')

    get "/api/v1/merchants/find?name=High"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(1)
    expect(json[:data].first[:id]).to eq(merchant3.id.to_s)
  end

  it 'can find a merchant and is case insensitive' do
    merchant1 = Merchant.create(name: 'Up Up & Away Kite Co')
    merchant2 = Merchant.create(name: 'Blown Away Baloon Co')
    merchant3 = Merchant.create(name: 'Highway Two')

    get "/api/v1/merchants/find?name=ba"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(1)
    expect(json[:data].first[:id]).to eq(merchant2.id.to_s)
  end
end
