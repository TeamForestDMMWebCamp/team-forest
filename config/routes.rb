Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :admin do
    resources :ordered_products, only: [:update]
  end

  namespace :admin do
    resources :orders, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:create, :index, :edit, :update]
  end

  namespace :admin do
    root to: 'top#top'
  end

  scope module: :public do
    get 'orders/information'
    post 'orders/confirm'
    get 'orders/thanks'
    resources :orders, only: [:create, :index, :show, :new]
  end

  scope module: :public do
    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  scope module: :public do
    get 'customers/quit'
    patch 'customers/out'
    resources :customers, only: [:show, :edit, :update]
  end

  scope module: :public do
    resources :cart_products, only: [:index, :create, :destroy, :update]
    delete 'cart_products' => 'cart_products#destroy_all'
  end

  namespace :admin do
    resources :products, only: [:index, :create, :destroy, :update, :show, :edit]
  end

  scope module: :public do
    resources :products, only: [:index, :show]
    get 'products/:genre_id' => 'products#genre'
    root 'products#top'
    get 'products/about'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
