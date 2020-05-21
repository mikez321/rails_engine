class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items

  def self.multi_find(item_params)
    Item.where("#{item_params.keys.first} LIKE ?", "%#{item_params.values.first}%")
        .find_by("#{item_params.keys.last} LIKE ?", "%#{item_params.values.last}%")
  end
end
