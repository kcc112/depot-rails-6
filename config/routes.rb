Rails.application.routes.draw do
  root 'store#index', as: 'store_index'
  resources :line_items, only: [:create, :destroy]
  resources :carts, only: [:show, :destroy]
  resources :orders, only: [:show, :new, :create]
  resources :users

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :products do
    get :who_bought, on: :member
  end
end
