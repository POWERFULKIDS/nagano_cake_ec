class Admin::OrderedProductsController < ApplicationController

	# 製作ステータスの更新
	def update
		@ordered_product = OrderedProduct.find(params[:id])
		@ordered_product.update(ordered_product_params)
		@order = @ordered_product.order
			if @ordered_product.make_status == "makeproduction"
				@order.update(order_status: "production")
			elsif @ordered_product.make_status == "done"
				@order.update(order_status: "preparation")
			end
		redirect_back(fallback_location: root_path)
	end

	private
  	def ordered_product_params
  		params.require(:ordered_product).permit(:make_status)
  	end

end
