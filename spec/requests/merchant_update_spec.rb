require 'rails_helper'

describe 'merchant_api' do
  it 'can update a merchant' do
    merchant = create(:merchant)
    old_name = merchant.name

    body = { name: "Jim's Bikes and Leather" }

    patch "/api/v1/merchants/#{merchant.id}", params: body

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:name]).to_not eq(old_name)
    expect(json[:data][:attributes][:name]).to eq(body[:name])
  end
end
