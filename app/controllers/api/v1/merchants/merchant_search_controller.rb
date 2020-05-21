class Api::V1::Merchants::MerchantSearchController < ApplicationController
  def index
    merchant = Merchant.where("LOWER(name) LIKE ?", "%#{merchant_params['name'].downcase}%")
    render_json(merchant)
  end

  def show
    merchant = Merchant.find_by("LOWER(name) LIKE ?", "%#{merchant_params['name'].downcase}%")
    render_json(merchant)
  end

  private

  def merchant_params
    params.permit(:name)
  end

  def render_json(merchant)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end
end
