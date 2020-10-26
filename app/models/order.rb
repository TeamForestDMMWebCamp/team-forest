class Order < ApplicationRecord
  has_many :ordered_products
  belongs_to :customer

    enum payment_method: { credit: 0, bank: 1}
    # 0入金待ち、1入金済み、2製作中、3発送準備中、4発送済み
    enum order_received_status: { waiting: 0, payed: 1, making: 2, preparing: 3, sent: 4}

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

end
