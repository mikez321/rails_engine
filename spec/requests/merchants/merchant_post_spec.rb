require 'rails_helper'

describe 'merchant_api' do
  it 'can create a new merchant' do
    create_list(:merchant, 4)
    expect(Merchant.count).to eq(4)

    body = { name: "Jim's Bikes and Leather" }

    post '/api/v1/merchants', params: body

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:name]).to eq(body[:name])

    expect(Merchant.count).to eq(5)
  end
end
