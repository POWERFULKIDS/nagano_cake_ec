class Admin::OrderedProductsController < ApplicationController

	# 製作ステータスの更新
	def update
		@order = OrderedProduct.find(params[:id])
		@order.update(ordered_product_params)
		redirect_back(fallback_location: root_path)
	end

	private
  	def ordered_product_params
  		params.require(:ordered_product).permit(:make_status)
  	end

end
