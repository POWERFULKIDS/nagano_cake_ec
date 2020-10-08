class CartProduct < ApplicationRecord
	#customerとproductの中間テーブル
	belongs_to :customer
	belongs_to :product



end
