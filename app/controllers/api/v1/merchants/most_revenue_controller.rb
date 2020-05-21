class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    merchant = Merchant.most_revenue(merchant_params)
    merchant_json(merchant)
  end

  private

  def merchant_params
    params.permit(:quantity)
  end
end
