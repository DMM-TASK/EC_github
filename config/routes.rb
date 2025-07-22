Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'  
        get 'thanks'  
    end
  end 
  
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete 'destroy_all'
    end
    get 'cart_items', to: 'cart_items#index'
    patch 'cart_items/:id', to: 'cart_items#update'
    delete 'cart_items/:id', to: 'cart_items#destroy'
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    post 'cart_items', to: 'cart_items#create'
  end 

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  registrations: 'admins/registrations',
  passwords: 'admins/passwords'
 }

  root to: "homes#top"
  resources :items, only: [:show, :index] 
  get "/about" => "homes#about"
  get "customers/my_page/:id" => "customers#show", as: 'customer'
  get "customers/information/:id/edit" => "customers#edit", as: 'edit_customer'
  patch "customers/my_page/:id" => "customers#update", as: 'update_customer'
  get "/customers/unsubscribe" => "customers#unsubscribe", as: 'unsubscribe_customer'
  patch "/customers/withdraw" => "customers#withdraw", as: 'withdraw_customer'
 end
end
