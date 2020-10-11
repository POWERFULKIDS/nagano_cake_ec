class Admin::ProductGenresController < ApplicationController

  def index
  	@genre = ProductGenre.new
  	@genres = ProductGenre.all
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    product_genre = ProductGenre.new(product_genre_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    product_genre.save
    # ３. トップ画面へリダイレクト
    redirect_to admin_product_genres_path
  end



  def edit
    @product_genre=ProductGenre.find(params[:id])
  end

  def update
    @genre=ProductGenre.find(params[:id])
    @genre.update(product_genre_params)
    redirect_to admin_product_genres_path
  end

  def destroy
  @product_genre = ProductGenre.find(params[:id])
  @product_genre.destroy
  redirect_to admin_product_genres_path
  end

  private
  def product_genre_params
  params.require(:product_genre).permit(:name, :genre_status)
  end


end


