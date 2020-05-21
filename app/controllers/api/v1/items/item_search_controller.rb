class Api::V1::Items::ItemSearchController < ApplicationController
  def index
    item = Item.where("LOWER(#{item_params.keys.first}) LIKE ?", "%#{item_params.values.first.downcase}%")
    item_json(item)
  end

  def show
    if item_params.keys.length > 1
      item = Item.multi_find(item_params)
    else
      item = Item.find_by("LOWER(#{item_params.keys.first}) LIKE ?", "%#{item_params.values.first.downcase}%")
    end
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
