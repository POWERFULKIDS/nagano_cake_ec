class Public::CartProductsController < ApplicationController

    def index
    	@cart_products=CartProduct.all
        @cart_product = CartProduct.where(customer_id: current_customer.id)

    end

	

	def update
		@cart_product = CartProduct.find(params[:id])  
        if @cart_product.update(cart_product_params) 
        redirect_to cart_products_path
        end

    end

	def destroy
		@cart_product = CartProduct.find(params[:id])
		@cart_product.destroy
        redirect_to cart_products_path
    end
	

	def destroy_all
		@cart_products =CartProduct.all
		@cart_products.destroy_all
		redirect_to cart_products_path
	end

	def create

        @cart_product = CartProduct.new(cart_product_params)
        @cart_product.customer_id = current_customer.id
        if @cart_product.save
        redirect_to cart_products_path
        else
        session[:cart_product] = @cart_product.attributes.slice(*@cart_product.id)
        @product_genres = ProductGenre.all
        @product = Product.find_by(id:@cart_product.product_id)
        redirect_to products_path
        end
	end

    private
    def cart_product_params
        params.require(:cart_product).permit(:product_id, :amount)
    end

end
