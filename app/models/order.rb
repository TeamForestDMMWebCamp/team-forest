class Order < ApplicationRecord
  has_many :ordered_products
  belongs_to :customer

  enum payment_method: { credit: 0, bank: 1}
  enum order_recieved_status: { waiting: 0, payed: 1, making: 2, preparing: 3, sent: 4}

end
