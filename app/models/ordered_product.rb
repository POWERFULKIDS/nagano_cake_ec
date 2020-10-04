class OrderedProduct < ApplicationRecord
	#productとorderの中間テーブル
	belongs_to :product
	belongs_to :order
end
