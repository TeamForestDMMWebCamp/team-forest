class Order < ApplicationRecord
  has_many :ordered_products
  belongs_to :customer

  validates :customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :shipping_fee, :total_payment, :payment_method, presence: true

  enum payment_method: { credit: 0, bank: 1}
  # 0入金待ち、1入金済み、2製作中、3発送準備中、4発送済み
  enum order_recieved_status: { waiting: 0, payed: 1, making: 2, preparing: 3, sent: 4}

end
