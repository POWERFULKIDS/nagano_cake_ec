class Order < ApplicationRecord
	#productとorderを中間テーブルordered_productsでつなぐ
  	has_many :ordered_products
  	has_many :products, through: :ordered_products

	belongs_to :customer
	has_many :ordered_products



	enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
end
