class Item < ApplicationRecord
	has_many :invoice_items
	belongs_to	:merchant 
  has_many :invoices, through: :invoice_items

  
  validates_presence_of :name, :description, :unit_price
  validates :unit_price , numericality: { only_integer: true }
  validates :unit_price , numericality: { greater_than: 0 }
  enum status: {"enabled" => 0, "disabled" => 1}
  
    def selling_price
        BigDecimal(unit_price.to_f/100, 5)
    end

    def self.enabled_items
      where(status: 'enabled')
    end

    def self.disabled_items
      where(status: 'disabled')
   end

end