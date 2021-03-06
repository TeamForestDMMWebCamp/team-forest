Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  scope module: :public do
    get 'customers/quit'
    patch 'customers/out'
    resource :customers, only: [:show, :edit, :update]
  end

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
    resources :cart_products, only: [:index, :create, :destroy, :update]
    delete 'cart_products' => 'cart_products#destroy_all'
  end

  namespace :admin do
    resources :products, only: [:index, :create, :new, :update, :show, :edit]
  end

  scope module: :public do
    root 'products#top'
    get 'about' => 'products#about'
    get 'products/genre/:genre_id' => 'products#genre', as: "genre"
    resources :products, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
