class Api::V1::Merchants::MerchantSearchController < ApplicationController
  def index
    merchant = Merchant.all_with_params(merchant_params)
    merchant_json(merchant)
  end

  def show
    merchant = Merchant.find_with_params(merchant_params)
    merchant_json(merchant)
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
