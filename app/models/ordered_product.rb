class OrderedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :product_id, :order_id, :quantity,
			  		:price_including_tax, presence: true
	validates :price_including_tax, :quantity, numericality: { only_integer: true }

end
