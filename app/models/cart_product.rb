class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :products

  validates :customer_id, :product_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }
end
