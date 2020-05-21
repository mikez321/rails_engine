class Api::V1::Items::ItemMerchantController < ApplicationController
  def show
    merchant_id = Item.find(params[:item_id]).merchant_id
    merchant = Merchant.find(merchant_id)
    render_json(merchant)
  end

  private

  def render_json(merchant)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end
end
