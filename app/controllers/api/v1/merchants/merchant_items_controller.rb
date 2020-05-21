class Api::V1::Merchants::MerchantItemsController < ApplicationController
  def index
    items = Item.where(merchant_id: params[:merchant_id])
    item_json(items)
  end
end
