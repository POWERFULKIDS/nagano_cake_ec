class Product < ApplicationRecord
	#productとcustomerを中間テーブルcart_productsでつなぐ
	has_many :cart_products
  	has_many :customers, through: :cart_products

  	#productとorderを中間テーブルordered_productsでつなぐ
  	has_many :ordered_products
  	has_many :orders, through: :ordered_products

	belongs_to :product_genre

	attachment :image
end
