class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    item_json(items)
  end

  def show
      item = Item.find(params[:id])
    item_json(item)
  end

  def create
    item = Item.create(item_params)
    item_json(item)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    item_json(item)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    item_json(item)
  end

  private

  def item_params
    params.permit(:name,
                  :description,
                  :unit_price,
                  :merchant_id)
  end
end
