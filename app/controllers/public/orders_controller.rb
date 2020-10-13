class Public::OrdersController < ApplicationController

	def new
		@address=Address.new
		@order=Order.new

	end

	def comfirm
		@cart_products=CartProduct.all
		@order=Order.new

		if params[:order][:address1] == 0.to_s
 		@order.postcode = current_customer.postcode
		@order.address = current_customer.address
		@order.name = current_customer.last_name + current_customer.first_name

	    elsif params[:order][:address1] == 1.to_s
	    address = Address.find(params[:order][:address_id])
	    @order.address = address.address
	    @order.postcode = address.postcode
	    @order.name = address.name

	    else @order.address = params[:order][:address].to_s
	    	 @order.postcode = params[:order][:postcode]
	    	 @order.name =params[:order][:name]
	    end
	end


	def thanks
	end

	def create
		@order = Order.new(order_params)

		if params[:address_method] == 2.to_s
			address = Address.new
			address.address = @order.address
			address.postcode =@order.postcode
			address.name = @order.name
			address.customer_id = current_customer.id
			address.save
		end


		@order.customer_id = current_customer.id
		@cart_products =current_customer.cart_products
        if @order.save!
            @cart_products.each do |cart_product|
                ordered_product =OrderedProduct.new
                ordered_product.price = cart_product.product.price
                ordered_product.amount = cart_product.amount
                ordered_product.order_id = @order.id
            	ordered_product.product_id =cart_product.product_id
            	ordered_product.save
            end

		@cart_products.destroy_all
        render :thanks
        else
    	@cart_products=CartProduct.all
        redirect_to cart_products_path
	    end
    end

	def index
		@order = Order.where(customer_id: current_customer.id)
		#@orders = @order.find(params[:id])


	end

	def show

		@order =Order.find(params[:id])

		@order = Order.find(params[:id])
		@orders = Order.where(customer_id: current_customer.id)

	end

	private
  	def order_params

  		params.require(:order).permit(:order_status, :fee, :address_id, :address_method, :payment_method, :address, :name, :postcode, :customer_id, :total_payment, address_attributes:[:id, :name, :postcode, :address])

  	end

end
