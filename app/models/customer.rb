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

  has_many :cart_products
  has_many :orders
  has_many :shipping_addresses

  def name
    last_name + first_name
  end

  enum is_deleted: {active: false, inactive: true}

  def active_for_authentication?
    super && (self.is_deleted == "active")
  end
  # is_deletedがfalseならログイン可能
end
