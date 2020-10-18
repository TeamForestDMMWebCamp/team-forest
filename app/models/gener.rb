class Gener < ApplicationRecord
  has_many :products
  enum is_active: {Availble: true, Invalid: false}
end
