class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all
		@total_amount = @orders.ordered_product.sum(:amount)
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
	end

end