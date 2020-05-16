require 'rails_helper'

RSpec.describe 'fakers' do
  it 'fakes stuff' do
    customer = create(:customer)
    merchant = create(:merchant)
  end
end
