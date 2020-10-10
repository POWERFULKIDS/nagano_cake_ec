class Order < ApplicationRecord
	#productとorderを中間テーブルordered_productsでつなぐ
  	has_many :ordered_products
  	has_many :products, through: :ordered_products

	belongs_to :customer
	has_many :ordered_products

	# 注文ステータス
	enum order_status: { waiting: 0, deposited: 1, production: 2, preparation: 3, sent: 4 }

	# 支払い方法
	enum payment_method: { card: 0, transfer: 1 }

	# 当日注文された件数
	scope :created_today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

end
