class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #productとcustomerを中間テーブルcart_productsでつなぐ
  has_many :cart_products
  has_many :products, through: :cart_products

  has_many :orders
  has_many :addresses

end
