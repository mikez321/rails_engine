class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :items

  def self.most_items(merchants_requested)
    require "pry"; binding.pry
  end
end
