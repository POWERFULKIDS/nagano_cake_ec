Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    

	namespace :admin do
  	root to: 'admins#top'
  	end

    namespace :admin do
    resources :product_genres, only: [:index ,:create, :edit, :update]
    end
    
    namespace :admin do
    resources :products
    end

    namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    end

    namespace :admin do
    resources :orders, only: [:index, :show, :update]
    end

    namespace :admin do
    resources :ordered_products, only: [:update]
    end



    #============adminとpublicの分かれ目===============

    scope module: :public do
    root to: 'products#top'
  	end

  	scope module: :public do
    resources :products, only: [:index, :show]
    end

    scope module: :public do
    get "customers/delete_page" => "customers#delete_page"
    patch "customers/withdraw" => "customers#withdraw"
    resources :customers, only: [:show,:edit,:update]
    end

    scope module: :public do
    delete "cart_products/destroy_all" => "cart_products#destroy_all"
    resources :cart_products, only: [:index, :create, :update, :destroy]
    
    end

    scope module: :public do
    resources :orders, only: [:index, :create, :new, :show]
    get "orders/comfirm" => "orders#comfirm"
    get "orders/thanks" => "orders#thanks"
    end

    scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    end


end
