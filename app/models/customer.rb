class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :zip_code, length: {is: 7}, numericality: { only_integer: true }

  has_many :cart_products
  has_many :orders
  has_many :shipping_addresses
  
  enum is_deleted: {Availble: false, Invalid: true}
  
  def kana_name
      kana_last_name + kana_first_name
  end
  def name
      last_name + first_name
  end

  def active_for_authentication?
    super && (self.is_deleted == "Availble")
  end
  # is_deletedがfalseならログイン可能

end
