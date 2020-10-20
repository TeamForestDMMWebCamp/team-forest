class Product < ApplicationRecord
  has_many :cart_products
  has_many :ordered_products
  belongs_to :genres
 

	#商品の税込み単価
  def including_tax
    (price_excluding_tax*1.1).round(0)
  end

  attachment :image
end
