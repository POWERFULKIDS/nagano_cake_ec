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
		redirect_back(fallback_location: root_path)
	end

	private
  	def order_params
  		params.require(:order).permit(:customer_is, :postcode, :address, :name, :fee, :total_payment, :order_status, :payment_method)
  	end

end