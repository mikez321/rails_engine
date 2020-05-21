class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    merchant = Merchant.most_items(merchant_params)
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
