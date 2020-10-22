class Order < ApplicationRecord
  has_many :ordered_products
  belongs_to :customer

  enum payment_method: { credit: 0, bank: 1}
end
