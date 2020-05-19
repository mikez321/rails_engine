class Api::V1::ItemsController < ApplicationController
  def index
    if params[:merchant_id]
      items = Item.where(merchant_id: params[:merchant_id])
    else
      items = Item.all
    end
    render_json(items)
  end

  def show
    if params[:id] == 'find_all' && !item_params.empty?
      item = Item.where("LOWER(#{item_params.keys.first}) LIKE ?", "%#{item_params.values.first.downcase}%")
    elsif params[:id] == 'find'
      item = Item.where("LOWER(#{item_params.keys.first}) LIKE ?", "%#{item_params.values.first.downcase}%").limit(1)
    else
      item = Item.find(params[:id])
    end
    render_json(item)
  end

  def create
    item = Item.create(item_params)
    render_json(item)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    render_json(item)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
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
