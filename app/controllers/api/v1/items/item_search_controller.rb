class Api::V1::Items::ItemSearchController < ApplicationController
  def index
    item = Item.where("LOWER(#{item_params.keys.first}) LIKE ?", "%#{item_params.values.first.downcase}%")
    render_json(item)
  end

  def show
    item = Item.find_by("LOWER(#{item_params.keys.first}) LIKE ?", "%#{item_params.values.first.downcase}%")
    render_json(item)
  end

  private

  def item_params
    params.permit(:name,
                  :description,
                  :unit_price,
                  :merchant_id)
  end

  def render_json(item)
    render json: ItemSerializer.new(item).serializable_hash
  end
end
