require 'rails_helper'

describe 'finding records through request' do
  it 'can find an item based on its attributes' do
    merchant1 = Merchant.create(name: "King Bill's Thrones")
    merchant2 = Merchant.create(name: "Wheels Etc")
    merchant3 = Merchant.create(name: "Doug's Cakes")
    merchant4 = Merchant.create(name: "All About Eels")
    merchant5 = Merchant.create(name: "High Keels")

    get "/api/v1/merchants/find_all?name=eel"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(3)
    ids = json[:data].map do |object|
      object[:id]
    end

    expect(ids).to include(merchant2.id.to_s)
    expect(ids).to include(merchant4.id.to_s)
    expect(ids).to include(merchant5.id.to_s)
    expect(ids).to_not include(merchant1.id.to_s)
    expect(ids).to_not include(merchant3.id.to_s)
  end
end
