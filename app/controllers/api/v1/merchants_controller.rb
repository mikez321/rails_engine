class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    render json: MerchantSerializer.new(merchants).serializable_hash
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant).serializable_hash
  end

  def create
    merchant = Merchant.create(body_params)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(body_params)
    render json: MerchantSerializer.new(merchant).serializable_hash
  end

  private

  def body_params
    params.require('body').permit(:name)
  end
end
