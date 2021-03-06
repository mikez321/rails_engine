class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :items

  def self.most_items(merchants_requested)
    Merchant.joins(:invoice_items)
            .joins(:transactions)
            .where(transactions: { result: 'success'} )
            .group(:id)
            .select('merchants.id, merchants.name, sum(invoice_items.quantity) as total_sold')
            .order('total_sold desc')
            .limit(merchants_requested[:quantity])
  end

  def self.most_revenue(merchants_requested)
    Merchant.joins([:invoice_items, :transactions])
            .where(transactions: {result: 'success'})
            .select('merchants.id, merchants.name, sum(invoice_items.unit_price * invoice_items.quantity) as revenue')
            .group(:id, :name)
            .order('revenue desc')
            .limit(merchants_requested[:quantity])
  end

  def self.all_with_params(merchant_params)
    Merchant.where("LOWER(name) LIKE ?", "%#{merchant_params['name'].downcase}%")
  end

  def self.find_with_params(merchant_params)
    Merchant.find_by("LOWER(name) LIKE ?", "%#{merchant_params['name'].downcase}%")
  end
end
