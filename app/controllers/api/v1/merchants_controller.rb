class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    render_json(merchants)
  end

  def show
    if params[:id] == 'find_all'
      merchant = Merchant.where("LOWER(name) LIKE ?", "%#{merchant_params['name'].downcase}%")
    elsif params[:id] == 'find'
      merchant = Merchant.find_by("LOWER(name) LIKE ?", "%#{merchant_params['name'].downcase}%")
    elsif params[:item_id]
      id = Item.find(params[:item_id]).merchant_id
      merchant = Merchant.find(id)
    else
      merchant = Merchant.find(params[:id])
    end
    render_json(merchant)
  end

  def create
    merchant = Merchant.create(merchant_params)
    render_json(merchant)
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)
    render_json(merchant)
  end

  def destroy
    merchant = Merchant.find(params[:id])
    merchant.destroy
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
