class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])

	end

	# 注文ステータスの更新
	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		if @order.order_status == "deposited"
			@order.ordered_products.each do |ordered_product|
				ordered_product.update(make_status: "makewaiting")
			end
		end
		redirect_back(fallback_location: root_path)
	end

	private
  	def order_params
  		params.require(:order).permit(:order_status)
  	end

end