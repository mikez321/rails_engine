class Api::V1::Merchants::MerchantSearchController < ApplicationController
  def index
    merchant = Merchant.where("LOWER(name) LIKE ?", "%#{merchant_params['name'].downcase}%")
    merchant_json(merchant)
  end

  def show
    merchant = Merchant.find_by("LOWER(name) LIKE ?", "%#{merchant_params['name'].downcase}%")
    merchant_json(merchant)
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
