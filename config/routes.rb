Rails.application.routes.draw do


  namespace :admin do
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  scope module: :public do
    get 'addresses', to: 'addresses#index'
    get 'addresses/:id/edit', to: 'addresses#edit'
    post 'addresses', to: 'addresses#create'
    patch 'addresses/:id', to: 'addresses#update'
    delete 'addresses/:id', to: 'addresses#destroy'
  
  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      post 'confirm'  
      get 'thanks'  
    end
  end 
  
    get 'cart_items', to: 'cart_items#index'
    patch 'cart_items/:id', to: 'cart_items#update'
    delete 'cart_items/:id', to: 'cart_items#destroy'
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    post 'cart_items', to: 'cart_items#create'
  end 


  devise_for :customers

  root to: "homes#top"
  get "/about" => "homes#about"
  
  get "customers/my_page/:id" => "customers#show", as: 'customer'
  get "customers/information/:id" => "customers#edit",as: 'edit_customer'
  patch "customers/my_page/:id" => "customers#update"
  get "/customers/unsubscribe" => "customers#unsubscribe", as: 'unsubscribe_customer'
  patch "/customers/withdraw" => "customers#withdraw", as: 'withdraw_customer'
  
  devise_for :admins

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
