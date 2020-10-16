class OrderdProduct < ApplicationRecord
  belongs_to :products
  belongs_to :orders
end
