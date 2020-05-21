class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    merchant_json(merchants)
  end

  def show
    merchant = Merchant.find(params[:id])
    merchant_json(merchant)
  end

  def create
    merchant = Merchant.create(merchant_params)
    merchant_json(merchant)
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(merchant_params)
    merchant_json(merchant)
  end

  def destroy
    merchant = Merchant.find(params[:id])
    merchant.destroy
    merchant_json(merchant)
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
