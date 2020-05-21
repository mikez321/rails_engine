class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    merchant = Merchant.most_revenue(merchant_params)
    render_json(merchant)
  end

  private

  def merchant_params
    params.permit(:quantity)
  end

  def render_json(merchant)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end
end
