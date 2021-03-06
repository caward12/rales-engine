class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.top_sold_quantity(limit)
    select('items.*, count(invoice_items.id) AS item_count').
    joins(invoice_items: [{invoice: :transactions}]).
    merge(Transaction.successful).
    group('items.id').
    order('item_count DESC').
    limit(limit)
  end

  def self.top_revenue(limit)
    select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue').
    joins(invoice_items: [{invoice: :transactions}]).
    merge(Transaction.successful).
    group('items.id').
    order('revenue DESC').
    limit(limit)
  end

end
