class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    render_json(merchants)
  end

  def show
    merchant = Merchant.find(params[:id])
    render_json(merchant)
  end

  def create
    merchant = Merchant.create(body_params)
    render_json(merchant)
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(body_params)
    render_json(merchant)
  end

  def destroy
    merchant = Merchant.find(params[:id])
    merchant.destroy
    render_json(merchant)
  end

  private

  def body_params
    params.require('body').permit(:name)
  end

  def render_json(merchant)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end
end
