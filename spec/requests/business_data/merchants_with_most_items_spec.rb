require 'rails_helper'

describe 'merchant business metrics' do
  it 'can return the merchant with the most sold items' do

    get '/api/v1/merchants/most_items?quantity=3'

    expect(response).to be_successful
  end
end
