Rails.application.routes.draw do


  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update] do
      resources :orders, only: [:index]
    end 
  end

  scope module: :public do

    root to: "homes#top"
    resources :items, only: [:index, :show]

    get "/about" => "homes#about"

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
    end


    get 'cart_items', to: 'cart_items#index'
    patch 'cart_items/:id', to: 'cart_items#update'
    delete 'cart_items/:id', to: 'cart_items#destroy'
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    post 'cart_items', to: 'cart_items#create'
  

    get "/about" => "homes#about"
  

  end

  devise_for :customers, controllers: {
    registrations: "publics/registrations",
    sessions: 'publics/sessions',
    passwords: 'publics/passwords'
  }

  devise_for :admins, controllers: {

  sessions: 'admins/sessions',
  registrations: 'admins/registrations',
  passwords: 'admins/passwords'

  }


  get "/about" => "public/homes#about"
  get "customers/my_page/:id" => "public/customers#show", as: 'customer'
  get "customers/information/:id/edit" => "public/customers#edit", as: 'edit_customer'
  patch "customers/my_page/:id" => "public/customers#update", as: 'update_customer'
  get "/customers/unsubscribe" => "public/customers#unsubscribe", as: 'unsubscribe_customer'
  patch "/customers/withdraw" => "public/customers#withdraw", as: 'withdraw_customer'
  
end