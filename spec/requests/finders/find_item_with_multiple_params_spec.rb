require 'rails_helper'

describe 'finding records through request' do
  it 'can find an item based on its attributes' do
    merchant1 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      item2 = create(:item, merchant_id: merchant1.id)
    merchant2 = create(:merchant)
      item3 = Item.create(name: 'Red Baloons',
                          description: 'They are red',
                          unit_price: 1.99,
                          merchant_id: merchant2.id)

      item4 = Item.create(name: 'Avaitor Sunglasses',
                          description: 'They go well with a mustache',
                          unit_price: 69.99,
                          merchant_id: merchant2.id)

      item5 = Item.create(name: 'Oakley Sutro Sunglasses',
                          description: 'They are big and badass',
                          unit_price: 139.99,
                          merchant_id: merchant2.id)

      item6 = create(:item, merchant_id: merchant2.id)


    get "/api/v1/items/find?name=glasses&description=badass"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)

    expect(json[:data]).to have_key(:attributes)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('item')
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(item5.id.to_s)
  end
end
