class Api::V1::Merchants::MerchantItemsController < ApplicationController
  def index
    items = Item.where(merchant_id: params[:merchant_id])
    render_json(items)
  end

  private

  def render_json(merchant)
    render json: ItemSerializer.new(merchant).serializable_hash
  end

end
