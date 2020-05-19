require 'rails_helper'

describe 'finding records through request' do
  it 'can find an item based on its attributes' do
    merchant1 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      item2 = create(:item, merchant_id: merchant1.id)
    merchant2 = create(:merchant)
      item3 = create(:item, merchant_id: merchant2.id)
      item4 = create(:item, merchant_id: merchant2.id)

      item5 = Item.create(name: 'Oakley Sutro Sunglasses',
                          description: 'They are big and badass',
                          unit_price: 139.99,
                          merchant_id: merchant2.id)


    get "/api/v1/items/find?name=Oakley"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to eq(item5.id.to_s)
  end

  it 'can find an item by part of its attributes' do
    merchant2 = create(:merchant)
      item3 = create(:item, merchant_id: merchant2.id)
      item4 = create(:item, merchant_id: merchant2.id)

      item5 = Item.create(name: 'Oakley Sutro Sunglasses',
                          description: 'They are big and badass',
                          unit_price: 139.99,
                          merchant_id: merchant2.id)


    get "/api/v1/items/find?name=glasses"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:id]).to eq(item5.id.to_s)
  end

  it 'can find an item and is case insensitive' do
    merchant2 = create(:merchant)
      item3 = create(:item, merchant_id: merchant2.id)
      item4 = create(:item, merchant_id: merchant2.id)

      item5 = Item.create(name: 'Oakley Sutro Sunglasses',
                          description: 'They are big and badass',
                          unit_price: 139.99,
                          merchant_id: merchant2.id)


    get "/api/v1/items/find?name=sutr"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:id]).to eq(item5.id.to_s)
  end

  it 'can find an item by description' do
    merchant2 = create(:merchant)
      item3 = create(:item, merchant_id: merchant2.id)
      item4 = create(:item, merchant_id: merchant2.id)

      item5 = Item.create(name: 'Oakley Sutro Sunglasses',
                          description: 'They are big and badass',
                          unit_price: 139.99,
                          merchant_id: merchant2.id)


    get "/api/v1/items/find?description=badass"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:id]).to eq(item5.id.to_s)
  end

  # it 'can find an item by price' do
  #   merchant2 = create(:merchant)
  #     item3 = create(:item, merchant_id: merchant2.id)
  #     item4 = create(:item, merchant_id: merchant2.id)
  #
  #     item5 = Item.create(name: 'Oakley Sutro Sunglasses',
  #                         description: 'They are big and badass',
  #                         unit_price: 139.99,
  #                         merchant_id: merchant2.id)
  #
  #
  #   get "/api/v1/items/find?unit_price=139"
  #
  #   expect(response).to be_successful
  #
  #   json = JSON.parse(response.body, symbolize_names: true)
  #   expect(json[:data].length).to eq(1)
  #   expect(json[:data].first[:id]).to eq(item5.id.to_s)
  # end
end
