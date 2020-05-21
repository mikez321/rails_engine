class ApplicationController < ActionController::API
  def item_json(item)
    render json: ItemSerializer.new(item).serializable_hash
  end

  def merchant_json(merchant)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end
end
