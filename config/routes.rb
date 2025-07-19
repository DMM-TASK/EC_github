Rails.application.routes.draw do
  namespace :public do
    get 'addresses', to: 'addresses#index'
    get 'addresses/:id/edit', to: 'addresses#edit'
    post 'addresses', to: 'addresses#create'
    patch 'addresses/:id', to: 'addresses#update'
    delete 'addresses/:id', to: 'addresses#destroy'
  end
  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      post 'confirm'  
      get 'thanks'   
    end
  end
  namespace :public do
    get 'cart_items', to: 'cart_items#index'
    patch 'cart_items/:id', to: 'cart_items#update'
    delete 'cart_items/:id', to: 'cart_items#destroy'
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    post 'cart_items', to: 'cart_items#create'
  end (Add Devise)
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
