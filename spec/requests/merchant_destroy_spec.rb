require 'rails_helper'

describe 'merchant_api' do
  it 'can delete a merchant' do
    merchant_list = create_list(:merchant, 5)
    merchant = merchant_list.last
    expect(Merchant.count).to eq(5)

    delete "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:id]).to eq(merchant.id.to_s)
    expect(Merchant.count).to eq(4)
  end
end
