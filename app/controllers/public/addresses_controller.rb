class Public::AddressesController < ApplicationController

	def index
		@address = Address.new
		@addresses = Address.where(customer_id: current_customer.id).all.page(params[:page]).per(12)
	end

	def edit
		@address = Address.find(params[:id])
	end

	def create
		@address = Address.new(address_params)
		@address.customer = current_customer
		@address.save
		redirect_back(fallback_location:addresses_path)
	end

	def update
		address = Address.find(params[:id])
		address.update(address_params)
		redirect_to addresses_path
	end

	def destroy
		@address = Address.find(params[:id])
    	@address.destroy
    	redirect_to addresses_path
	end

	private
  	def address_params
  		params.require(:address).permit(:postcode, :address, :name)
  	end

end
