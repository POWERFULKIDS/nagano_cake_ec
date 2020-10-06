class Public::AddressesController < ApplicationController

	def index
		@address = Address.new
		@addresses = Address.where(customer_id: current_customer.id)
	end

	def edit
	end

	def create
		@address = Address.new(address_params)
		@address.customer = current_customer
		@address.save
		redirect_back(fallback_location:addresses_path)
	end

	def update
	end

	def destroy
	end

	private
  	def address_params
  		params.require(:address).permit(:postcode, :address, :name)
  	end

end
