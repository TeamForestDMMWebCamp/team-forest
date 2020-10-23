class Order < ApplicationRecord
  has_many :ordered_products
  belongs_to :customer

  # ↓ordered_productsテーブルに、orderと同時にデータを格納できるように紐づけ
  accepts_nested_attributes_for :ordered_products

  enum payment_method: { credit: 0, bank: 1}
  enum order_recieved_status: { waiting: 0, payed: 1, making: 2, preparing: 3, sent: 4}

end
