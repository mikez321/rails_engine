class Api::V1::Items::ItemMerchantController < ApplicationController
  def show
    merchant_id = Item.find(params[:item_id]).merchant_id
    merchant = Merchant.find(merchant_id)
    merchant_json(merchant)
  end
end
