class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  def self.most_items(merchants_requested)
    require "pry"; binding.pry
  end
end
