class Order < ApplicationRecord
  has_many :ordered_products
  belongs_to :customer
  
  def order_total_amount
    order_products = OrderdProduct.where(order_id: self.id)
    quantity_list = []
    order_products.each do |product|
    quantity_list.push(product.ordered_quantity)
  end
    return quantity_list.sum
  end
  
  def ordered_products_total_amoun
  end
  
end
