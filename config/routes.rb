Rails.application.routes.draw do
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
  get "customers/my_page/:id" => "customers#show", as: 'customers_my_page'
  get "customers/information/:id" => "customers#edit",as: 'customers_information'
  patch "customers/my_page/:id" => "customers#update"
  get "/customers/unsubscribe" => "customers#unsubscribe"
  patch "/customers/withdraw" => "customers#withdraw"

end

  devise_for :admins
  devise_for :users
end