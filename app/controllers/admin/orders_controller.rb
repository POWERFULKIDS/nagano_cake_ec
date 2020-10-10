class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		# 注文ステータスの更新
		Order.find(params[:order][:order_status]).update(order_params)
		redirect_back(fallback_location: root_path)
		# 製作ステータスの更新
		OrderedProduct.find(params[:ordered_product][:make_status]).update(ordered_product_params)
		redirect_back(fallback_location: root_path)
	end

end