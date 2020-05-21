class Api::V1::Items::ItemSearchController < ApplicationController
  def index
    item = Item.all_with_params(item_params)
    item_json(item)
  end

  def show
    item = Item.find_with_params(item_params)
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
