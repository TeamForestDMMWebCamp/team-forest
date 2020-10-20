class Genre < ApplicationRecord
  has_many :products
  enum is_active: {Availble: true, Invalid: false}
   validates :name, presence: true
end
