class Product < ApplicationRecord
  has_many :cart_products
  has_many :ordered_products
  belongs_to :genres
  attachment :profile_image
end
