class Public::CustomersController < ApplicationController

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
		redirect_to customer_path(@customer)
	end

	def delete_page
		@customer = Customer.find(current_customer.id)
	end

	def withdraw
		@customer = Customer.find(current_customer.id)
		@customer.update(customer_status: true)
		#customer_statusカラムにフラグを立てる　default:false（有効会員)からtrue（退会済）へ
		reset_session
		#ログアウトさせる
		redirect_to root_path
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone, :customer_status)
	end

end
