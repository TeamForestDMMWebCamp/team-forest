class Product < ApplicationRecord
  has_many :cart_products
  has_many :ordered_products
  belongs_to :genre
  attachment :image
  enum is_active: {Availble: true, Invalid: false}

  def including_tax
    (price_excluding_tax * 1.1).round(0)
  end

end
