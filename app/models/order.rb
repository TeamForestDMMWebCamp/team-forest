class Order < ApplicationRecord
  has_many :ordered_products
  belongs_to :customer

  def order_total_amount
    order_products = OrderedProduct.where(order_id: self.id)
    quantity_list = []
    order_products.each do |product|
    quantity_list.push(product.ordered_quantity)
  end
    return quantity_list.sum
  end

  def name_address_shipping
    shipping_postal_code + shipping_address
  end

  validates :customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :shipping_fee, :total_payment, :payment_method, presence: true
	validates :shipping_postal_code, length: {is: 7}, numericality: { only_integer: true }
	validates :shipping_fee, :total_payment, numericality: { only_integer: true }
  enum payment_method: { credit: 0, bank: 1}
  # 0入金待ち、1入金確認、2製作中、3発送準備中、4発送済み
  enum order_received_status: { waiting: 0, paid: 1, making: 2, preparing: 3, sent: 4}

end
