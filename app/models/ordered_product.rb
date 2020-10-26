class OrderedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order


  def each_total_payment
    ordered_quantity * price_including_tax
  end
  # 0 着手不可、1 制作待ち、2 製作中、3 制作完了
  enum production_status: { cannot: 0, waiting: 1, making: 2, compleate: 3}

  validates :product_id, :order_id, :quantity,
			  		:price_including_tax, presence: true
	validates :price_including_tax, :quantity, numericality: { only_integer: true }


end
