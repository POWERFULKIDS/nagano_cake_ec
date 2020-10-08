class OrderedProduct < ApplicationRecord
	# productとorderの中間テーブル
	belongs_to :product
	belongs_to :order

	# 製作ステータス
	enum make_status: { making: 0, makewaiting: 1, makeproduction: 2, done: 3 }
end
