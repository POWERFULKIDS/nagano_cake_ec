class Admin::AdminsController < ApplicationController
	def top
		@today_order = Order.created_today.count
	end
end
