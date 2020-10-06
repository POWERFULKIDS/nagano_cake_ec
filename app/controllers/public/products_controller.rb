class Public::ProductsController < ApplicationController

	def top
		@product_genres = ProductGenre.all
	end

	def about
	end

	def index
	end

	def show
	end

end
