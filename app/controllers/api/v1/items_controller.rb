class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render_json(items)
  end

  def show
    item = Item.find(params[:id])
    render_json(item)
  end

  private

  def render_json(item)
    render json: ItemSerializer.new(item).serializable_hash
  end
end
