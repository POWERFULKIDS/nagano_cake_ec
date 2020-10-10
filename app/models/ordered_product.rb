class OrderedProduct < ApplicationRecord
	# productとorderの中間テーブル
	belongs_to :product
	belongs_to :order, optional: true

	# 製作ステータス
	enum make_status: { makeng: 0, makewaiting: 1, makeproduction: 2, done: 3 }
end
