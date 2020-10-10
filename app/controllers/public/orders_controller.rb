class Public::OrdersController < ApplicationController

	def new
	end

	def confirm
	end

	def thanks
	end

	def create
	end

	def index
		@order = Order.where(customer_id: current_customer.id)
		#@orders = @order.find(params[:id])

	end

	def show
		@order = Order.find(params[:id])
		@orders = Order.where(customer_id: current_customer.id)
	end

	private
  	def order_params
  		params.require(:order).permit(:postcode, :address, :name, :fee, :total_payment, :order_status, :payment_method)
  	end

end
