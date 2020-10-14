class Public::ProductsController < ApplicationController
	PER = 8

	def top
		@product_genres = ProductGenre.all
		@product1 = Product.find(1)
		@product2 = Product.find(2)
		@product3 = Product.find(3)
		@product4 = Product.find(4)
	end

	def about
	end

	def index
		@product_genres = ProductGenre.all
		# urlにcategory_id(params)がある場合
        if params[:product_genre_id]
		    # Categoryのデータベースのテーブルから一致するidを取得
		    @product_genre = ProductGenre.find(params[:product_genre_id])
		    # category_idと紐づく投稿を取得
		    @products = @product_genre.products.order(created_at: :desc).all.page(params[:page]).per(8)
		else
		    # 投稿すべてを取得
	        @products = Product.order(created_at: :desc).all.page(params[:page]).per(8)
    	end
	end

	def show
		@product =Product.find(params[:id])
		@product_genres = ProductGenre.all
		@cart_product=CartProduct.new
	end

end
