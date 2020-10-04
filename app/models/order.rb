class Order < ApplicationRecord
	#productとorderを中間テーブルordered_productsでつなぐ
  	has_many :ordered_products
  	has_many :products, through: :ordered_products

	belongs_to :customer
	has_many :ordered_products
end
