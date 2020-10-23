class Order < ApplicationRecord
  has_many :ordered_products
  belongs_to :customer

  enum payment_method: { credit: 0, bank: 1}

  def order_shippings
    shipping_postal_code + "　" + shipping_address + "　" + shipping_name
  end

end
