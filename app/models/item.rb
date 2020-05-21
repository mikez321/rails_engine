class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  def self.find_with_multi_params(item_params)
    Item.where("#{item_params.keys.first} LIKE ?", "%#{item_params.values.first}%")
        .find_by("#{item_params.keys.last} LIKE ?", "%#{item_params.values.last}%")
  end

  def self.all_with_params(item_params)
    Item.where("LOWER(#{item_params.keys.first}) LIKE ?",
               "%#{item_params.values.first.downcase}%")
  end

  def self.find_with_single_param(item_params)
    Item.find_by("LOWER(#{item_params.keys.first}) LIKE ?",
                 "%#{item_params.values.first.downcase}%")
  end

  def self.find_with_params(item_params)
    if item_params.keys.length > 1
      item = Item.find_with_multi_params(item_params)
    else
      item = Item.find_with_single_param(item_params)
    end
  end
end
