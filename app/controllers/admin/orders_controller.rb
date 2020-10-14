class Admin::OrdersController < ApplicationController

	def index
		# urlにmethod(params)がある場合
		if params[:method] == "today"
		    # orderのデータベースのテーブルから今日注文のidを取得
		    @orders = Order.created_today.order(created_at: :desc)
		    # customer_idと紐づく投稿を取得
		elsif params[:method] == "customer"
			@customer = Customer.find(params[:customer_id]).order(created_at: :desc)
			@orders = @customer.orders
		else
		    # すべての注文を取得
	        @orders = Order.all.page(params[:page]).per(12)
    	end
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
  		params.require(:order).permit(:order_status, :created_at, :customer_id)
  	end

end