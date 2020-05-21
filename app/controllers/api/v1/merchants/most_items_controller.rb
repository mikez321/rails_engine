class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    merchant = Merchant.most_items(merchant_params)
    merchant_json(merchant)
  end

  private

  def merchant_params
    params.permit(:quantity)
  end
end
