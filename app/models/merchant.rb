class Merchant < ApplicationRecord
  has_many :items
  validates_presence_of(:name)
  
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices, source: :invoice_items
  has_many :transactions, through: :invoices


  def items_ready_to_ship
    InvoiceItem.where(item: items).where.not(status: 2)
  end
end
